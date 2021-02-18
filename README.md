# 基本信息

Meal（一顿饭）意如其名，旨在节省一顿饭的时间。
本工程采用前后端分离的部署方式，服务端采用SpringBoot构建，前端采用Vue。
工程仅提供了一些基础支撑能力的构建，不包含其他的业务逻辑，旨在快速铺开一个新业务系统。

服务端工程地址：
[Gitee](https://gitee.com/mebugs/meal "Gitee")
[GitHub](https://github.com/mebugs/meal "GitHub")

前端工程地址：
[Gitee](https://gitee.com/mebugs/meal-ui "Gitee")
[GitHub](https://github.com/mebugs/meal-ui "GitHub")

## 特别致谢

Meal服务端使用[MyBatis-Plus](https://mybatis.plus/ "MyBatis-Plus")作为基础脚手架。
Meal服务端使用[jjwt](https://github.com/jwtk/jjwt "jjwt")实现JWT快速加解密。
Meal-ui前端工程Fork自[vue-admin-template](https://github.com/PanJiaChen/vue-admin-template "vue-admin-template")。
本人是JAVA服务端开发，[@花裤衩](https://github.com/PanJiaChen "@花裤衩")的前端系列开源项目为我学习Vue提供非常大的帮助，非常感谢！

# 功能清单

Meal工程仅提供了最基本的账号-角色支撑能力，没有涉及其他功能页面。

## 登陆页

![](http://www.mebugs.com/blog/upload/post/POST_1613612194.jpg)

## 工作中心

![](http://www.mebugs.com/blog/upload/post/POST_1613617287.jpg)

## 角色控制与多级菜单测试

![](http://www.mebugs.com/blog/upload/post/POST_1613612228.jpg)

## 个人密码管理

![](http://www.mebugs.com/blog/upload/post/POST_1613612265.jpg)

## 账号管理

![](http://www.mebugs.com/blog/upload/post/POST_1613612283.jpg)

![](http://www.mebugs.com/blog/upload/post/POST_1613612295.jpg)

![](http://www.mebugs.com/blog/upload/post/POST_1613612304.jpg)

## 代码生成

![](http://www.mebugs.com/blog/upload/post/POST_1613612318.jpg)

![](http://www.mebugs.com/blog/upload/post/POST_1613612326.jpg)

# 开发说明
## 服务端
### 外部依赖

1. JDK 1.8 已知可能持续使用很长时间的版本
2. MySql 5.7 经典版本
3. Redis 6.0 比较新的一个版本（实际上目前项目中对版本要求没有十分严格）

### 工程目录

![](http://www.mebugs.com/blog/upload/post/POST_1613612886.jpg)

### 核心类

 - MyBatisPlusConfig：MyBatis-Plus配置类，配置Mapper扫描位置、分页插件等。
 - RedisConfig：配置Redis为默认缓存工具及常见操作Bean配置。
 - CodeMakerUtils：代码生成器的执行类
 - JwtUserContext：JWT安全用户上下文对象（全局获取登录用户信息）
 - JwtFilter：Jwt过滤器，核心过滤器（登录、授权、拦截）
 - ExceptionHandler：全局异常捕获处理（AOP实现，支持自定义异常处理）
 - RoleInterceptor：角色拦截器（基于自定义注解@RolePermission实现鉴权）
 - EncryptionUtils：盐值加密工具（账号的密码生成，不可逆加密算法）

### 开发说明

1. 数据库初始化刷库
2. application-dev.yml配置您的数据库信息和redis信息（默认localhost）
3. 启动App类

启动示意图：
![](http://www.mebugs.com/blog/upload/post/POST_1613614733.jpg)

## 前端
### 外部依赖

1. Node.js（基本工具）
2. Git（多数前端工程依赖会需要调用Git下载）

### 工程目录

![](http://www.mebugs.com/blog/upload/post/POST_1613615776.jpg)

![](http://www.mebugs.com/blog/upload/post/POST_1613615784.jpg)

### 相对原本的改动

1. 移除Mocks模拟返回服务（调用meal服务端工程）
2. 移除测试模块以及相关依赖
3. 移除Cookies插件依赖，Cookies统一替换为window.localStorage
4. 补充动态路由由服务端返回的用户角色集Roles控制
5. 移除自定义icon（svg格式），替换为element-ui的图标，直接修改了Sidebar/Item.vue
6. 核心方法getUserBase获取用户基础信息src/store/modules/user.js getInfo()
7. 增加v-droll可以自由在屏幕范围内拖动弹窗（src/directive/droll.js）

### 启动界面

![](http://www.mebugs.com/blog/upload/post/POST_1613616164.jpg)

### 开发说明

```bash
# 依赖下载
npm install
# 开发模式
npm run dev
# 生产编译
npm run build
```

# 关于个人

[关于米虫先生](http://www.mebugs.com/some/about.html "关于米虫先生")
