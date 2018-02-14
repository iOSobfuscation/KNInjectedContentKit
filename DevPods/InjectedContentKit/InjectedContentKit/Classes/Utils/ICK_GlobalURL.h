//
//  ICK_GlobalURL.h
//  MoboKey
//
//  Created by heyuan on 16/2/5.
//  Copyright © 2016年 xzrs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICK_GlobalURL : NSObject

+ (NSString *)URLEncode:(NSString *)unencodedString;
+ (NSString *)URLDecode:(NSString *)encodedString;

+ (NSString *)additionWithUrlString:(NSString *)url;
+ (NSString* )URLStringWithBaseURLString:(NSString*)baseURLString params:(NSDictionary*)params;

+ (NSMutableDictionary *)paramsDictionaryFromUrl:(NSString *)urlString;
+ (NSString *)parmasURL:(NSString *)URL key:(NSString *)key value:(NSString *)value;
@end
