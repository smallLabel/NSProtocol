//
//  ViewController.m
//  Protocol
//
//  Created by jh on 2020/12/25.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "NSURLProtocol+WKWebView.h"

@interface ViewController () <WKNavigationDelegate, WKUIDelegate>
@property(nonatomic, strong) WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSURLProtocol wk_registerScheme:@"http"];
    [NSURLProtocol wk_registerScheme:@"https"];
    [self.view addSubview:self.webView];
}

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.userContentController = [WKUserContentController new];
        
        WKPreferences *preferences = [WKPreferences new];
        preferences.javaScriptCanOpenWindowsAutomatically = YES;
//        preferences.minimumFontSize = 30.0;
        configuration.preferences = preferences;
        
        _webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        if ([_webView respondsToSelector:@selector(setNavigationDelegate:)]) {
            [_webView setNavigationDelegate:self];
        }
        
        if ([_webView respondsToSelector:@selector(setDelegate:)]) {
            [_webView setUIDelegate:self];
        }
        NSURL *url = [NSURL URLWithString:@"https://testhuawei.fengmap.com/204/navigation/#/home"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        
    }
    return _webView;
}
@end
