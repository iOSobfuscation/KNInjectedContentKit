//
//  MWSessionTask.m
//  MoboWiFi
//
//  Created by heyuan on 16/3/4.
//  Copyright © 2016年 mobo. All rights reserved.
//

#import "ICK_MMSessionTask.h"

@implementation ICK_MMSessionTask

+ (NSURLSessionDataTask *)mmTaskWithUrlString:(NSString *)urlString postData:(NSData *)data mmHandler:(void (^)(id))mmHandler {
    return [self mmTaskWithUrlString:urlString postData:data mmCodeHandler:^(id dictOrArray, NSInteger code) {
        if (mmHandler) {
            mmHandler(dictOrArray);
        }
    }];
}

+ (NSURLSessionDataTask *)mmTaskWithUrlString:(NSString *)urlString postData:(NSData *)data mmCodeMessageHandler:(void (^)(id dictOrArray, NSInteger code, NSString *message))mmCodeMessageHandler {
    return [self beginTaskWithUrlString:urlString postData:data contentType:nil isMMRequest:YES mmCodeMessageHandler:mmCodeMessageHandler completionHandler:nil];
}

+ (NSURLSessionDataTask *)beginTaskWithUrlString:(NSString *)urlString postData:(NSData *)data completionHandler:(void (^)(NSData *, NSURLResponse *, NSError *))completionHandler {
    return [self beginTaskWithUrlString:urlString postData:data contentType:nil completionHandler:completionHandler];
}

+ (NSURLSessionDataTask *)mmTaskWithUrlString:(NSString *)urlString postData:(NSData *)data mmCodeHandler:(void (^)(id, NSInteger))mmCodeHandler {
    return [self beginTaskWithUrlString:urlString postData:data contentType:nil isMMRequest:YES mmCodeMessageHandler:^(id dictOrArray, NSInteger code, NSString *message) {
        if (mmCodeHandler) {
            mmCodeHandler(dictOrArray, code);
        }
    } completionHandler:nil];
}

+ (NSURLSessionDataTask *)beginTaskWithUrlString:(NSString *)urlString postData:(NSData *)bodyData contentType:(NSString *)contentType isMMRequest:(BOOL)isMMRequest mmCodeMessageHandler:(void (^)(id dictOrArray, NSInteger code, NSString *message))mmCodeMessageHandler completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    
    return nil;
}

+ (NSURLSessionDataTask *)beginTaskWithUrlString:(NSString *)urlString postData:(NSData *)data contentType:(NSString *)contentType completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    return [self beginTaskWithUrlString:urlString postData:data contentType:contentType isMMRequest:NO mmCodeMessageHandler:nil completionHandler:completionHandler];
}

@end
