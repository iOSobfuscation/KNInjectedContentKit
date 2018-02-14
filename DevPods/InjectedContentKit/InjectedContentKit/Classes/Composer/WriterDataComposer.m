//
//  WriterDataComposer.m
//  mmosite
//
//  Created by yuan he on 2017/3/2.
//  Copyright © 2017年 qingot. All rights reserved.
//

#import "WriterDataComposer.h"

@interface WriterDataComposer ()

@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) BOOL isRequesting;

@end

@implementation WriterDataComposer

- (instancetype)init {
    if (self = [super init]) {
        self.pageIndex = 1;
    }
    return self;
}

#pragma mark - public methods

- (void)loadWithType:(MMLoadType)loadType completionBlock:(void (^)(void))block {
    if (!_authorId) {
        return;
    }
    if (loadType == MMLoadTypeRefresh) {
        self.pageIndex = 1;
    } else if (loadType == MMLoadTypeMore) {
        self.pageIndex++;
    }
    [self loadItemsWithPageIndex:self.pageIndex completionBlock:block];
}

#pragma mark - private methods

- (void)loadItemsWithPageIndex:(NSInteger)pageIndex completionBlock:(void (^)(void))block {
    
}

#pragma mark - getters

- (NSMutableArray *)cardItems {
    if (!_cardItems) {
        if (!_cardItems) {
            _cardItems = [[NSMutableArray alloc] init];
        }
    }
    return _cardItems;
}

- (NSString *)cardCacheName {
    return [NSString stringWithFormat:@"AuthorCardItems_%@", _authorId];
}

- (NSString *)authorCacheName {
    return [NSString stringWithFormat:@"AuthorItems_%@", _authorId];
}

@end
