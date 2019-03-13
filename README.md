# flutter_ijkplayer_pod

[ijkplayer](https://github.com/bilibili/ijkplayer) for flutter

## 目的

主要是因为在 flutter 中将 framework 完整的上传 pub 感觉太大了

而国内的朋友们访问 pub，github 之类的网站普遍网速不太好，所以采用 pod 依赖，并且 pod 支持 xz 这样高压缩率的压缩格式，将 150M 左右的 framwork 压缩至 30M 左右

## about framework

使用 https://github.com/jadennn/flutter_ijk 项目中提供的源码进行编译, 这部分源码的修改没有提供 LICENSE

编译的完整配置文件可以查看 `config/module.sh`文件

编译过程中加入 OpenSSL 的支持

这里只是加入了一些相对常用的选项,如果你需要使用的选项
