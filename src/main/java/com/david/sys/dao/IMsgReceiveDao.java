package com.david.sys.dao;

import com.david.common.ICrudDao;
import com.david.common.annotation.MyBatisDao;
import com.david.sys.entity.MsgReceive;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* 消息接收表 DAO接口
* @author david.cn
* @version 1.0
*/
@MyBatisDao
public interface IMsgReceiveDao extends ICrudDao<MsgReceive> {

    /**
     * 批量添加记录
     * @param msgReceives
     * @return
     */
    public int saveBatch(@Param("msgReceives") List<MsgReceive> msgReceives);

    /**
     * 根据消息ID删除记录
     * @param msgId
     * @return
     */
    public int deleteByMsgId(@Param("msgId") String msgId);

}
