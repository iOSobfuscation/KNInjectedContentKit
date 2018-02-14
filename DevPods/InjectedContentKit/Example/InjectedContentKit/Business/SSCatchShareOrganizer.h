

#import <Foundation/Foundation.h>

@class SSCatchActivityCouponSampler;

@interface SSCatchShareOrganizer : NSObject

@property (nonatomic, strong) NSString* invitationCode;

- (void)fetchCodeWithToast:(BOOL)showToast completion:(void (^)(NSString* invitationCode))block;
- (void)fetchInvitateWithCode:(NSString*)invitationCode toast:(BOOL)showToast completion:(void (^)(BOOL result, SSCatchActivityCouponSampler* item))block;

@end
