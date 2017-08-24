package com.david.common.controller;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 基础控制器类
 *
 * @author David
 */
public abstract class BaseController {

    /**
     * lag
     */
    protected Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * adminPath
     */
    @Value("${adminPath}")
    protected String adminPath;

    /**
     * frontPath
     */
    @Value("${frontPath}")
    protected String frontPath;

    /**
     * restPath
     */
    @Value("${restPath}")
    protected String restPath;

    /**
     * urlSuffix
     */
    @Value("${urlSuffix}")
    protected String urlSuffix;

    /**
     * return json string
     *
     * @param response
     * @param object
     * @return
     */
    protected String renderString(HttpServletResponse response, Object object) {
        return renderString(response, JsonMapper.toJsonString(object), "application/json");
    }

    /**
     * Returns the data for JSONP
     *
     * @param response
     * @param object
     * @param callback
     * @return
     */
    protected String renderString(HttpServletResponse response, Object object, String callback) {
        return renderString(response, callback + "(" + JsonMapper.toJsonString(object) + ")", "application/text");
    }

    /**
     * return String
     *
     * @param response
     * @param string
     * @return
     */
    protected String renderString(HttpServletResponse response, String string, String type) {
        try {
            response.reset();
            response.setContentType(type);
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(string);
            return null;
        } catch (IOException e) {
            return null;
        }
    }

    /**
     * get remote ip
     */
    public static String getRemoteAddr(HttpServletRequest request) {
        String remoteAddr = request.getHeader("X-Real-IP");
        if (StringUtils.isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("X-Forwarded-For");
        } else if (StringUtils.isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("Proxy-Client-IP");
        } else if (StringUtils.isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("WL-Proxy-Client-IP");
        }
        return remoteAddr != null ? remoteAddr : request.getRemoteAddr();
    }

    /**
     * Model msg
     *
     * @param messages
     */
    protected void addMessage(Model model, String... messages) {
        StringBuilder sb = new StringBuilder();
        for (String message : messages) {
            sb.append(message).append(messages.length > 1 ? "<br/>" : "");
        }
        model.addAttribute("msg", sb.toString());
    }

    /**
     * Flash msg
     *
     * @param messages
     */
    protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
        StringBuilder sb = new StringBuilder();
        for (String message : messages) {
            sb.append(message).append(messages.length > 1 ? "<br/>" : "");
        }
        redirectAttributes.addFlashAttribute("msg", sb.toString());
    }

}
