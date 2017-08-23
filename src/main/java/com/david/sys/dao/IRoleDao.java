package com.david.sys.dao;

import com.david.common.ICrudDao;
import com.david.common.annotation.MyBatisDao;
import com.david.sys.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 权限Dao接口
 * 
 * @author cc
 */
@MyBatisDao
public interface IRoleDao extends ICrudDao<Role> {

    /**
     * 获取权限资源ID
     * @param roleIds
     * @return
     */
    public List<Role> getRoles(@Param("roleIds") String[] roleIds);

}
