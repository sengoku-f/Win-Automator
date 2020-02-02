# Win-Automator
🚀 Windows 自动化程序和工作流程！

我的高效 Win 的收藏夹脚本和工作流集合！

**包括不限于以下功能:**

* 批量压制视频
* 图片格式转码
* 视频下载([YouTube](www.youtube.com); [bilibili](https://www.bilibili.com/) 等网站)
* 更多…..

## 安装:  
[下载文件](https://github.com/sengoku-f/Win-Automator/archive/master.zip)进行解压并正确安装依赖软件。

双击运行 bat ，或者将文件拖到 bat 上面自动运行。

你可以将常用 bat 脚本放入 Windows 右键 `发送到 `文件夹中：

> 只需将 bat 脚本文件复制到`C:\Users\<你的用户名>\AppData\Roaming\Microsoft\Windows\SendTo`
>
> > 打开 Win10 文件资源管理器窗口，然后在资源管理器窗口的地址栏中输入 `shell:sendto` ，回车即可打开 “SendTo（发送到）” 目录。


### 依赖软件:

部分脚本需要以下依赖项:

* **[FFmpeg](https://www.ffmpeg.org/)** 1.0 或以上 (视频转换)
* **[Imagemagick](https://www.imagemagick.org/)** 6.0 或以上 (图片处理)
* **[UnxUtils](http://unxutils.sourceforge.net/)** GNU 实用工具
* (可选)[Gifsicle](https://www.lcdf.org/gifsicle/) gif 图片压缩
* (可选)[Youtube-dl](https://github.com/ytdl-org/youtube-dl) 从视频网站下载视频
* (可选)[ghostscript](https://www.ghostscript.com/) 处理矢量图像
* (可选)[ffmpeg-normalize](https://github.com/slhck/ffmpeg-normalize) 使用ffmpeg批量标准化音频

### 选项 1：通过 [scoop](https://scoop.sh/) 安装（推荐）

您可以通过以下方式轻松安装：

``` powershell
scoop install 'ffmpeg' 'ImageMagick' 'UnxUtils' 'gifsicle' 'youtube-dl' 'ghostscript'
```
### 选项 2：自行下载安装

自行去软件官网下载可执行程序进行安装，并将其目录加入 `PATH`.

### 选项 3：通过 [chocolatey](https://chocolatey.org/) 安装

您可以通过以下方式轻松安装：

``` powershell
choco install 'ffmpeg' 'ImageMagick' 'UnxUtils' 'gifsicle' 'youtube-dl' 'ghostscript'
```

## 使用方法

### 快速入门

- 将 bat 脚本与文件放在同一目录下，双击运行 bat
- 将 bat 脚本与文件放在同一目录下，将文件拖到 bat 上面自动运行
- 将 bat 脚本放入 Windows 右键 `发送到 `文件夹中，选中文件右键>发送到>bat 脚本

### 图像序列帧转MP4

帮助转换PNG&JPG序列帧为x264编码的MP4格式的bat批处理脚本

脚本包含以下几种，分别用于不同的环境：

|                 名称                 | 作用                                               |
| :----------------------------------: | :------------------------------------------------- |
|          0-Image序列帧#MP4           | 转换 PNG & JPG 序列帧为 x264 编码的 MP4            |
|       0-Image序列帧#MP4#自定义       | 支持自定义参数，例如帧速率 FPS                     |
|        0-Image序列帧#MP4 v0.1        | 不需要安装 `UnxUtils` |
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
-  `0-Image序列帧#MP4 v0.1.bat` 是**递归**操作，深度遍历指定路径下的所有文件，子目录中的文件也会被遍历到，建议放入序列帧文件夹中执行

### 视频处理

帮助转码压制任意视频格式为x264编码的MP4格式的bat批处理脚本

脚本包含以下几种，分别用于不同的环境：

|                 名称                 | 作用                                               |
| :----------------------------------: | :------------------------------------------------- |
|  1-FFmpeg#normalize视频响度均衡.bat  | 批量将当前目录下所有MP4的音频音量大小统一化 |
|  1-FFmpeg#normalize音频响度均衡.bat  | 批量将当前目录下所有 **mp3 wav** 音频的音量大小统一化 |
| 1-FFmpeg#修改尺寸并裁剪视频#单独.bat | 修改尺寸并裁剪视频 |
|   1-FFmpeg#批量修改分辨率#单独.bat   | 修改视频分辨率并从中心裁剪特定尺寸 |
|     1-FFmpeg#批量修改分辨率.bat      | 修改视频分辨率 (默认缩小**1/4**) |
|      1-FFmpeg#批量提取音频.bat       | 批量提取当前文件夹下视频的音频 |
|       1-FFmpeg#批量转换mov.bat       | 批量转换 x264 MP4 视频为 MOV |
|   1-FFmpeg#批量转码x264#自定义.bat   | 批量压缩视频转码x264 (自定义参数) |
|      1-FFmpeg#批量转码x264.bat       | 批量压缩视频转码x264 (**720P**) |
|    1-FFmpeg#背景叠加模糊#预览.bat    | 预览背景模糊效果 |
|      1-FFmpeg#背景叠加模糊.bat       | 添加背景模糊效果 |
|      1-FFmpeg#裁剪视频#单独.bat      | 按尺寸从中心裁剪视频 |
|      1-FFmpeg#音频响度均衡.bat       | 批量将当前目录下所有MP4的音频音量大小统一化 (不需要 **ffmpeg-normalize** 依赖) |
|            1-MP4-GIF.bat            | MP4 视频转换为 GIF 动画 |
|        1-MP4-PNG-GIF-480p.bat        | MP4 视频转换为 GIF 动画 (**480P**) |
|          1-MP4-PNG-GIF.bat           | MP4 视频转换为 GIF 动画 |
|            1-MP4-PNG.bat             | MP4 视频转换为 PNG 序列帧 |

**注意：**

- 带有 `单独` 标注的bat批处理，一次仅能处理一个文件

- `FFmpeg` 是必需的依赖项，用于将视频转码成MP4

- `Gifsicle` 是可选依赖项，用于压缩创建的 GIF 动画图像

- `ffmpeg-normalize` 是可选依赖项，用于平衡多个视频的音频音量，`ffmpeg-normalize`通过以下方式轻松安装(需要 `Python` 2.7或3):

  ```bash
  pip3 install ffmpeg-normalize
  ```

- 如果你不想安装 `normalize` 在你的电脑上，你可以使用 `1-FFmpeg#音频响度均衡.bat` 

- 部分脚本仅处理 `MP4` 文件，需要其他格式如 `avi`/`mkv`/`mov` 等请自行修改 bat 脚本

### 图片处理

帮助快速进行图片处理的bat批处理脚本

脚本包含以下几种，分别用于不同的环境：

|            名称            | 作用                                           |
| :------------------------: | :--------------------------------------------- |
|       0-修剪PNG.bat        | 去除PNG透明部分，保留最小尺寸                  |
| 0-图片#PDF#文件夹命名.bat  | 所选图片转换为PDF以文件夹命名                  |
|  0-图片#PDF#时间命名.bat   | 所选图片转换为PDF以时间命名                    |
|       0-图片去白.bat       | 图片去除白色                                   |
| 0-图片去黑#color2alpha.bat | 图片去除黑色(过度柔和)                         |
|     0-图片缩小50%.bat      | 批量将图片尺寸缩小50%                          |
|     0-图片转为PNG.bat      | 任意图片转为PNG (可转换**PSD**/**AI**等源文件) |

**注意：**

- `Imagemagick` 是必需的依赖项，用于处理图片

- `ghostscript` 是可选依赖项，用于处理矢量图像，如果你不想安装 `ghostscript` 在你的电脑上，你将无法使用 `0-图片转为PNG.bat` 将矢量图像`ai`/`svg`转换为png


### 实例：

<img src="https://wx1.sinaimg.cn/large/b85b28acgy1gbi5wjm3w3g20vq0m8b29.gif" alt="2_800_lossy80.gif" style="zoom:100%;" />

<img src="https://wx1.sinaimg.cn/large/b85b28acgy1gbi5xfn24eg20ns0gob2c.gif" alt="3_600_lossy80.gif" style="zoom:100%;" />

### 注意事项

所有脚本能在 Windows 10 专业版 1803 上测试过，当你的电脑无法运行脚本；请排查是否包括（但不限于）以下几个问题：

- 是否已安装依赖项

- 是否已将依赖软件添加环境变量

- 文件名是否有特殊的字符包括（但不限于）: 

  `? * / \ < > : " | 空格符、制表符、退格符和字符 @ # $ & ( ) - 等`

- 运行的系统是 Windows ？

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
|       0-修剪PNG.bat        | 去除PNG透明部分，保留最小尺寸          |
| 0-图片#PDF#文件夹命名.bat  | 所选图片转换为PDF以文件夹命名         |
|  0-图片#PDF#时间命名.bat   | 所选图片转换为PDF以时间命名           |
|       0-图片去白.bat       | 图片去除白色                          |
| 0-图片去黑#color2alpha.bat | 图片去除黑色 (过度柔和)               |
|     0-图片缩小50%.bat      | 批量将图片尺寸缩小50%                 |
|     0-图片转为PNG.bat      | 任意图片转为PNG (可转换**PSD**/**AI**等源文件) |
|  1-FFmpeg#normalize视频响度均衡.bat  | 批量将当前目录下所有MP4的音频音量大小统一化 |
|  1-FFmpeg#normalize音频响度均衡.bat  | 批量将当前目录下所有 **mp3**/**wav** 音频的音量大小统一化 |
| 1-FFmpeg#修改尺寸并裁剪视频#单独.bat | 修改尺寸并裁剪视频 |
|   1-FFmpeg#批量修改分辨率#单独.bat   | 修改视频分辨率并从中心裁剪特定尺寸 |
|     1-FFmpeg#批量修改分辨率.bat      | 修改视频分辨率 (默认缩小**1/4**) |
|      1-FFmpeg#批量提取音频.bat       | 批量提取当前文件夹下视频的音频 |
|       1-FFmpeg#批量转换mov.bat       | 批量转换 x264 MP4 视频为 MOV |
|   1-FFmpeg#批量转码x264#自定义.bat   | 批量压缩视频转码x264 (自定义参数) |
|      1-FFmpeg#批量转码x264.bat       | 批量压缩视频转码x264 (**720P**) |
|    1-FFmpeg#背景叠加模糊#预览.bat    | 预览背景模糊效果 |
|      1-FFmpeg#背景叠加模糊.bat       | 添加背景模糊效果 |
|      1-FFmpeg#裁剪视频#单独.bat      | 按尺寸从中心裁剪视频 |
|      1-FFmpeg#音频响度均衡.bat       | 批量将当前目录下所有MP4的音频音量大小统一化 (不需要 **ffmpeg-normalize** 依赖) |
|        1-mozjpeg#压缩JPG.bat         | 使用 **mozjpeg** 压缩 JPG |
|            1-MP4-GIF.bat            | MP4 视频转换为 GIF 动画 |
|        1-MP4-PNG-GIF-480p.bat        | MP4 视频转换为 GIF 动画 (**480P**) |
|          1-MP4-PNG-GIF.bat           | MP4 视频转换为 GIF 动画 |
|            1-MP4-PNG.bat             | MP4 视频转换为 PNG 序列帧 |
|            2-Gif压缩.bat             | gifsicle 压缩 GIF 动画 |
|       3-After Effects渲染.bat        | After Effects 命令行多开渲染 |
|          3-获取文件属性.bat          | 获取文件属性 |
|         3-获取文件属性2.bat          | 获取文件属性2 |
|          去除文件名空格.bat          | 去除当前目录下所有文件名空格 |
|        批量执行 BAT 脚本.cmd         | 批量执行当前目录下所有 BAT 脚本 |
|        批量执行 BAT 脚本2.cmd        | 批量执行当前目录下所有 BAT 脚本2 |
|        批量替换文件名字符.bat        | 批量替换当前目录下所有文件名字符 |

## 作者
* SENGOKU donxj@live.com
* 如果出现问题可以联系我👆