//
//  ALLiveLogger.h
//  ALLiveLogger
//
//  Created by 廖亚雄 on 2019/7/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALLiveLogger : NSObject

+ (BOOL)al_initLiveLogger;
+ (BOOL)al_deinitLiveLogger;
+ (BOOL)al_logToWeb:(NSString *)logMessage;

@end

NS_ASSUME_NONNULL_END
