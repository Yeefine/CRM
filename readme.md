### 客户关系管理系统（CRM）

+ 系统开发环境以及版本

  + 操作系统：Windows_10
  + 集成开发工具：IntelliJ IDEA 2020.2.1
  + 编译环境：JDK_1.8
  + Web服务器：Tomcat_9.0
  + 数据库：MySQL_5.5.40

+ 系统框架

  + spring框架
  + springmvc框架
  + mybatis框架
  + maven框架

+ 系统关键性技术

  + Spring+Springmvc+Mybatis三大框架
  + Ajax技术

  + 条件查询结合分页查询
  + 线索转换
  + md5加密加盐

+ 注意事项
  + 项目数据库在一级目录中，命名为CRM.sql。
  + 项目登录账号：zs，密码123，密码经过md5加密加盐。
  + 登录页：如果是本地部署 http://localhost:8080/crm/login.jsp ,端口号以及项目名要与部署的环境一致
+ 开发过程异常错误解决方法
  + 使用bootstrap的日历插件时，对应的中文字符乱码，重新创建文件，复制并保存，替换原文件，注意编码格式为utf-8。
  + ssm框架中，使用listener加载数据字典时，需注意，ssm中使用spring注解的方式创建对象，监听器在web.xml中最先被执行，因此在监听器方法执行时，无法进行bean的自动注入，使用WebApplication.getBean(xxx.class)来创建对应的对象。
  + 在进行关联市场活动的操作中，报空指针异常。ajax请求的data格式不是json时，而是一个拼接的字符串，此时controller中对多个id相同的参数(`.../xxx.do?id=xxx&id=xxx&id=xxx`)的接受，需要使用`request.getParameterValues("id")`来获取数组对象，而不能直接在参数列表加入数组对象。

+ 部分页面

  + 登录页

    ![](https://raw.githubusercontent.com/Yeefine/picBed/master/20210710213407.png)

  + 市场活动

    ![](https://raw.githubusercontent.com/Yeefine/picBed/master/20210710213627.png)

  + 交易详细信息页

    ![](https://raw.githubusercontent.com/Yeefine/picBed/master/20210710220849.jpg)

  + 交易统计图表页

    ![](https://raw.githubusercontent.com/Yeefine/picBed/master/20210710214006.png)