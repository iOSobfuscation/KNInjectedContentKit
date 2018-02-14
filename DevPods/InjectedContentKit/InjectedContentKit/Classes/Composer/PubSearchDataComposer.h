//
//  PubSearchDataComposer.h
//  mmosite
//
//  Created by aron on 2017/8/16.
//  Copyright © 2017年 qingot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMSearchSuggestionModel;

@interface PubSearchDataComposer : NSObject

@property (strong, nonatomic) NSMutableArray<MMSearchSuggestionModel*>* cardItems;
@property (nonatomic, strong) NSString* searchPredicateStr;///<搜索条件

- (void)loadSuggestionWithCompletionBlock:(void (^)(void))block;

@end
