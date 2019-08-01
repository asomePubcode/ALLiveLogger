//
//  LDSHTTPConnection.m
//  SmartHome
//
//  Created by leedarson on 2018/6/15.
//  Copyright © 2018年 leedarson. All rights reserved.
//

#import "LLHTTPConnection.h"
#import "WebSocket.h"
#import "WebSocketLogger.h"
@protocol GCDAsyncSocketDelegate;

// Log levels : off, error, warn, info, verbose
// Other flags: trace
//static const int httpLogLevel = HTTP_LOG_LEVEL_VERBOSE | HTTP_LOG_FLAG_TRACE | HTTP_LOG_LEVEL_VERBOSE |HTTP_LOG_FLAG_INFO;

@interface LLHTTPConnection ()

@property(nonatomic, assign) BOOL isAuth;
@end

@implementation LLHTTPConnection
static NSMutableSet * webSocketLoggers;
+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // We need some place to store the webSocketLogger instances.
        // So we'll store them here, in a class variable.
        //
        // We'll also use a simple notification system to release them when they die.
        
        webSocketLoggers = [[NSMutableSet alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(webSocketLoggerDidDie:)
                                                     name:WebSocketLoggerDidDieNotification
                                                   object:nil];
    });
}

+ (void)addWebSocketLogger:(WebSocketLogger *)webSocketLogger
{
    @synchronized(webSocketLoggers)
    {
        [webSocketLoggers addObject:webSocketLogger];
    }
}

+ (void)webSocketLoggerDidDie:(NSNotification *)notification
{
    @synchronized(webSocketLoggers)
    {
        [webSocketLoggers removeObject:[notification object]];
    }
}
/**
 * Overrides method in HTTPConnection.
 **/
- (WebSocket *)webSocketForURI:(NSString *)path
{
    if ([path isEqualToString:@"/livelog"])
    {
        // Create the WebSocket
        WebSocket *webSocket = [[WebSocket alloc] initWithRequest:request socket:asyncSocket];
        
        // Create the WebSocketLogger
        WebSocketLogger *webSocketLogger = [[WebSocketLogger alloc] initWithWebSocket:webSocket];
        
        [self.class addWebSocketLogger:webSocketLogger];
        return webSocket;
    }
    
    return [super webSocketForURI:path];
}
@end
