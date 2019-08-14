//
//  ALDDLogerFormat.m
//  Logger-iphone
//
//  Created by 廖亚雄 on 2019/8/14.
//  Copyright © 2019 廖亚雄. All rights reserved.
//

#import "ALDDLogerFormat.h"
#import "ALLiveLogger.h"
@implementation ALDDLogerFormat

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss:SSS"];
    NSString *dateAndTime = [dateFormatter stringFromDate:(logMessage->_timestamp)];
    
    NSString *logString = [NSString stringWithFormat:@"%@ [%@]-[%@]-[%@] | %@",dateAndTime,THIS_FILE,logMessage->_fileName,@(logMessage->_line),logMessage->_message];
    
    [ALLiveLogger al_logToWeb:logString];
    return logString;
}
@end
