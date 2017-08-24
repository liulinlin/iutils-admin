package com.david.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.david.common.service.CrudService;
import com.david.sys.dao.IOrganizationDao;
import com.david.sys.entity.Organization;

/**
 * 组织机构服务
 * 
 * @author David
 */
@Service
@Transactional(readOnly = true)
public class OrganizationService extends CrudService<IOrganizationDao, Organization> {

    /**
     * 查询是否存在下级节点
     * @param organization
     * @return
     */
    public int findNext(Organization organization){
        return dao.findNext(organization);
    }

}
