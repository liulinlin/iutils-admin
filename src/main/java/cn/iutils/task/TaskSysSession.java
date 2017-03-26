package cn.iutils.task;

import cn.iutils.sys.entity.Session;

/**
 * 默认系统Session处理
 * @author iutils.cn
 */
public class TaskSysSession extends TaskSession{

    /**
     * 开始执行
     */
    public void start(){
        super.run();
    }

    /**
     * 其他出来逻辑
     * @param session
     */
    @Override
    public void doOtherSession(Session session) {

    }

}
