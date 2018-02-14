//
//  NSObject+NSJSON.m
//  MobileExperience
//
//  Created by Fyl on 16/1/18.
//  Copyright (c) 2016 xzrs. All rights reserved.
//

#import "NSObject+ICK_NSJSON.h"

@implementation NSObject (NSJSON)

- (NSString *)nsjsonString
{
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    NSError *error = NULL;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = @"";
    if ([jsonData length] && !error) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    } else {
        NSLog(@"-NSJSONString failed. Error trace is: %@", error);
    }
    
    return jsonString;
}

@end
