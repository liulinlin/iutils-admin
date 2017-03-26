package cn.iutils.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.iutils.common.service.CrudService;
import cn.iutils.sys.dao.SessionDao;
import cn.iutils.sys.entity.Session;

/**
* session管理 Service层
* @author iutils.cn
* @version 1.0
*/
@Service
@Transactional(readOnly = true)
public class SessionService extends CrudService<SessionDao, Session> {

}
