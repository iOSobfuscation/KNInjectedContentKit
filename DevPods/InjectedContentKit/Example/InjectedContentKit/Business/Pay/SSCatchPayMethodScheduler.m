

#import "SSCatchPayMethodScheduler.h"

@interface SSCatchPayMethodScheduler ()

@end

@implementation SSCatchPayMethodScheduler

- (instancetype)initWithRechargeSampler:(SSCatchRechargeSampler *)item {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeAppearance];
    [self updateDataToUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"==");
}

- (void)makeAppearance {
}

- (void)updateDataToUI {

}

- (UIButton*)thirdLoginButtonWithTypeModel:(SSCatchPayMethodSampler*)paymentMethodModel {
    return nil;
}

- (void)thirdButtonTapped:(UIButton*)sender {
   
    
}

@end
