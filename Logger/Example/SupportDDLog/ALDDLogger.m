//
//  ALDDLogger.m
//  Logger-iphone
//
//  Created by 廖亚雄 on 2019/8/14.
//  Copyright © 2019 廖亚雄. All rights reserved.
//

#import "ALDDLogger.h"
#import "ALLiveLogger.h"

@implementation ALDDLogger
- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logString = [self formatForMessage:logMessage];
    [ALLiveLogger al_logToWeb:logString];
}

- (NSString *)formatForMessage:(DDLogMessage *)logMessage {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss:SSS"];
    NSString *dateAndTime = [dateFormatter stringFromDate:(logMessage->_timestamp)];
    NSMutableString *webMsg = [logMessage->_message mutableCopy];
    
    return [NSString stringWithFormat:@"%@ [%@]- %@", dateAndTime,THIS_FILE, webMsg];
}
@end
