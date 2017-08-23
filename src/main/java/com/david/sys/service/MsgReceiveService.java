package com.david.sys.service;

import com.david.common.service.CrudService;
import com.david.sys.entity.MsgReceive;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.david.sys.dao.IMsgReceiveDao;

import java.util.List;

/**
* 消息接收表 Service层
* @author david.cn
* @version 1.0
*/
@Service
@Transactional(readOnly = true)
public class MsgReceiveService extends CrudService<IMsgReceiveDao, MsgReceive> {

    /**
     * 批量添加记录
     * @param msgReceives
     * @return
     */
    @Transactional(readOnly = false)
    public int saveBatch(List<MsgReceive> msgReceives){
        return dao.saveBatch(msgReceives);
    }

    /**
     * 根据消息ID删除记录
     * @param msgId
     * @return
     */
    public int deleteByMsgId(String msgId){
        return dao.deleteByMsgId(msgId);
    }

}
