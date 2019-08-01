//
//  LoggingFileManager.m
//  Log
//
//  Created by 廖亚雄 on 2019/8/1.
//

#import "LoggingFileManager.h"
#import "Logging.h"
@implementation LoggingFileManager
/**
 *  Called when a log file was archived. Executed on global queue with default priority.
 */
- (void)didArchiveLogFile:(NSString *)logFilePath {
    
}

/**
 *  Called when the roll action was executed and the log was archived.
 *  Executed on global queue with default priority.
 */
- (void)didRollAndArchiveLogFile:(NSString *)logFilePath {
    if (!_rollFile) {
        return;
    }
    _rollFile(logFilePath);
}


@end
