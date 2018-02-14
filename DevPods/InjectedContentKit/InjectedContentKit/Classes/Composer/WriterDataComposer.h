//
//  WriterDataComposer.h
//  mmosite
//
//  Created by yuan he on 2017/3/2.
//  Copyright © 2017年 qingot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICK_NetworkInterfaceManager.h"

@interface WriterDataComposer : NSObject

@property (strong, nonatomic) NSString *authorId;
@property (strong, nonatomic) NSMutableArray *cardItems;
@property (assign, nonatomic) BOOL isLastPage;

- (void)loadWithType:(MMLoadType)loadType completionBlock:(void (^)(void))block;

@end
