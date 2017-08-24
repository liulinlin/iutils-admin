package com.david.sys.dao;

import com.david.common.ICrudDao;
import com.david.sys.entity.User;
import org.apache.ibatis.annotations.Param;

import com.david.common.annotation.MyBatisDao;

import java.util.List;
import java.util.Map;

/**
 * 用户Dao接口
 * 
 * @author David
 */
@MyBatisDao
public interface IUserDao extends ICrudDao<User> {

	/**
	 * 根据用户名获取用户信息
	 * 
	 * @param username
	 * @return
	 */
	public User getUserByUserName(@Param("username") String username);

	/**
	 * 获取用户列表
	 * @param users
	 * @return
	 */
	public List<Map> getUsers(@Param("users") String[] users);

}
