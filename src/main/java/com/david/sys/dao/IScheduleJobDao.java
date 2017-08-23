package com.david.sys.dao;

import com.david.common.ICrudDao;
import com.david.common.annotation.MyBatisDao;
import com.david.sys.entity.ScheduleJob;

/**
 * 任务调度 DAO接口
 * 
 * @author MyCode
 * @version 1.0
 */
@MyBatisDao
public interface IScheduleJobDao extends ICrudDao<ScheduleJob> {

	/**
	 * 更改任务状态
	 * 
	 * @param scheduleJob
	 * @return
	 */
	public int changeJobStatus(ScheduleJob scheduleJob);

}
