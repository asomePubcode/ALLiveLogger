//
//  ALLog.h
//  Logger-iphone
//
//  Created by 廖亚雄 on 2019/8/14.
//  Copyright © 2019 廖亚雄. All rights reserved.
//

#import <Foundation/Foundation.h>

# define ALLogger(fmt, ...) [ALLog al_log:(fmt) , ## __VA_ARGS__]

NS_ASSUME_NONNULL_BEGIN

@interface ALLog : NSObject
+ (void)al_log:(NSString *)format, ...;
@end

NS_ASSUME_NONNULL_END
