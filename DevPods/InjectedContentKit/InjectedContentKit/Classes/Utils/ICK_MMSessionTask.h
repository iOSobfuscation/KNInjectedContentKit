//
//  MWSessionTask.h
//  MoboWiFi
//
//  Created by heyuan on 16/3/4.
//  Copyright © 2016年 mobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+ICK_NSJSON.h"

typedef NS_ENUM(NSInteger, MMServerStateCode) {
    MMServerStateCodeSuccess    = 0,
    MMServerStateCodeFail       = 1,
    MMServerStateAlreadyZan     = 3,
    MMServerStatePostAlreadyZan = 4,
    MMServerStateNeedBindEmail  = -5,
};

@interface ICK_MMSessionTask : NSObject

+ (NSURLSessionDataTask *)beginTaskWithUrlString:(NSString *)urlString postData:(NSData *)data completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

+ (NSURLSessionDataTask *)beginTaskWithUrlString:(NSString *)urlString postData:(NSData *)data contentType:(NSString *)contentType completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

+ (NSURLSessionDataTask *)mmTaskWithUrlString:(NSString *)urlString postData:(NSData *)data mmCodeHandler:(void (^)(id dictOrArray, NSInteger code))mmCodeHandler;

+ (NSURLSessionDataTask *)mmTaskWithUrlString:(NSString *)urlString postData:(NSData *)data mmHandler:(void (^)(id dictOrArray))mmHandler;

+ (NSURLSessionDataTask *)mmTaskWithUrlString:(NSString *)urlString postData:(NSData *)data mmCodeMessageHandler:(void (^)(id dictOrArray, NSInteger code, NSString *message))mmCodeMessageHandler;

@end
