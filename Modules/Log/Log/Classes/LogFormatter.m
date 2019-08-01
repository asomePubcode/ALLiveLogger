//
//  LogFormatter.m
//  Logger
//
//  Created by 廖亚雄 on 2019/7/24.
//  Copyright © 2019 廖亚雄. All rights reserved.
//

#import "LogFormatter.h"

@implementation LogFormatter

- (NSString * _Nullable)formatLogMessage:(nonnull DDLogMessage *)logMessage {
    return [NSString stringWithFormat:@"[%@]:%@ line:%@ ----%@",logMessage->_fileName,logMessage->_function,@(logMessage->_line),logMessage->_message];
}

@end
