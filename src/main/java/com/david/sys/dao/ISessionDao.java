package com.david.sys.dao;

import com.david.common.ICrudDao;
import com.david.common.annotation.MyBatisDao;
import com.david.sys.entity.Session;

/**
* session管理 DAO接口
* @author david.cn
* @version 1.0
*/
@MyBatisDao
public interface ISessionDao extends ICrudDao<Session> {

}
