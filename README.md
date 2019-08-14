# ALLiveLogger

[![CI Status](https://img.shields.io/travis/448654003@qq.com/ALLiveLogger.svg?style=flat)](https://travis-ci.org/448654003@qq.com/ALLiveLogger)
[![Version](https://img.shields.io/cocoapods/v/ALLiveLogger.svg?style=flat)](https://cocoapods.org/pods/ALLiveLogger)
[![License](https://img.shields.io/cocoapods/l/ALLiveLogger.svg?style=flat)](https://cocoapods.org/pods/ALLiveLogger)
[![Platform](https://img.shields.io/cocoapods/p/ALLiveLogger.svg?style=flat)](https://cocoapods.org/pods/ALLiveLogger)

一个基于[CocoaHTTPServer](https://github.com/robbiehanson/CocoaHTTPServer)搭建的本地服务,可以将日志实时输出到PC浏览器的审查元素console中。


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ALLiveLogger is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ALLiveLogger'
```

## Usage

* 初始化
```
[ALLiveLogger al_initLiveLogger];
```
* 反初始化
```
[ALLiveLogger al_deinitLiveLogger];
```
* 发送日志到web页面
```
 [ALLiveLogger al_logToWeb:@"some string"];
```
## 支持

* 支持日志神器--[CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack)

自定义DDLogger[ALDDLogger](https://github.com/asomePubcode/ALLiveLogger/blob/master/Logger/Example/SupportDDLog/ALDDLogger.h)
```
//支持DDLog 自定义Logger
[DDLog addLogger:[ALDDLogger new]];
```
或者使用自定义logFormatter [ALDDLogerFormat](https://github.com/asomePubcode/ALLiveLogger/blob/master/Logger/Example/SupportDDLog/ALDDLogerFormat.h)

```
//支持DDLog 自定义logFormatter
DDTTYLogger *ttyLogger = [DDTTYLogger new];
ttyLogger.logFormatter = [ALDDLogerFormat new];
[DDLog addLogger:ttyLogger];
```

* 支持swift下的日志工具--[XCGLogger](https://github.com/DaveWoodCom/XCGLogger)

XCGLogger 自定义format [TestLogger](https://github.com/asomePubcode/ALLiveLogger/blob/master/Logger/Example/SupportXCGLogger/TestLogger.swift)
```
open class TestLogger: NSObject,LogFormatterProtocol {
    public func format(logDetails: inout LogDetails, message: inout String) -> String {
        ALLiveLogger.al_log(toWeb: message)
        return message
}

    var logger = XCGLogger.init()

    override init() {
        super.init()
        self.logger.formatters = [self]
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(loggg), userInfo: nil, repeats: true)
    }

    @objc func loggg() -> () {
        self.logger.logln(Date.init())
    }
}

```

* 支持自定义的日志打印

[ALLog](https://github.com/asomePubcode/ALLiveLogger/blob/master/Logger/Example/SupportCustomLog/ALLog.h)
```
+ (void)al_log:(NSString *)format, ... {

    va_list args;

    if (format) {
        va_start(args, format);

        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        NSString *logString = [self formatForMessage:message];

        va_end(args);

        [ALLiveLogger al_logToWeb:logString];
    }

}

+ (NSString *)formatForMessage:(NSString *)format {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss:SSS"];
    NSString *dateAndTime = [dateFormatter stringFromDate:(NSDate.date)];

    NSString *file = [NSString stringWithUTF8String:__FILE__];
    return [NSString stringWithFormat:@"%@ [%@]- %@", dateAndTime,file.lastPathComponent, format];
}
```
## 查看实时日志
![网页端实时日志截图](https://github.com/asomePubcode/Logger/blob/master/Images/liveLog.jpg)

* 查看手机`WIFI`的`ip`地址

![控制台日志截图](https://github.com/asomePubcode/Logger/blob/master/Images/ip.png)

* 电脑处于同一个局域网WIFI下 打开浏览器 输入手机的` ip地址:61234`  效果如下

![控制台日志截图](https://github.com/asomePubcode/Logger/blob/master/Images/show.gif)

## Author

asomeliao@foxmail.com,[asomeLiao](https://github.com/asomeLiao)
## License

see [CocoaHTTPServer](https://github.com/robbiehanson/CocoaHTTPServer)
