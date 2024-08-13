## **一. 前言**
#### **1. Nacos**
随着微服务的流行，服务和服务之间的稳定性变得越来越重要。Sentinel 是面向分布式、多语言异构化服务架构的流量治理组件，主要以流量为切入点，从流量路由、流量控制、流量整形、熔断降级、系统自适应过载保护、热点流量防护等多个维度来帮助开发者保障微服务的稳定性。
官网地址：[http://sentinelguard.io/zh-cn/docs/introduction.html](http://sentinelguard.io/zh-cn/docs/introduction.html)

## **二. 部署说明**
#### **1. 端口及描述**
| **端口** | **与主端口的偏移量** | **描述** |
| --- | --- | --- |
| 8080 | 0 | Sentinel 控制台（Dashboard）的默认管理界面端口 |
| 8719 | 0 | Sentinel 客户端与 Sentinel 控制台之间进行通信的默认端口 |

#### **2. 环境变量**
| **环境变量** | **配置项** | **类型** | **默认值** | **最小值** | **描述** |
| --- | --- | --- | --- | --- | --- |
| AUTH_ENABLED | auth.enabled | boolean | true | - | 是否开启登录鉴权，仅用于日常测试，生产上不建议关闭 |
| SENTINEL_DASHBOARD_AUTH_USERNAME | sentinel.dashboard.auth.username | String | sentinel | - | 登录控制台的用户名，默认为 sentinel |
| SENTINEL_DASHBOARD_AUTH_PASSWORD | sentinel.dashboard.auth.password | String | sentinel | - | 登录控制台的密码，默认为 sentinel |
| SENTINEL_DASHBOARD_APP_HIDE_APP_NO_MACHINE_MILLIS | sentinel.dashboard.app.hideAppNoMachineMillis | Integer | 0 | 60000 | 是否隐藏无健康节点的应用，距离最近一次主机心跳时间的毫秒数，默认关闭 |
| SENTINEL_DASHBOARD_REMOVE_APP_NO_MACHINE_MILLIS | sentinel.dashboard.removeAppNoMachineMillis | Integer | 0 | 120000 | 是否自动删除无健康节点的应用，距离最近一次其下节点的心跳时间毫秒数，默认关闭 |
| SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS | sentinel.dashboard.unhealthyMachineMillis | Integer | 60000 | 30000 | 主机失联判定，不可关闭 |
| SENTINEL_DASHBOARD_AUTO_REMOVE_MACHINE_MILLIS | sentinel.dashboard.autoRemoveMachineMillis | Integer | 0 | 300000 | 距离最近心跳时间超过指定时间是否自动删除失联节点，默认关闭 |
| SERVER_SERVLET_SESSION_COOKIE_NAME | server.servlet.session.cookie.name | String | sentinel_dashboard_cookie | - | 控制台应用的 cookie 名称，可单独设置避免同一域名下 cookie 名冲突 |

## **三. 部署实操**
#### 1. 制作镜像
```
docker build -t caesartang/sentinel-dashboard:1.8.6 .
```

#### 2. 创建容器
```
docker run -d --restart=always --name sentinel-dashboard -p 8080:8080 -p 8719:8719 -e SENTINEL_DASHBOARD_AUTH_PASSWORD=123456 caesartang/sentinel-dashboard:1.8.6
```

#### 3. 访问控制台
```
http://localhost:8080/
账号：sentinel 密码：123456
```
