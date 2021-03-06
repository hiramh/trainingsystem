package com.synnex.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.synnex.dao.Order;
import com.synnex.model.PageResult;
import com.synnex.model.User;
import com.synnex.utils.jsonUtil.JsonBean;
import com.synnex.utils.mailUtil.SendEmailThread;
import com.synnex.utils.md5Util.Md5Encode;
import com.synnex.utils.variable.SystemVariable;

@Controller
public class UserController extends GenericController {

	/**
	 * 由SpringMVC参数自动绑定到User 这里需要传递loginname、email、phoneno、role 不是很符合rest风格
	 * 
	 * @param user
	 */
	@ResponseBody
	@RequestMapping(value = "/admin/user/add", method = RequestMethod.POST)
	public JsonBean createUser(@RequestBody @Valid User user, BindingResult brt) {
		JsonBean jsonBean = null;
		User user2 = userServiceImpl.gettraineeByName(user.getLoginname());
		user.setPassword("000000");
		if (user2 != null) {
			brt.rejectValue("loginname", "", "该用户名已存在诶");
		}
		if (brt.hasErrors()) {
			List<FieldError> errors = brt.getFieldErrors();
			Map<String, String> mapErrors = new LinkedHashMap<String, String>();
			for (FieldError fieldError : errors) {
				mapErrors.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			jsonBean = new JsonBean(false, "添加失败！", mapErrors);
			return jsonBean;
		}
		userServiceImpl.addUser(user);
		jsonBean = new JsonBean(false, "添加成功！", null);
		// sendemail
		StringBuilder content = new StringBuilder("The account name is ");
		content = content.append(user.getLoginname()).append(" The password is ").append(user.getPassword())
				.append(" Please login system and modify the password as soon as possible");
		SendEmailThread sendcontent = new SendEmailThread("测试主题1", "davisz@synnex.com",
				"1这是正文<br/>单击用于翻译主题中字符串的按钮,您将进入字符串翻译页面,该页面只显示主题的文本。您可以选择具体要翻译的字符串或翻译所有缺少译文的字符串。主题和插件的专业翻译..");
		sendcontent.start();

		return jsonBean;
	}

	@RequestMapping(value = "/admin/user/show", method = RequestMethod.GET)
	public String showUsers(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "searchKey", required = false) String searchKey, Model model) {
		if (null == page || page < 1) {
			page = 1;
		}
		PageResult<User> pageResult = userServiceImpl.listUserPage(page, SystemVariable.PageSize, searchKey);
		model.addAttribute("pageResult", pageResult);
		return "/admin/user/show";
	}

	@RequestMapping(value = "/deleteuser")
	public String deleteUser(User user) {
		userServiceImpl.deleteUser(user);
		return "redirect:/admin/showusers";
	}

	/**
	 * 不知道页面传过来的对象用来保存会不会出问题？ 必须特殊处理密码部分
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/admin/user/updateuser")
	public String updateUser(User user) {
		User databaseuser = userServiceImpl.getUser(user.getId());
		user.setPassword(databaseuser.getPassword());
		userServiceImpl.updateUser(user);
		return "redirect:/admin/showusers";
	}

	@RequestMapping(value = "/admin/user/updatapass")
	public String changePassword(@Valid User user, BindingResult errors, String newpass, String passconfig) {
		if (errors.hasErrors()) {
			return "/admin/user/updatapass";
		}
		// 验证登录状态
		// 验证两次新密码
		Pattern pattern_newpass = Pattern.compile("^[a-zA-Z]\\w{5,15}$");
		boolean pattern_newpass_result = pattern_newpass.matcher(newpass).matches();
		if (pattern_newpass_result) {
			errors.rejectValue("newpass", "新密码必须是以字母开头的6-16位字符");
			return "/admin/user/updatapass";
		}
		if (!newpass.equals(passconfig)) {
			errors.rejectValue("passconfig", "两次输入的密码不匹配");
			return "/admin/user/updatapass";
		}
		// 验证原密码
		User databassuser = userServiceImpl.getUser(user.getId());
		String encodepass = Md5Encode.getStringMD5(user.getPassword());
		if (!encodepass.equals(databassuser.getPassword())) {
			// 返回原密码错误
			errors.rejectValue("password", "原密码不匹配");
			return "/admin/user/updatapass";
		}
		// 更新
		databassuser.setPassword(user.getPassword());
		userServiceImpl.updateUser(databassuser);
		// TODO 在修改页面弹出修改成功 即可
		return "/admin/user/updatapass";
	}

	@RequestMapping(value = { "/admin/user/search" }, method = { RequestMethod.POST })
	@ResponseBody
	public JsonBean searchTrainerByName(String loginname, @PathVariable(value = "termid") int termid, @PathVariable("groupid") int usergroupid) {
		User user = new User();
		user.setLoginname(loginname);
		Order order = Order.asc("loginname");
		List<Order> orders = new ArrayList<Order>();
		orders.add(order);
		List<User> users = userServiceImpl.listByNameSimilar(user, orders, 0, 8);
		JsonBean jsonBean = null;
		if (null != users && users.size() > 0) {
			jsonBean = new JsonBean(true, "" + users.size(), users);
		} else {
			jsonBean = new JsonBean(false, "没有记录", null);
		}
		return jsonBean;
	}

	@RequestMapping(value = "/trainee/group/view", method = RequestMethod.GET)
	public String showUserByGroup(HttpSession session, Model model) {
		User user = (User) session.getAttribute("USER_IN_SESSION");
		// List<User> users = userServiceImpl.findUsersInGroup(user.getId());
		return "/trainee/group/view";
	}
}
