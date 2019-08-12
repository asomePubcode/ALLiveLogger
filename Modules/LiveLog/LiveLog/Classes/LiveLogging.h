//
//  Logging+Live.h
//  LiveLog
//
//  Created by 廖亚雄 on 2019/7/31.
//

#import <Log/Logging.h>

#define LiveLog 1
NS_ASSUME_NONNULL_BEGIN

@interface LiveLogging : Logging
+ (NSString *)liveLogWebPath;
+ (void)logToWeb:(NSString *)logMessage;
@end

NS_ASSUME_NONNULL_END
