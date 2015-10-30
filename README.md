# yuedufm-sdk-ios

该sdk是针对yuedu.fm网站而设计的聚合资源的访问API，目前这样聚合资源存放在七牛中. 文档详见:[doc/com.pawpaw.YueduFMSDK.docset](doc/com.pawpaw.YueduFMSDK.docset/Contents/Resources/Documents)

### 特性
* Config - 获取配置信息（详见yuedu.fm-fetcher）
* Channel - 获取频道信息，目前包含悦读、情感、连播、校园、音乐、Labs
* Article - 获取文章信息

### 编译
* 编辑Makefile，修改目标路径
<pre>
./build.sh 目标路径 Release
</pre>
* make build 编译源码
* make doc 生成文档
* make all 编译源码并生成文档

### 使用
<pre>
YDSDKConfigRequest* req = [YDSDKConfigRequest request];
[[YDSDKManager defaultManager] request:req completion:^(YDSDKRequest *request, YDSDKError *error) {
    if (!error) {
		//成功
    } else {
    	//失败
    }
}];
</pre>

### 许可
该SDK遵循MIT许可，请参见MIT许可说明.