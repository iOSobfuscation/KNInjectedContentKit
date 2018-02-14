//
//  GameDetailDataComposer.h
//  mmosite
//
//  Created by yuan he on 2017/5/24.
//  Copyright © 2017年 qingot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameDetailDataComposer : NSObject

@property (nonatomic, assign) NSInteger         gameID;

- (void)loadDataWithBlock:(void (^)(void))block;

@end
