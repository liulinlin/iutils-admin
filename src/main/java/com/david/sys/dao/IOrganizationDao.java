package com.david.sys.dao;

import com.david.common.ICrudDao;
import com.david.common.annotation.MyBatisDao;
import com.david.sys.entity.Organization;

/**
 * 组织机构Dao
 * 
 * @author David
 */
@MyBatisDao
public interface IOrganizationDao extends ICrudDao<Organization> {

    /**
     * 查询是否存在下级节点
     * @param organization
     * @return
     */
    public int findNext(Organization organization);

}
