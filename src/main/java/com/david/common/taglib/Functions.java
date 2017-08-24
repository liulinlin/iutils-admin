package com.david.common.taglib;

import com.david.common.config.JConfig;
import com.david.common.spring.SpringUtils;
import com.david.common.utils.RelativeDateFormat;
import com.david.common.utils.UserUtils;
import com.david.sys.entity.Config;
import com.david.sys.entity.User;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.util.CollectionUtils;

import java.util.Collection;
import java.util.Date;

/**
 * 系统标签函数
 * 
 * @author David
 */
public class Functions {

	private static SessionDAO sessionDAO = SpringUtils.getBean(SessionDAO.class);

	/**
	 * 判断是否在集合中
	 * @param iterable
	 * @param element
	 * @return
	 */
	public static boolean in(Iterable<?> iterable, Object element) {
		if (iterable == null) {
			return false;
		}
		return CollectionUtils.contains(iterable.iterator(), element);
	}

	/**
	 * 获取在线用户列表
	 * @return
	 */
	public static Collection<Session> getOnlineUser(){
		Collection<Session> sessions = sessionDAO.getActiveSessions();
		return sessions;
	}

	/**
	 * 获取session 账号
	 * @param session
	 * @return
	 */
	public static String principal(Session session) {
		PrincipalCollection principalCollection = (PrincipalCollection) session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
		if (principalCollection == null)
			return "";
		else
			return (String) principalCollection.getPrimaryPrincipal();
	}

	/**
	 * 判断是否强制退出
	 * @param session
	 * @return
	 */
	public static boolean isForceLogout(Session session) {
		return session.getAttribute(JConfig.SESSION_FORCE_LOGOUT_KEY) != null;
	}

	/**
	 * 获取当前登录用户
	 * @return
	 */
	public static User getLoginUser(){
		return UserUtils.getLoginUser();
	}

	/**
	 * 获取config.properties配置文件
	 * @param key
	 * @return
	 */
	public static String getConfig(String key){
		return JConfig.getConfig(key);
	}


	/**
	 * 获取数据配置
	 * @param sysName
	 * @param moduleName
	 * @param configName
	 * @return
	 */
	public static Config getDBConfig(String sysName, String moduleName, String configName){
		return JConfig.getConfig(sysName, moduleName, configName);
	}

	/**
	 * 中文乱码解码
	 * @param key
	 * @return
	 */
	public static String urlDecode(String key){
		try{
			key = new String(key.getBytes("iso8859-1"),"utf-8");
		}catch (Exception e){}
		return key;
	}

	/**
	 * 时间格式化
	 * @param date
	 * @return
	 */
	public static String relativeDate(Date date){
		return RelativeDateFormat.format(date);
	}

}
