## 视频转码小工具，基于 FFmpeg 的视频处理脚本

### 使用说明

拖动视频文件到 `VideoServer.bat`，按屏幕提示操作。
拖动序列帧文件夹到 `ImageServer.bat`，按屏幕提示操作。

`VideoServer.bat` 可接受多个输入文件拖入进行队列处理。

转码完成后 `output` 文件夹

#### 右键菜单

双击 `!安装右键服务.bat` 根据提示进行安装。

安装程序默认安装主程序到`user\bin`，安装服务菜单到 `C:\Users\<你的用户名>\AppData\Roaming\Microsoft\Windows\SendTo`

右键选择视频文件进行转码，`右键`>`发送到`>`视频转码x264`

<img src="https://wx3.sinaimg.cn/large/b85b28acgy1gf3v1ys4lfj20ns0m7aai.jpg" alt="右键菜单" style="zoom:50%;" />

### 卸载

双击 `!安装右键服务.bat` 根据提示进行卸载。

### 更新记录

2020-05-24

v1.2

1. 优化主程序大小，缩小了**50%**
2. 添加了右键菜单，一键起飞

2020-04-29
v1.1

1. 优化代码结构
2. 添加了一个自定义模式，可以自定义转码参数



2020-04-24
v1.0
1. 完成基本框架
2. 添加视频转码、视频转gif、提取音频和图像序列转MP4




- By Sengoku