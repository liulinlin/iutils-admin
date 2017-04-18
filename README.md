# iutils-admin V2.2
程序员工具之基础平台建设
本项目的思路来源于[《跟我学Shiro》系列教程](http://jinnianshilongnian.iteye.com/blog/2018398)，并借鉴了[JeeSite](https://git.oschina.net/thinkgem/jeesite)项目中好的思路，在此感谢为开源事业做出贡献的组织和个人

# 平台功能点
- 用户登录注册，个人信息设置
- 系统运行状况监控
- 用户管理
- 组织机构管理
- 资源菜单管理
- 角色权限管理
- 动态任务调度
- 在线会话监听
- 系统日志监听
- 公共配置管理
- 功能菜单快速检索
- 站内信和站内通知

# 涉及到的技术
- Spring Framework 主框架
- SpringMVC 结构框架
- Apache Shiro 安全框架
- MyBatis ORM框架
- Druid 数据库连接池
- Quartz 动态任务调度框架
- Apache Solr 分布式全文搜索引擎
- Log4j 日志管理
- Activiti 流程引擎框架
- Amaze UI 前端显示框架
- Jquery js代码库
- Vue js代码库
- layer 前端弹出框
- FreeMarker 前端渲染模板引擎
- jstl 前端标签库
- json|xml 数据格式传输
- Maven 项目构建管理
- Mysql|Oracle|SqlServer 数据库
- eclipse|IDEA代码编辑器
- svn|git 代码版本管理工具

#项目文档
访问地址：[http://iutils.cn/f/144/87/detail.html](http://iutils.cn/f/144/87/detail.html)

#系统演示
访问地址：[http://demo.iutils.cn](http://demo.iutils.cn)
- 演示账号：super/123456
- 演示环境，请不要随意修改密码，有任何问题可以加QQ群：460229964交流。

#本地启动
访问地址：[http://127.0.0.1:8080/a](http://127.0.0.1:8080/a)
- 初始账号：super/123456
- 有任何问题可以加QQ群：460229964交流。

#系统截图
![登录界面截图](https://github.com/iutils/iutils-admin/blob/master/doc/img/登录界面截图.png)

![主界面截图](https://github.com/iutils/iutils-admin/blob/master/doc/img/主界面截图.png)

![用户管理截图](https://github.com/iutils/iutils-admin/blob/master/doc/img/用户管理截图.png)

![资源管理截图](https://github.com/iutils/iutils-admin/blob/master/doc/img/资源管理截图.png)

![系统日志截图](https://github.com/iutils/iutils-admin/blob/master/doc/img/系统日志截图.png)

#项目引用
```
<!-- 引入iutils基础平台库 -->
<dependency>
     <groupId>cn.iutils</groupId>
     <artifactId>iutils-admin</artifactId>
     <version>2.2-SNAPSHOT</version>
     <classifier>lib</classifier>
</dependency>
<dependency>
    <groupId>cn.iutils</groupId>
    <artifactId>iutils-admin</artifactId>
    <version>2.2-SNAPSHOT</version>
    <type>war</type>
</dependency>
```
