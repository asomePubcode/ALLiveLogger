//
//  ViewController.m
//  Logger-iphone
//
//  Created by 廖亚雄 on 2019/7/26.
//  Copyright © 2019 廖亚雄. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController ()<WKNavigationDelegate,UIScrollViewDelegate,WKScriptMessageHandler>
@property(nonatomic, strong) WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:@"http://localhost:2344"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}
- (WKWebView* )webView {
    if (_webView==nil) {
        WKWebViewConfiguration *_config = nil;
        _config = [[WKWebViewConfiguration alloc]init];
        
        _config.allowsInlineMediaPlayback = YES;
        
        _webView =[[WKWebView alloc]initWithFrame:CGRectMake(0, -0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) configuration:_config];
        
        NSString *base = [[UIWebView new] stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
//        NSString *userAgent = [[[LDSBridgeService sharedInstance].systemManager getAPPInfoForUseAgent] stringByAppendingString:base];
//        [_webView setCustomUserAgent:userAgent];
        
        _webView.navigationDelegate =self;
        _webView.UIDelegate = (id<WKUIDelegate>)self;
        _webView.scrollView.delegate = self;
        [_webView.scrollView setBounces:NO];
        _webView.scrollView.scrollEnabled = NO;
        [self.view addSubview:_webView];
        _webView.allowsLinkPreview = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        _webView.backgroundColor = [UIColor redColor];
        
        if (@available(iOS 11.0, *)) {
            _webView.scrollView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
            
            self.automaticallyAdjustsScrollViewInsets =NO;
        }
    }
    return _webView;
}
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler {
    SecTrustRef serverTrust = challenge.protectionSpace.serverTrust;
    //证书认证
    if (serverTrust) {
        //加服务端证书校验
        NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"CA" ofType:@"der"];//自签名证书
        NSData* caCert = [NSData dataWithContentsOfFile:cerPath];
        //        NSArray *cerArray = @[caCert];
        
        SecCertificateRef caRef = SecCertificateCreateWithData(NULL, (__bridge CFDataRef)caCert);
        NSCAssert(caRef != nil, @"caRef is nil");
        
        NSArray *caArray = @[(__bridge id)(caRef)];
        NSCAssert(caArray != nil, @"caArray is nil");
        //把自签名证书加入到信任列表
        OSStatus status = SecTrustSetAnchorCertificates(serverTrust, (__bridge CFArrayRef)caArray);
        SecTrustSetAnchorCertificatesOnly(serverTrust,NO);
        CFDataRef exceptions = SecTrustCopyExceptions (serverTrust);
        status = SecTrustSetExceptions (serverTrust, exceptions);
        CFRelease (exceptions);
        CFRelease(caRef);
        completionHandler (NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust:serverTrust]);
        return;
    }
    completionHandler (NSURLSessionAuthChallengeUseCredential, [[NSURLCredential alloc] initWithUser:@"a" password:@"1" persistence:NSURLCredentialPersistenceNone]);
}
@end
