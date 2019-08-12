//
//  Logging+Live.m
//  LiveLog
//
//  Created by 廖亚雄 on 2019/7/31.
//

#import "LiveLogging.h"
#import "HTTPServer.h"
#import "LLHTTPConnection.h"
#import "WebSocket.h"

static HTTPServer *httpServer = nil;
@implementation LiveLogging
+ (void)setLogLevel:(DDLogLevel)logLevel {
    [self addHTTPServer];
    [Logging setLogLevel:logLevel];
}

+ (void)addHTTPServer {
    httpServer = [[HTTPServer alloc] init];
    [httpServer setType:@"_http._tcp."];
    [httpServer setPort:61234];
    [httpServer setDomain:@"livelog"];
    [httpServer setConnectionClass:LLHTTPConnection.class];
    // Serve files from our embedded Web folder
    NSString *webPath = [self liveLogWebPath];
    [httpServer setDocumentRoot:webPath];
    // Start the server (and check for problems)
    NSError *error = nil;
    if (![httpServer start:&error])
    {
        DDLogError(@"Error starting HTTP Server: %@", error);
    }
}

+ (NSString *)liveLogWebPath {
    
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSBundle *subBundle = [NSBundle bundleWithPath:[bundle pathForResource:@"Resource" ofType:@"bundle"]];
    if (!subBundle) {
        return nil;
    }
    NSString *path = [subBundle pathForResource:@"livelog" ofType:nil];
    return path;
}

+ (void)logToWeb:(NSString *)logMessage {
    NSArray *arr = [httpServer valueForKey:@"webSockets"];
    __block WebSocket *wb = nil;
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        wb = (WebSocket *)obj;
        [wb sendMessage:logMessage];
    }];
}
@end
