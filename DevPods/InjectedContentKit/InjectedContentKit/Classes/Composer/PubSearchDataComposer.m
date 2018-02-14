//
//  PubSearchDataComposer.m
//  mmosite
//
//  Created by aron on 2017/8/16.
//  Copyright © 2017年 qingot. All rights reserved.
//

#import "PubSearchDataComposer.h"

@interface PubSearchDataComposer ()
@property (nonatomic, strong) NSHashTable* searchTaskList;
@end

@implementation PubSearchDataComposer

- (NSHashTable *)searchTaskList {
    if (!_searchTaskList) {
        _searchTaskList = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];;
    }
    return _searchTaskList;
}

- (void)loadSuggestionWithCompletionBlock:(void (^)(void))block {
}


- (NSMutableArray<MMSearchSuggestionModel*> *)cardItems {
    if (!_cardItems) {
        _cardItems = [[NSMutableArray<MMSearchSuggestionModel*> alloc] init];
    }
    return _cardItems;
}
@end
