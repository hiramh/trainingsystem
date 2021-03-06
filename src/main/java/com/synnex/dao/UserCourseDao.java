package com.synnex.dao;

import java.util.List;

import com.synnex.model.PageResult;
import com.synnex.model.UserCourse;

public interface UserCourseDao extends GenericDao<UserCourse, Integer> {
	/**
	 * 根据课程查该课程的出勤情况
	 * 
	 * @param begin
	 * @param size
	 * @param courseid
	 * @return
	 */
	public PageResult<UserCourse> getUserCoursesByCourseid(int begin, int size, int courseid);

	/**
	 * 根据用户 查该用户的出勤情况
	 * 
	 * @param begin
	 * @param size
	 * @param user_id
	 * @return
	 */
	public PageResult<UserCourse> getUserCoursesByUserid(int begin, int size, int user_id);

	/**
	 * 根据courseid 和 userid查询该出勤记录是否存在
	 * 
	 * @param courseid
	 * @param userid
	 * @return
	 */
	public List<UserCourse> checkExist(int courseid, int userid);
}
