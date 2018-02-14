

#import "SSCatchShareOrganizer.h"

@implementation SSCatchShareOrganizer

- (void)fetchCodeWithToast:(BOOL)showToast completion:(void (^)(NSString* invitationCode))block {

    
}

- (void)fetchInvitateWithCode:(NSString*)invitationCode toast:(BOOL)showToast completion:(void (^)(BOOL result, SSCatchActivityCouponSampler* item))block {
    
}


#pragma mark - ......::::::: Getter :::::::......

- (NSString*)invitationCode {
    return @"";
}


#pragma mark - ......::::::: Private :::::::......

- (NSString*)cacheName {
    return @"";
}

@end
