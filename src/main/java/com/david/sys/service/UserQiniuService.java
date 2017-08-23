package com.david.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.david.common.service.CrudService;
import com.david.sys.dao.IUserQiniuDao;
import com.david.sys.entity.UserQiniu;

/**
 * 用户七牛配置 Service层
 * 
 * @author MyCode
 * @version 1.0
 */
@Service
@Transactional(readOnly = true)
public class UserQiniuService extends CrudService<IUserQiniuDao, UserQiniu> {

	/**
	 * 根据用户获取七牛配置
	 * 
	 * @param userId
	 * @return
	 */
	public UserQiniu getByUser(String userId) {
		return dao.getByUser(userId);
	}
}
