goim v2.0
==============

goim is a im server writen by golang.

## 特性
 * 轻量级
 * 高性能
 * 纯Golang实现
 * 支持单个、多个、单房间以及广播消息推送
 * 支持单个Key多个订阅者（可限制订阅者最大人数）
 * 心跳支持（应用心跳和tcp、keepalive）
 * 支持安全验证（未授权用户不能订阅）
 * 多协议支持（websocket，tcp）
 * 可拓扑的架构（job、logic模块可动态无限扩展）
 * 基于Kafka做异步消息推送
 
## Architecture
![arch](./docs/arch.png)

## Quick Start

```bash
make build
make up
```

### Dependencies

- [Discovery](https://github.com/bilibili/discovery)
- [Kafka](https://kafka.apache.org/quickstart)


## Examples

- Websocket: [Websocket Client Demo](https://github.com/Terry-Mao/goim/tree/master/examples/javascript)
- Android: [Android](https://github.com/roamdy/goim-sdk)
- iOS: [iOS](https://github.com/roamdy/goim-oc-sdk)

## 文档
[push http协议文档](./docs/push.md) 推送接口
