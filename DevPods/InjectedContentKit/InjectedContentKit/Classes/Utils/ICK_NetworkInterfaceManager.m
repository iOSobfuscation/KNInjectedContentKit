//
//  ICK_NetworkInterfaceManager.m
//  Momoji
//
//  Created by yuan he on 2016/11/9.
//  Copyright © 2016年 yuan he. All rights reserved.
//

#import "ICK_NetworkInterfaceManager.h"
#import "ICK_GlobalURL.h"

@interface ICK_NetworkInterfaceManager ()

@end

@implementation ICK_NetworkInterfaceManager

+ (NSString *)URLStringWithType:(MMURLType)type {
    NSString *resultString = [self pureURLStringWithType:type];
    resultString = [ICK_GlobalURL additionWithUrlString:resultString];
    return resultString;
}

+ (NSString *)pureURLStringWithType:(MMURLType)type {
    return @"";
}

@end
