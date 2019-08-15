# flutter_ijkplayer_pod

[ijkplayer](https://github.com/bilibili/ijkplayer) for flutter

这个库有两个仓库镜像

[azure](https://dev.azure.com/cjlspy/_git/flutter_ijkplayer_pod)  
[github](https://github.com/CaiJingLong/flutter_ijkplayer_pod)

从 0.1.0 版本开始, pod 的 git 地址迁移至 azure

因为 azure 的中国境内访问速度略快于 github

github 100kb/s 以下, azure 1.5M/s 左右, 开代理的话相差不大

## 目的

主要是因为在 flutter 中将 framework 完整的上传 pub 感觉太大了

而国内的朋友们访问 pub，github 之类的网站普遍网速不太好，所以采用 pod 依赖，并且 pod 支持 xz 这样高压缩率的压缩格式，将 150M 左右的 framwork 压缩至 30M 左右

## about framework

使用 https://github.com/jadennn/flutter_ijk 项目中提供的源码的基础上进行修改编译而成, 这部分源码的修改按原作者 issue 解释,基于 MIT 协议

额外修改如下:

- 加入了视频角度旋转后的通知,以便于 flutter 端能及时获取视频方向
- 按照 https://github.com/bilibili/ijkplayer/issues/3643#issuecomment-333274685 中提供的方法,增加了两处`[CATransaction flush]`的调用以支持 11.0 后的真机(亲测 12.1.4 真机可用)
- 增加了一个 tcp 速度的参数
- 截图相关的代码

完整代码可[查看这里](https://gitee.com/kikt/ijkplayer_thrid_party)

遵循 bilibili/ijkplayer 的编译方案进行编译

本项目自修改编译的完整配置文件可以查看 gitee 项目中的 `config/module.sh`文件

编译完成后在 framework 中加入了 openssl 以便于支持 https 协议

这里只是加入了一些相对常用的选项,如果你需要使用其他的选项或需要根据你自己的业务情况进行剪裁，你需要自行编译 ffmpeg

目前的库同时支持 iOS 真机和模拟器，是通用库, 但模拟器无图像(这里应该是模拟器的 bug)

## 完整编译方法

按顺序执行以下步骤一般都可以成功

这里前两步因为涉及到下载 openssl 和 ffmpeg,建议开启 vpn,因为这两个东西都很大,我这里 vpn 的话 5 分钟不到两个都能下完,如果你没有 vpn,两小时不保证能完成下载步骤

如果是 ss/ssr 请自己查询如何代理终端(我这里是输入  
`$ export http_proxy=http://127.0.0.1:1081;export https_proxy=http://127.0.0.1:1081;`)

clone 项目,这个我放在 gitee 了
`$ git clone https://gitee.com/kikt/ijkplayer_thrid_party ijkplayer`

这里根据你需要的编译选项修改`module.sh`,根据自己的需要来剪裁可以有效降低应用包体积

如果你需要一个相对通用的播放器,你可以用`module-default.sh`的内容替换掉`module.sh`的内容,这样包体积会很大

```bash
cd ijkplayer
./init-ios-openssl
./init-ios.sh
cd ios
./compile-openssl.sh clean
./compile-ffmpeg.sh clean
./compile-openssl.sh all
./compile-ffmpeg.sh all
open ./IJKMediaPlayer/IJKMediaPlayer.xcodeproj
```

接着在 xcode 里操作

1. 修改项目为 IJKMediaFrameWork
   ![img](https://raw.githubusercontent.com/CaiJingLong/asset_for_picgo/master/20190322205338.png)
2. Edit Scheme
   ![img](https://raw.githubusercontent.com/CaiJingLong/asset_for_picgo/master/20190322205412.png)
3. 修改 Build Configuration 为 Release
   ![img](https://raw.githubusercontent.com/CaiJingLong/asset_for_picgo/master/20190322205454.png)

修改目标类型,选一个模拟器
![img](https://raw.githubusercontent.com/CaiJingLong/asset_for_picgo/master/20190322205548.png)
command+b 编译

修改目标类型,选这个
![img](https://raw.githubusercontent.com/CaiJingLong/asset_for_picgo/master/20190322205634.png)
command+b

![img](https://raw.githubusercontent.com/CaiJingLong/asset_for_picgo/master/20190322205727.png)

向上两级到 Product 级
![img](https://raw.githubusercontent.com/CaiJingLong/asset_for_picgo/master/20190322205839.png)

右键(control+左键)Products ,按住 option,拷贝为路径名称

接着打开命令行,这里需要替换为你自己刚刚的目录

`cd ~/Library/Developer/Xcode/DerivedData/IJKMediaPlayer-bpuwtjeeipcfgffpcjhynhwsndig/Build/Products`

接着按下方输入,这个目的是将真机库和模拟库包合并为一个通用库

```bash
lipo -create Release-iphoneos/IJKMediaFramework.framework/IJKMediaFramework Release-iphonesimulator/IJKMediaFramework.framework/IJKMediaFramework -output IJKMediaFramework

cp IJKMediaFramework Release-iphoneos/IJKMediaFramework.framework

open Release-iphoneos/
```

这里打开的看到的那个就是你的那个可用的通用 framework 库了

这里出的是动态库,如果你需要静态库,你需要在 xcode 里进行设置,这一步请自行百度/谷歌

## LICENSE

Under MIT style
