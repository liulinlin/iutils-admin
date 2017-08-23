package com.david.sys.dao;

import com.david.common.ICrudDao;
import com.david.sys.entity.UserQiniu;
import org.apache.ibatis.annotations.Param;

import com.david.common.annotation.MyBatisDao;

/**
 * 用户七牛配置 DAO接口
 * 
 * @author MyCode
 * @version 1.0
 */
@MyBatisDao
public interface IUserQiniuDao extends ICrudDao<UserQiniu> {

	/**
	 * 根据用户获取七牛配置
	 * 
	 * @param userId
	 * @return
	 */
	public UserQiniu getByUser(@Param("userId") String userId);

}
