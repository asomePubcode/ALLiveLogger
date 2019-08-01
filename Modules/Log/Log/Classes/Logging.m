//
//  Logging.m
//  Logger
//
//  Created by 廖亚雄 on 2019/7/24.
//  Copyright © 2019 廖亚雄. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "Logging.h"
#import "LogFormatter.h"
#import "FMDBLogger.h"


static DDFileLogger *fileLogger   = nil;
static FMDBLogger   *sqliteLogger = nil;
@implementation Logging

DDLogLevel ddLogLevel = DDLogLevelVerbose;

+ (void)setLogLevel:(DDLogLevel)logLevel {
    ddLogLevel = logLevel;
    if (ddLogLevel == DDLogLevelOff) {
        [[DDLog sharedInstance] removeAllLoggers];
        return;
    }

    //输出到console.app
//    [self addOS_Logger];
    //输出到控制台
    [self addTYYLogger];
    //输出到文件
    [self addFileLogger];
    //输出到数据库
    [self addSQLiteLogger];
    //输出当前线程名称，如果没有名称则线程id
    [self setDispathQueueFormatter];
    
}
+ (void)addTYYLogger {
    
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

+ (void)addOS_Logger {
    if (@available(iOS 10.0, *)) {
        [DDLog addLogger:[DDOSLogger sharedInstance]];
    }else {
        [DDLog addLogger:[DDASLLogger sharedInstance]];
    }
}

+ (void)addFileLogger {
    fileLogger = [[DDFileLogger alloc] init];
    fileLogger.maximumFileSize = 1024 * 1;  //  10M
    fileLogger.rollingFrequency = 60 * 1;       // 60 Seconds
    fileLogger.logFileManager.maximumNumberOfLogFiles = 4;
    [DDLog addLogger:fileLogger];

}

+ (void)addSQLiteLogger {
    NSString *logsDirectory = [self defaultLogsDirectory];
    sqliteLogger = [[FMDBLogger alloc] initWithLogDirectory:logsDirectory];
    
    sqliteLogger.saveThreshold     = 500;
    sqliteLogger.saveInterval      = 60;               // 60 seconds
    sqliteLogger.maxAge            = 60 * 60 * 24 * 7; //  7 days
    sqliteLogger.deleteInterval    = 60 * 5;           //  5 minutes
    sqliteLogger.deleteOnEverySave = NO;
    
    [DDLog addLogger:sqliteLogger];
}

+ (void)setDispathQueueFormatter {
    [[[DDLog sharedInstance] allLoggers] enumerateObjectsUsingBlock:^(id<DDLogger>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DDDispatchQueueLogFormatter *formatter = [[DDDispatchQueueLogFormatter alloc] init];
        formatter.minQueueLength = 4;
        formatter.maxQueueLength = 0;
        obj.logFormatter = formatter;
    }];
}

+ (void)setDefaultFormatter {
    [[[DDLog sharedInstance] allLoggers] enumerateObjectsUsingBlock:^(id<DDLogger>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.logFormatter = [LogFormatter new];
    }];
}

// 日志路径
+ (NSString *)defaultLogsDirectory {
    
#if TARGET_OS_IPHONE
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *baseDir = paths.firstObject;
    NSString *logsDirectory = [baseDir stringByAppendingPathComponent:@"Logs"];
#else
    NSString *appName = [[NSProcessInfo processInfo] processName];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? paths[0] : NSTemporaryDirectory();
    NSString *logsDirectory = [[basePath stringByAppendingPathComponent:@"Logs"] stringByAppendingPathComponent:appName];
#endif
    
    return logsDirectory;
}
@end
