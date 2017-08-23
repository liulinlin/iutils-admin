package com.david.sys.dao;

import com.david.common.ICrudDao;
import com.david.common.annotation.MyBatisDao;
import com.david.sys.entity.MsgSend;

/**
* 消息发送表 DAO接口
* @author david.cn
* @version 1.0
*/
@MyBatisDao
public interface IMsgSendDao extends ICrudDao<MsgSend> {

}
