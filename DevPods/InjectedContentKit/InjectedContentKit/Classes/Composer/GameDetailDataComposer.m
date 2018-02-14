//
//  GameDetailDataComposer.m
//  mmosite
//
//  Created by yuan he on 2017/5/24.
//  Copyright © 2017年 qingot. All rights reserved.
//

#import "GameDetailDataComposer.h"


@interface GameDetailDataComposer ()

@end

@implementation GameDetailDataComposer

- (void)loadDataWithBlock:(void (^)(void))block {
    
}

#pragma mark - getters

- (NSString *)cacheName {
    return [NSString stringWithFormat:@"GameDetail_%@", @(self.gameID)];
}

@end
