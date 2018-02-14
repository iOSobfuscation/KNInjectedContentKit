

#import <UIKit/UIKit.h>

@class SSCatchPayMethodSampler;

@protocol SSCatchPayMethodDelegate <NSObject>

- (void)pickPayMethod:(SSCatchPayMethodSampler*)payMethod;

@end

@class SSCatchRechargeSampler;

@interface SSCatchPayMethodScheduler : UIViewController

- (instancetype)initWithRechargeSampler:(SSCatchRechargeSampler *)item;
@property (nonatomic, weak) id<SSCatchPayMethodDelegate> delegate;

@end
