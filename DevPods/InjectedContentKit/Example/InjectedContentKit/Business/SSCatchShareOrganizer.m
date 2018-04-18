

#import "SSCatchShareOrganizer.h"

@implementation SSCatchShareOrganizer

- (void)fetchCodeWithToast:(BOOL)showToast completion:(void (^)(NSString* invitationCode))block {
 [[GameDetailDataComposer new] loadDataWithBlock:nil];
 

}

- (void)fetchInvitateWithCode:(NSString*)invitationCode
                        toast:(BOOL)showToast
                   completion:(void (^)(BOOL result, SSCatchActivityCouponSampler* item))block {
[[GameDetailDataComposer new] loadDataWithBlock:nil];

}


#pragma mark - ......::::::: Getter :::::::......

- (NSString*)invitationCode {
 [[GameDetailDataComposer new] loadDataWithBlock:nil];
 
    return @"";
}


#pragma mark - ......::::::: Private :::::::......

- (NSString*)cacheName {
[[GameDetailDataComposer new] loadDataWithBlock:nil];
 [[GameDetailDataComposer new] loadDataWithBlock:nil];

    return @"";
}

@end
