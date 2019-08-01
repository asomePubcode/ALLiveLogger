//
//  Logging.h
//  Logger
//
//  Created by 廖亚雄 on 2019/7/24.
//  Copyright © 2019 廖亚雄. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>

extern DDLogLevel ddLogLevel;

@interface Logging : NSObject
+ (void)setLogLevel:(DDLogLevel)logLevel;
+ (NSString *)defaultLogsDirectory;
@end
