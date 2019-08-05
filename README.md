# Logger
一个基于[CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack)、[CocoaHTTPServer](https://github.com/robbiehanson/CocoaHTTPServer)的简单日志系统。

* 支持写入到文件
* 支持写入到数据库
* 支持局域网实时日志

### 使用步骤

* 下载代码

```
$git clone https://github.com/asomePubcode/Logger.git
```
* 安装依赖

```
$pod install 
```
* 运行demo
* 打开电脑的浏览器输入 "http://你手机IP:61234" （需要电脑和手机为统一局域网下）
* 加载出页面后打开元素检查，进到日志页面

### 截图
![网页端实时日志截图](https://github.com/asomePubcode/Logger/blob/master/Images/liveLog.jpg)
![写入文件和数据库截图](https://github.com/asomePubcode/Logger/blob/master/Images/fileLog.jpg)
![控制台日志截图](https://github.com/asomePubcode/Logger/blob/master/Images/terminalLog.jpg)

### Author

[asomeLiao](https://github.com/asomeLiao)
### License

see [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack)、[CocoaHTTPServer](https://github.com/robbiehanson/CocoaHTTPServer)



# 如何在项目中使用-非常重要



1.下载项目拷贝`Modules`文件夹到`.xcodeproj`同级目录

![控制台日志截图](https://github.com/asomePubcode/Logger/blob/master/Images/move.png)

2.修改`podfile`文件`./`表示当前文件夹

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
pod 'Log',:path => './Modules/Log/'
pod 'LiveLog',:path => './Modules/LiveLog/'
target 'XXXXX' do
end
```

3.执行 `pod install`

4.测试代码在`Appdelegate`中添加如下代码 运行起来

```
#import "LiveLogging.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [LiveLogging setLogLevel:DDLogLevelAll];
    // Override point for customization after application launch.
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(log)
                                   userInfo:nil
                                    repeats:YES];
    return YES;
}

- (void)log {
    NSDictionary *json = @{@"name":@"asml",@"age":@12,@"loc":@"hunan"};
    DDLogInfo(@"%@",json);
    DDLogError(@"Paper Jam!");
    DDLogWarn(@"Low toner");
    DDLogInfo(@"Printing SalesProjections.doc");
    DDLogVerbose(@"六国被秦国灭亡的教训，是许多文史家关注的话题。仅“三苏”就每人写了一篇《六国论》。苏轼的《六国论》，针对六国久存而秦速亡的对比分析，突出强调了“士”的作用");
}
```

5.查看手机`WIFI`的`ip`地址

![控制台日志截图](https://github.com/asomePubcode/Logger/blob/master/Images/ip.png)

6.电脑处于同一个局域网WIFI下 打开浏览器 输入手机的` ip地址:61234`  效果如下

![控制台日志截图](https://github.com/asomePubcode/Logger/blob/master/Images/show.gif)