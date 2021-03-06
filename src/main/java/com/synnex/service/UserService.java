package com.synnex.service;

import java.util.List;

import com.synnex.dao.Order;
import com.synnex.model.Course;
import com.synnex.model.User;

public interface UserService {
	/**
	 * ----是否应该添加个类或者修改大分类类来对学员进行分组？ 包括用户的（单个、批量）增删改查-管理员专属 包括用户自己修改密码
	 * 
	 */
	/**
	 * 新建一个User对象
	 * 
	 * @param user
	 */
	public void addUser(User user);

	/**
	 * 批量新建User对象（应用场景-讲师输入学员名字批量建用户并发邮件通知）
	 * 
	 * @param users
	 */
	public void addUsers(List<User> users);

	/**
	 * 删除/冻结一个用户（应用场景-培训学员离职，或者不再参加培训等）
	 * 
	 * @param user
	 */
	public void deleteUser(User user);

	/**
	 * 批量删除/冻结/转存一批用户（应用场景-一批学员毕业）
	 * 
	 * @param users
	 */
	public void deleteUsers(List<User> users);

	/**
	 * 更新一个学员的信息(讲师维护)
	 * 
	 * @param user
	 */
	public void updateUser(User user);

	/**
	 * 批量更新学员信息（应用场景-新建学员时勾选多个然后一起分配到某一部门）
	 * 
	 * @param users
	 */
	public void updateUsers(List<User> users);

	/**
	 * 根据编号查学员
	 * 
	 * @param id
	 *            （此编号为系统内部编号，对所有人透明）
	 * @return
	 */
	public User getUser(Integer id);

	/**
	 * 根据名字搜索
	 * 
	 * @param condition
	 * @param order
	 * @param startpage
	 * @param pagesize
	 * @return
	 */
	public List<User> listByNameSimilar(User condition, List<Order> orders, int startpage, int pagesize);

	/**
	 * 
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return user对象
	 */
	public User checkLogin(String username, String password);

	/**
	 * 根据名字找‘讲师’
	 * 
	 * @param loginname
	 * @return
	 */
	public User findTranerbyName(String loginname);

	/**
	 * 获取所有的非培训管理员的用户
	 * 
	 * @return
	 */
	public List<User> getAllUsers();

	/**
	 * 根据loginname找user
	 * 
	 * @param loginname
	 * @return
	 */
	public User gettraineeByName(String loginname);

	/**
	 * 找到该学期的所有学员
	 * 
	 * @param term_id
	 * @return
	 */
	public List<User> findAllTraineeInTerm(int course_id);

	/**
	 * 给这个课程下的所有学生发邮件
	 * 
	 * @param courseId
	 */
	public void sendPracticeMailToTrainee(Course course);

	/**
	 * 查询user带分页
	 * 
	 * @param page
	 * @param pagesize
	 * @param searchKey TODO
	 * @return
	 */
	public com.synnex.model.PageResult<User> listUserPage(Integer page, int pagesize, String searchKey);
}
