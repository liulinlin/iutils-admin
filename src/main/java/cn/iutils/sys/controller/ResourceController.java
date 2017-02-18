package cn.iutils.sys.controller;

import cn.iutils.common.Page;
import cn.iutils.common.utils.UserUtils;
import cn.iutils.sys.service.UserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.iutils.common.controller.BaseController;
import cn.iutils.common.utils.JStringUtils;
import cn.iutils.sys.entity.Resource;
import cn.iutils.sys.entity.enums.ResourceEnum;
import cn.iutils.sys.service.ResourceService;

import java.util.List;

/**
 * 资源控制器
 * 
 * @author cc
 */
@Controller
@RequestMapping("${adminPath}/resource")
public class ResourceController extends BaseController {

	@Autowired
	ResourceService resourceService;

    @Autowired
    UserService userService;

	@ModelAttribute("types")
	public ResourceEnum[] resourceTypes() {
		return ResourceEnum.values();
	}

	@ModelAttribute
	public Resource get(@RequestParam(required = false) String id) {
		Resource entity = null;
		if (JStringUtils.isNotBlank(id)) {
			entity = resourceService.get(id);
		}
		if (entity == null) {
			entity = new Resource();
		}
		return entity;
	}

	/**
	 * 列表页
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:resource:view")
	@RequestMapping()
	public String list(Resource resource,Model model,Page<Resource> page) {
        Resource resource1 = new Resource();
        resource1.setType(ResourceEnum.menu);//树型数据，只看菜单
        List<Resource> resourceList = resourceService.findList(resource1);
        model.addAttribute("resourceList", resourceList);
        //初始化加载第一个
        if(JStringUtils.isBlank(resource.getId()) && resourceList.size()>0){
            resource.setId(resourceList.get(0).getId());
        }
        page.setEntity(resource);
        model.addAttribute("page", page.setList(resourceService.findPage(page)));
        return "sys/resource/list";
	}

    /**
     * 跳转到新增页
     * @param resource
     * @param model
     * @return
     */
    @RequiresPermissions("sys:resource:edit")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(Resource resource, Model model) {
        model.addAttribute("resource", resource);
        return "sys/resource/add";
    }

    /**
     * 跳转到修改页
     * @param resource
     * @param model
     * @return
     */
    @RequiresPermissions("sys:resource:edit")
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String update(Resource resource, Model model) {
        model.addAttribute("resourceList", resourceService.findList(resource));
        model.addAttribute("resource", resource);
        return "sys/resource/edit";
    }

    /**
     * 修改
     * @param resource
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:resource:edit")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Resource resource,
                         RedirectAttributes redirectAttributes) {
        resourceService.save(resource);
        addMessage(redirectAttributes, "修改成功");
        return "redirect:" + adminPath + "/resource/update?id="+resource.getId();
    }

    /**
     * 删除
     * @param resource
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:resource:edit")
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(Resource resource,int pageNo,int pageSize,
                         RedirectAttributes redirectAttributes) {
        if(!"1".equals(resource.getId())){
            resourceService.delete(resource);
            addMessage(redirectAttributes, "删除成功");
        } else {
            addMessage(redirectAttributes, "不能删除");
        }
        return "redirect:" + adminPath + "/resource/list?id="+resource.getParentId()+"&pageNo="+pageNo+"&pageSize="+pageSize;
    }

}
