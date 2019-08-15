//
//  ALLiveLogging.m
//  ALLiveLogging
//
//  Created by 廖亚雄 on 2019/7/31.
//


#import "ALHTTPConnection.h"
#import "WebSocket.h"

@interface ALHTTPConnection ()
@end

@implementation ALHTTPConnection

/**
 * Overrides method in HTTPConnection.
 **/
- (WebSocket *)webSocketForURI:(NSString *)path
{
    if ([path isEqualToString:@"/livelog"])
    {
        // Create the WebSocket
        WebSocket *webSocket = [[WebSocket alloc] initWithRequest:request socket:asyncSocket];
        
        return webSocket;
    }
    
    return [super webSocketForURI:path];
}
@end
