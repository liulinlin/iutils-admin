package com.david.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.david.common.ICrudDao;
import com.david.common.annotation.MyBatisDao;
import com.david.sys.entity.SLog;

/**
 * 日志记录 DAO接口
 * 
 * @author MyCode
 * @version 1.0
 */
@MyBatisDao
public interface ISLogDao extends ICrudDao<SLog> {

	/**
	 * 批量添加记录
	 * 
	 * @param logs
	 * @return
	 */
	public int saveBatch(@Param("logs") List<SLog> logs);

	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public int deleteAll(@Param("ids") String[] ids);

}
