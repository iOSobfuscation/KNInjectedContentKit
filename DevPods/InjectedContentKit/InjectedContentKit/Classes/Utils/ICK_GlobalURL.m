//
//  ICK_GlobalURL.m
//  MoboKey
//
//  Created by heyuan on 16/2/5.
//  Copyright © 2016年 xzrs. All rights reserved.
//

#import "ICK_GlobalURL.h"

@implementation ICK_GlobalURL

+ (NSString *)URLEncode:(NSString *)unencodedString
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)unencodedString, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
}

+ (NSString *)URLDecode:(NSString *)encodedString
{
    return [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)additionWithUrlString:(NSString *)urlSring
{
    return urlSring;
}

+ (NSString*)URLStringWithBaseURLString:(NSString*)baseURLString params:(NSDictionary*)params {
    //获取全局附加参数
    NSString *baseUrl = nil;
    return baseUrl;
}

+ (NSMutableDictionary *)paramsDictionaryFromUrl:(NSString *)urlString
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    return params;
}
+(NSString *)parmasURL:(NSString *)URL key:(NSString *)key value:(NSString *)value
{
    return nil;
}
+(NSString *)signature:(NSMutableDictionary *)dic
{
    return @"";
}
@end
