# Win-Automator
Windows自动化程序和工作流程!

我的高效 Win 的收藏夹脚本和工作流集合!

**包括不限于以下功能:**

* 批量压制视频
* 图片格式转码
* 视频下载([YouTube](www.youtube.com); [bilibili](https://www.bilibili.com/) 等网站)
* 更多…..

## 安装:  
下载文件进行解压;双击运行 bat ,或者将文件拖到 bat 上面自动运行

你可以将常用 bat 脚本放入 Windows 右键 `发送到 `文件夹中:

> 只需将 bat 脚本文件复制到`C:\Users\(你的用户名)\AppData\Roaming\Microsoft\Windows\SendTo`


### 依赖软件:

部分脚本需要以下依赖项:

* **[FFmpeg](https://www.ffmpeg.org/)** 1.0 或以上 (视频转换)
* **[Imagemagick](https://www.imagemagick.org/)** 6.0 或以上 (图片处理)
* **[UnxUtils](http://unxutils.sourceforge.net/)** GNU 实用工具
* (可选)[Gifsicle](https://www.lcdf.org/gifsicle/) gif 图片压缩
* (可选)[Youtube-dl](https://github.com/ytdl-org/youtube-dl) 从视频网站下载视频
* (可选)[Potrace](http://potrace.sourceforge.net/) 将位图转换为矢量

### 选项 1：通过 [scoop](https://scoop.sh/) 安装

您可以通过以下方式轻松安装：

``` bash
scoop install 'ffmpeg' 'ImageMagick' 'UnxUtils' 'gifsicle' 'youtube-dl' 'potrace'
```
### 选项 2：自行下载安装

自行去软件官网下载可执行程序进行安装

## 使用方法

### 图像序列帧转MP4

帮助转换PNG&JPG序列帧为x264编码的MP4格式的bat批处理脚本

脚本包含以下几种，分别用于不同的环境：

- 0-Image序列帧#MP4 v0.1.bat
- 0-Image序列帧#MP4.bat
- 0-Image序列帧#MP4#自定义.bat
- 0-Image序列帧#MOV RLE Alpha v1.3#单独.bat
- 0-Image序列帧#MOV PNG Alpha v1.3#单独.bat
- 0-PNG-MP4#上下通道.bat & 0-PNG-MP4#左右通道.bat

**实例：**

![2_1200_lossy80.gif](http://ws1.sinaimg.cn/large/b85b28acgy1g9sytwy23lg21bl0xckjm.gif)

![3_800_lossy80.gif](http://ws1.sinaimg.cn/large/b85b28acgy1g9sz2zy4qtg20vp0m8npi.gif)

**注意：**

- 序列帧的命名请注意前导0，例如命名为 000.png、001.png … 010.png、011.png …
- `FFmpeg` 是必需的依赖项，用于将序列帧编码成MP4
- `UnxUtils` 是可选依赖项，用于创建列表文件输入到 FFmpeg 中
- 如果你不想安装 `UnxUtils` 在你的电脑上，你可以使用 `0-Image序列帧#MP4 v0.1.bat` ，在处理大量的文件上面它将比 `UnxUtils`  慢一点


### 注意事项
所有脚本能在 Windows 10 专业版 1803 上测试过，当你的电脑无法运行脚本；请排查是否包括（但不限于）以下几个问题：

- 是否已安装依赖项

- 是否已将依赖软件添加环境变量

- 文件名是否有特殊的字符包括（但不限于）: 

  `? * / \ < > : " | 空格符、制表符、退格符和字符 @ # $ & ( ) - 等`

- 运行的系统是Windows？

### 脚本列表
|                 名称                  |                        作用                        |
| :-----------------------------------: | :------------------------------------------------: |
|           0-Image序列帧#MP4           |      转换 PNG & JPG 序列帧为 x264 编码的 MP4       |
|       0-Image序列帧#MP4#自定义        |           支持自定义参数，例如帧速率 FPS           |
|        0-Image序列帧#MP4 v0.1         |               不需要安装 `UnxUtils`                |
| 0-Image序列帧#MOV RLE Alpha v1.3#单独 | 转换PNG序列帧为带有 **Alpha** 通道的 RLE 编码的MOV |
| 0-Image序列帧#MOV PNG Alpha v1.3#单独 | 转换PNG序列帧为带有 **Alpha** 通道的 PNG 编码的MOV |
|          0-PNG-MP4#上下通道           |  PNG序列帧分离 **Alpha** 通道；用于 **U3D** 抠像   |
|          0-PNG-MP4#左右通道           |  PNG序列帧分离 **Alpha** 通道；用于 **U3D** 抠像   |
|            0-PNG序列帧#GIF            |             转换 PNG 序列帧为 GIF 动画             |
|                                       |                                                    |

## 作者
* SENGOKU donxj@live.com
* 如果出现问题可以联系我👆