package cn.iutils.sys.controller;

import cn.iutils.common.config.JConfig;
import cn.iutils.sys.dao.IDBSessionDAO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.iutils.common.Page;
import cn.iutils.common.utils.JStringUtils;
import cn.iutils.common.BaseController;
import cn.iutils.sys.entity.Session;
import cn.iutils.sys.service.SessionService;

/**
* session管理 控制器
* @author iutils.cn
* @version 1.0
*/
@Controller
@RequestMapping("${adminPath}/sys/session")
public class SessionController extends BaseController {

    @Autowired
    private SessionService sessionService;

    @Autowired
    private IDBSessionDAO sessionDAO;

    @ModelAttribute
    public Session get(@RequestParam(required = false) String id) {
        Session entity = null;
        if (JStringUtils.isNotBlank(id)) {
            entity = sessionService.get(id);
        }
        if (entity == null) {
            entity = new Session();
        }
        return entity;
    }

    @RequiresPermissions("sys:session:view")
    @RequestMapping()
    public String list(Model model, Page<Session> page) {
        model.addAttribute("page", page.setList(sessionService.findPage(page)));
        return "sys/session/list";
    }

    /**
     * 强制退出
     * @param pageNo
     * @param pageSize
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:session:forceLogout")
    @RequestMapping(value = "forceLogout", method = RequestMethod.GET)
    public String delete(Session dbSession,int pageNo,int pageSize, RedirectAttributes redirectAttributes) {
        org.apache.shiro.session.Session session = sessionDAO.readSession(dbSession.getId());
        if (session != null) {
            session.setAttribute(JConfig.SESSION_FORCE_LOGOUT_KEY,Boolean.TRUE);
        }
        addMessage(redirectAttributes, "强制退出成功");
        return "redirect:"+ adminPath +"/sys/session?pageNo="+pageNo+"&pageSize="+pageSize;
    }
}
