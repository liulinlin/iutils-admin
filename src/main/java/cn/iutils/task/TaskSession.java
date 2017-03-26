package cn.iutils.task;

import cn.iutils.common.service.BaseService;
import cn.iutils.common.spring.SpringUtils;
import cn.iutils.sys.entity.Session;
import cn.iutils.sys.service.SessionService;

import java.util.List;

/**
 * 在线会话验证任务 抽象类 每个项目要实现
 * @author iutils.cn
 */
public abstract class TaskSession extends BaseService {

    /**
     * session服务
     */
    private SessionService sessionService = SpringUtils.getBean(SessionService.class);

    /**
     * 执行任务
     */
    public void run() {
        //处理会话
        doSession(new Session());
    }

    /**
     * 处理会话
     * @param dbSession
     * @return
     */
    private void doSession(Session dbSession){
        Session lastDbSession = new Session();
        List<Session> sessionList = sessionService.findList(dbSession);
        for (int i=0;i<sessionList.size();i++){
            Session session = sessionList.get(i);
            //获取当前时间
            long nowTime = System.currentTimeMillis();
            long lastTime = session.getUpdateDate().getTime();
            if(nowTime-lastTime>session.getTimeout()){
                //已过期，删除记录
                sessionService.delete(session.getId().toString());
                doOtherSession(session);
            }
            if(i==sessionList.size()-1){
                lastDbSession = sessionList.get(i);
            }
        }
        if(sessionList.size()==100){//每次处理100条
            //继续处理下页
            doSession(lastDbSession);
        }
    }

    /**
     *
     * @param session
     */
    public abstract void doOtherSession(Session session);

}
