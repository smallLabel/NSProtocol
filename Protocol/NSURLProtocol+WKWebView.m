//
//  NSURLProtocol+WKWebView.m
//  Protocol
//
//  Created by jh on 2020/12/25.
//

#import "NSURLProtocol+WKWebView.h"
#import <WebKit/WebKit.h>


FOUNDATION_STATIC_INLINE Class ContextControllerClass() {
    static Class cls;
    if (!cls) {
        cls = [[[WKWebView new] valueForKey:@"browsingContextController"] class];
    }
    return cls;
}

FOUNDATION_STATIC_INLINE SEL RegisterSchemeSelector() {
    return  NSSelectorFromString(@"registerSchemeForCustomProtocol:");
}

FOUNDATION_STATIC_INLINE SEL UnregisterSchemeSelector() {
    return  NSSelectorFromString(@"runegisterSchemeForCustomProtocol:");
}
@implementation NSURLProtocol (WKWebView)

+ (void)wk_registerScheme:(NSString *)scheme {
    Class cls = ContextControllerClass();
    SEL sel = RegisterSchemeSelector();
    if ([cls respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [cls performSelector:sel withObject:scheme];
#pragma clang diagnostic pop
    }
}

+ (void)wk_unregisterScheme:(NSString *)scheme {
    Class cls = ContextControllerClass();
    SEL sel = UnregisterSchemeSelector();
    if ([cls respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [cls performSelector:sel withObject:scheme];
#pragma clang diagnostic pop
    }
}

@end
