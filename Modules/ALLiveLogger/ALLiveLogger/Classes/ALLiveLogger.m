//
//  ALLiveLogger.m
//  ALLiveLogger
//
//  Created by 廖亚雄 on 2019/7/31.
//

#import "ALLiveLogger.h"
#import "HTTPServer.h"
#import "ALHTTPConnection.h"
#import "WebSocket.h"

static HTTPServer *httpServer = nil;
@implementation ALLiveLogger

+ (BOOL)al_initLiveLogger{
    if (httpServer) {
        return YES;
    }
    httpServer = [[HTTPServer alloc] init];
    [httpServer setType:@"_http._tcp."];
    [httpServer setPort:61234];
    [httpServer setConnectionClass:ALHTTPConnection.class];
    // Serve files from our embedded Web folder
    NSString *webPath = [self al_liveLogWebPath];
    [httpServer setDocumentRoot:webPath];
    // Start the server (and check for problems)
    NSError *error = nil;
    return [httpServer start:&error];
}

+ (BOOL)al_deinitLiveLogger {
    if (!httpServer) {
        return YES;
    }
    [httpServer stop];
    httpServer = nil;
    return YES;
}

+ (NSString *)al_liveLogWebPath {
    
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSBundle *subBundle = [NSBundle bundleWithPath:[bundle pathForResource:@"Resource" ofType:@"bundle"]];
    if (!subBundle) {
        return nil;
    }
    return [subBundle pathForResource:@"livelog" ofType:nil];;
}

+ (BOOL)al_logToWeb:(NSString *)logMessage {
    NSArray *arr = [httpServer valueForKey:@"webSockets"];
    if (!arr || arr.count <= 0) {
        return NO;
    }
    __block WebSocket *wb = nil;
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        wb = (WebSocket *)obj;
        [wb sendMessage:logMessage];
    }];
    return YES;
}
@end
