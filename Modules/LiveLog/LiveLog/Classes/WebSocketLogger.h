//
//  WebSocketLogger.h
//  WebServerIPhone
//
//  CocoaLumberjack Demos
//

#import <Foundation/Foundation.h>

#import "WebSocket.h"
#if __has_include(<CocoaLumberjack/CocoaLumberjack.h>)
#import <CocoaLumberjack/CocoaLumberjack.h>
#define kHasDDLog 1
#endif

#define WebSocketLoggerDidDieNotification  @"WebSocketLoggerDidDie"

@interface WebSocketLogger :
#if kHasDDLog
DDAbstractLogger <DDLogger>
#endif
{
    WebSocket *websocket;
    BOOL isWebSocketOpen;
}

- (id)initWithWebSocket:(WebSocket *)ws;

@end

@interface WebSocketFormatter : NSObject
#if kHasDDLog
<DDLogFormatter>
#endif
{
    NSDateFormatter *dateFormatter;
}

@end
