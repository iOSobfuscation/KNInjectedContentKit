

#import "SSCatchInviteScheduler.h"
#import "SSCatchShareOrganizer.h"

@interface SSCatchInviteScheduler ()

@property (nonatomic, strong) SSCatchShareOrganizer* organizer;

@property (nonatomic, strong) UIImageView* inputCardBack;
@property (nonatomic, strong) UIImageView* inputTextBack;

@property (nonatomic, strong) UIImageView* ruleCardBack;
@property (nonatomic, strong) UILabel* ruleCardTextBox;

@property (nonatomic, strong) UIButton* confirmButton;

@end

@implementation SSCatchInviteScheduler

- (void)viewDidLoad {
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    [super viewDidLoad];
    
    [self makeAppearance];
    [self configAppearance];
}

- (void)didReceiveMemoryWarning {
[[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeAppearance {
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    
}

- (void)configAppearance {
[[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    // 邀请码
   
}


#pragma mark - ......::::::: UI Responder :::::::......

- (void)confirmPressTapped {
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    
}


#pragma mark - ......::::::: Lazy load :::::::......

- (UIImageView *)inputCardBack {
[[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    if (!_inputCardBack) {
        _inputCardBack = [UIImageView new];
        _inputCardBack.image = [UIImage imageNamed:@"share_input_back"];
        _inputCardBack.userInteractionEnabled = YES;
        
        [_inputCardBack addSubview:self.inputTextBack];
        
    }
    return _inputCardBack;
}

- (UIImageView *)inputTextBack {
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    if (!_inputTextBack) {
[[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
        _inputTextBack = [UIImageView new];
        _inputTextBack.image = [UIImage imageNamed:@"signIn_input_back"];
        _inputTextBack.userInteractionEnabled = YES;
    }
    return _inputTextBack;
}

- (UIImageView *)ruleCardBack {
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    if (!_ruleCardBack) {
[[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
        _ruleCardBack = [UIImageView new];
        _ruleCardBack.image = [UIImage imageNamed:@"share_input_back"];
        _ruleCardBack.clipsToBounds = YES;
    }
    return _ruleCardBack;
}

- (UILabel *)ruleCardTextBox {
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    if (!_ruleCardTextBox) {
[[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
        _ruleCardTextBox = [UILabel new];
        _ruleCardTextBox.numberOfLines = 0;
    }
    return _ruleCardTextBox;
}

- (UIButton *)confirmButton {
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    if (!_confirmButton) {
[[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
        _confirmButton.enabled = YES;
    }
    return _confirmButton;
}

- (SSCatchShareOrganizer *)organizer {
 [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    if (!_organizer) {
[[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
        _organizer = [[SSCatchShareOrganizer alloc] init];
    }
    return _organizer;
}

@end
