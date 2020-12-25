//
//  NSURLProtocol+WKWebView.h
//  Protocol
//
//  Created by jh on 2020/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLProtocol (WKWebView)

+ (void)wk_registerScheme:(NSString *)scheme;
+ (void)wk_unregisterScheme:(NSString *)scheme;

@end

NS_ASSUME_NONNULL_END
