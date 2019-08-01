//
//  LoggingFileManager.h
//  Log
//
//  Created by 廖亚雄 on 2019/8/1.
//

#import <CocoaLumberjack/CocoaLumberjack.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoggingFileManager : DDLogFileManagerDefault
@property(nonatomic, copy) void (^rollFile)(NSString *filePath);
@end

NS_ASSUME_NONNULL_END
