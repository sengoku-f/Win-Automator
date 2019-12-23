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
* (可选)[ghostscript](https://www.ghostscript.com/) 处理矢量图像

### 选项 1：通过 [scoop](https://scoop.sh/) 安装

您可以通过以下方式轻松安装：

``` bash
scoop install 'ffmpeg' 'ImageMagick' 'UnxUtils' 'gifsicle' 'youtube-dl' 'ghostscript'
```
### 选项 2：自行下载安装

自行去软件官网下载可执行程序进行安装

## 使用方法

### 图像序列帧转MP4

帮助转换PNG&JPG序列帧为x264编码的MP4格式的bat批处理脚本

脚本包含以下几种，分别用于不同的环境：

|                 名称                 | 作用                                               |
| :----------------------------------: | :------------------------------------------------- |
|          0-Image序列帧#MP4           | 转换 PNG & JPG 序列帧为 x264 编码的 MP4            |
|       0-Image序列帧#MP4#自定义       | 支持自定义参数，例如帧速率 FPS                     |
|        0-Image序列帧#MP4 v0.1        | 不需要安装 `UnxUtils`                              |
|   0-Image序列帧#MOV RLE Alpha#单独   | 转换PNG序列帧为带有 **Alpha** 通道的 RLE 编码的MOV |
|   0-Image序列帧#MOV PNG Alpha#单独   | 转换PNG序列帧为带有 **Alpha** 通道的 PNG 编码的MOV |
|          0-PNG-MP4#上下通道| PNG序列帧分离 **Alpha** 通道；用于 **U3D** 抠像    |
|          0-PNG-MP4#左右通道| PNG序列帧分离 **Alpha** 通道；用于 **U3D** 抠像    |
|           0-PNG序列帧#GIF            | 转换 PNG 序列帧为 GIF 动画                         |

**注意：**

- 序列帧的命名请注意前导0，例如命名为 000.png、001.png … 010.png、011.png …
- `FFmpeg` 是必需的依赖项，用于将序列帧编码成MP4
- `UnxUtils` 是可选依赖项，用于创建列表文件输入到 FFmpeg 中
- 如果你不想安装 `UnxUtils` 在你的电脑上，你可以使用 `0-Image序列帧#MP4 v0.1.bat` ，在处理大量的文件上面它将比 `UnxUtils`  慢一点

### 视频处理

帮助转码压制任意视频格式为x264编码的MP4格式的bat批处理脚本

脚本包含以下几种，分别用于不同的环境：

|                 名称                 | 作用                                               |
| :----------------------------------: | :------------------------------------------------- |
|  1-FFmpeg#normalize视频响度均衡.bat  |                                                    |
|  1-FFmpeg#normalize音频响度均衡.bat  |                                                    |
| 1-FFmpeg#修改尺寸并裁剪视频#单独.bat |                                                    |
|   1-FFmpeg#批量修改分辨率#单独.bat   |                                                    |
|     1-FFmpeg#批量修改分辨率.bat      |                                                    |
|      1-FFmpeg#批量提取音频.bat       |                                                    |
|       1-FFmpeg#批量转换mov.bat       |                                                    |
|   1-FFmpeg#批量转码x264#自定义.bat   |                                                    |
|      1-FFmpeg#批量转码x264.bat       |                                                    |
|    1-FFmpeg#背景叠加模糊#预览.bat    |                                                    |
|      1-FFmpeg#背景叠加模糊.bat       |                                                    |
|      1-FFmpeg#裁剪视频#单独.bat      |                                                    |
|      1-FFmpeg#音频响度均衡.bat       |                                                    |
|            1-MP4-GIF.bat             |                                                    |
|        1-MP4-PNG-GIF-480p.bat        |                                                    |
|          1-MP4-PNG-GIF.bat           |                                                    |
|            1-MP4-PNG.bat             |                                                    |

**注意：**

- 带有 `单独` 标注的bat批处理，一次仅能处理一个文件

- `FFmpeg` 是必需的依赖项，用于将视频转码成MP4

- `Gifsicle` 是可选依赖项，用于压缩创建的 GIF 动画图像

- `ffmpeg-normalize` 是可选依赖项，用于平衡多个视频的音频音量，`ffmpeg-normalize`通过以下方式轻松安装(需要 `Python` 2.7或3):

  ```bash
  pip3 install ffmpeg-normalize
  ```

- 如果你不想安装 `normalize` 在你的电脑上，你可以使用 `1-FFmpeg#音频响度均衡.bat` 

### 图片处理

帮助快速进行图片处理的bat批处理脚本

脚本包含以下几种，分别用于不同的环境：
|            名称            | 作用                                  |
| :------------------------: | :------------------------------------ |
|       0-修剪PNG.bat        | 去除PNG透明部分,保留最小尺寸          |
| 0-图片#PDF#文件夹命名.bat  | 所选图片转换为PDF以文件夹命名         |
|  0-图片#PDF#时间命名.bat   | 所选图片转换为PDF以时间命名           |
|       0-图片去白.bat       | 图片去除白色                          |
| 0-图片去黑#color2alpha.bat | 图片去除黑色(过度柔和)                |
|     0-图片缩小50%.bat      | 批量将图片尺寸缩小50%                 |
|     0-图片转为PNG.bat      | 任意图片转为PNG(可转换PSD,AI等源文件) |

**注意：**

- `Imagemagick` 是必需的依赖项，用于处理图片

- `ghostscript` 是可选依赖项，用于处理矢量图像，如果你不想安装 `ghostscript` 在你的电脑上，你将无法使用 `0-图片转为PNG.bat` 将矢量图像`ai`/`svg`转换为png


### **实例：**

![2_1200_lossy80.gif](http://ws1.sinaimg.cn/large/b85b28acgy1g9sytwy23lg21bl0xckjm.gif)

![3_600_lossy80.gif](http://ww1.sinaimg.cn/large/b85b28acgy1g9txza8dq6g20ns0gob2c.gif)

### 注意事项

所有脚本能在 Windows 10 专业版 1803 上测试过，当你的电脑无法运行脚本；请排查是否包括（但不限于）以下几个问题：

- 是否已安装依赖项

- 是否已将依赖软件添加环境变量

- 文件名是否有特殊的字符包括（但不限于）: 

  `? * / \ < > : " | 空格符、制表符、退格符和字符 @ # $ & ( ) - 等`

- 运行的系统是Windows？

### 脚本列表
|                 名称                 | 作用                                               |
| :----------------------------------: | :------------------------------------------------- |
|          0-Image序列帧#MP4           | 转换 PNG & JPG 序列帧为 x264 编码的 MP4            |
|       0-Image序列帧#MP4#自定义       | 支持自定义参数，例如帧速率 FPS                     |
|        0-Image序列帧#MP4 v0.1        | 不需要安装 `UnxUtils`                              |
|   0-Image序列帧#MOV RLE Alpha#单独   | 转换PNG序列帧为带有 **Alpha** 通道的 RLE 编码的MOV |
|   0-Image序列帧#MOV PNG Alpha#单独   | 转换PNG序列帧为带有 **Alpha** 通道的 PNG 编码的MOV |
|          0-PNG-MP4#上下通道| PNG序列帧分离 **Alpha** 通道；用于 **U3D** 抠像    |
|          0-PNG-MP4#左右通道| PNG序列帧分离 **Alpha** 通道；用于 **U3D** 抠像    |
|           0-PNG序列帧#GIF            | 转换 PNG 序列帧为 GIF 动画                         |
|       0-修剪PNG.bat        | 去除PNG透明部分,保留最小尺寸          |
| 0-图片#PDF#文件夹命名.bat  | 所选图片转换为PDF以文件夹命名         |
|  0-图片#PDF#时间命名.bat   | 所选图片转换为PDF以时间命名           |
|       0-图片去白.bat       | 图片去除白色                          |
| 0-图片去黑#color2alpha.bat | 图片去除黑色(过度柔和)                |
|     0-图片缩小50%.bat      | 批量将图片尺寸缩小50%                 |
|     0-图片转为PNG.bat      | 任意图片转为PNG(可转换PSD,AI等源文件) |
|  1-FFmpeg#normalize视频响度均衡.bat  |                                                    |
|  1-FFmpeg#normalize音频响度均衡.bat  |                                                    |
| 1-FFmpeg#修改尺寸并裁剪视频#单独.bat |                                                    |
|   1-FFmpeg#批量修改分辨率#单独.bat   |                                                    |
|     1-FFmpeg#批量修改分辨率.bat      |                                                    |
|      1-FFmpeg#批量提取音频.bat       |                                                    |
|       1-FFmpeg#批量转换mov.bat       |                                                    |
|   1-FFmpeg#批量转码x264#自定义.bat   |                                                    |
|      1-FFmpeg#批量转码x264.bat       |                                                    |
|    1-FFmpeg#背景叠加模糊#预览.bat    |                                                    |
|      1-FFmpeg#背景叠加模糊.bat       |                                                    |
|      1-FFmpeg#裁剪视频#单独.bat      |                                                    |
|      1-FFmpeg#音频响度均衡.bat       |                                                    |
|        1-mozjpeg#压缩JPG.bat         |                                                    |
|            1-MP4-GIF.bat             |                                                    |
|        1-MP4-PNG-GIF-480p.bat        |                                                    |
|          1-MP4-PNG-GIF.bat           |                                                    |
|            1-MP4-PNG.bat             |                                                    |
|            2-Gif压缩.bat             |                                                    |
|       3-After Effects渲染.bat        |                                                    |
|          3-获取文件属性.bat          |                                                    |
|         3-获取文件属性2.bat          |                                                    |
|          去除文件名空格.bat          |                                                    |
|        批量执行 BAT 脚本.cmd         |                                                    |
|        批量执行 BAT 脚本2.cmd        |                                                    |
|        批量替换文件名字符.bat        |                                                    |

## 作者
* SENGOKU donxj@live.com
* 如果出现问题可以联系我👆