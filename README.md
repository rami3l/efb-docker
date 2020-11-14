# EHForwarderBot for Docker

> Based on https://github.com/tinyRatP/Docker-Hub/tree/master/ehforwarderbot

## 这是什么

EHForwarderBot 是一款基于 Telegram 的聊天隧道框架，可以实现通过 Telegram 机器人收发微信和 QQ 消息。

## 使用条件

* 可访问 Telegram 的 VPS
* VPS 上可安装 Docker
* Telegram 帐号

## 如何使用

视频教程：[EhforwarderBot - 打通 QQ，Wechat 和 Telegram 的利器](https://www.bilibili.com/video/av46777579)

1. 通过 [BotFather](https://telegram.me/BotFather) 创建机器人，并获得 `Token`，并添加指令(注)。
2. 通过 [get_id_bot](https://telegram.me/get_id_bot) 获得 Telegram 帐号 `ID`
3. 将上述的 `Token` 和 `ID` 分别填写入 `profiles/blueset.telegram/config.yaml` 的 `Token` 和 `admins`
4. 执行 `docker-compose up -d`，并通过 `docker logs -f efb_master` 获得微信登录二维码
5. 扫描二维码，微信登录成功，即刻开始聊天

```text
需要添加的指令：

help - Show commands list.
link - Link a remote chat to a group.
unlink_all - Unlink all remote chats from a group.
info - Display information of the current Telegram chat.
chat - Generate a chat head.
extra - Access additional features from Slave Channels.
update_info - Update the group name and profile picture.
react - Send a reaction to a message, or show a list of reactors.
```

## 如何收发 QQ 消息

1. 取消 `profile/config.yaml` 中的 `milkice.qq` 注释
2. 分别修改 `docker-compose.yaml` 中的 `{{ your VNC password }}` `{{ COOLQ_ACCOUNT }}` 为你自己的 VNC 登录密码和 QQ 帐号
3. 执行 `docker-compose start cqhttp`
4. 访问 `{{ip}}:9801` 登录 QQ 帐号
5. 执行 `docker-compose restart efb_master` 重启 `efb_master`
6. 即刻开始微信和 QQ 聊天

## 缺点

通过 EFB 收发微信和 QQ 消息

它不能：

* 使用移动支付功能（转账，红包）
* 使用位置，语音以及视频等
* 无法主动加群以及主动添加好友（可被动处理）

## 相关文章

* [在Telegram上使用EFB同时推送QQ与微信消息](https://www.shawnleetttt.xyz/posts/f1bc687a/)
* [『技术流』Telegram Bot接管WeChat信息](https://51.ruyo.net/8054.html)
* [EFB V2 简明安装教程](https://www.appinn.com/efbv2-docker-tutorial/)
