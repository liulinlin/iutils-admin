package com.david.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.david.common.service.CrudService;
import com.david.sys.dao.IMsgSendDao;
import com.david.sys.entity.MsgSend;

/**
* 消息发送表 Service层
* @author david.cn
* @version 1.0
*/
@Service
@Transactional(readOnly = true)
public class MsgSendService extends CrudService<IMsgSendDao, MsgSend> {

}
