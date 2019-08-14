//
//  ALLog.m
//  Logger-iphone
//
//  Created by 廖亚雄 on 2019/8/14.
//  Copyright © 2019 廖亚雄. All rights reserved.
//

#import "ALLog.h"
#import "ALLiveLogger.h"

@implementation ALLog
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
@end
