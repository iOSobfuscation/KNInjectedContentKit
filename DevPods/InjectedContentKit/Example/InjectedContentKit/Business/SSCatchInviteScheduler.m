

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
    [super viewDidLoad];
    
    [self makeAppearance];
    [self configAppearance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeAppearance {
    
}

- (void)configAppearance {
    // 邀请码
   
}


#pragma mark - ......::::::: UI Responder :::::::......

- (void)confirmPressTapped {
    
}


#pragma mark - ......::::::: Lazy load :::::::......

- (UIImageView *)inputCardBack {
    if (!_inputCardBack) {
        _inputCardBack = [UIImageView new];
        _inputCardBack.image = [UIImage imageNamed:@"share_input_back"];
        _inputCardBack.userInteractionEnabled = YES;
        
        [_inputCardBack addSubview:self.inputTextBack];
        
    }
    return _inputCardBack;
}

- (UIImageView *)inputTextBack {
    if (!_inputTextBack) {
        _inputTextBack = [UIImageView new];
        _inputTextBack.image = [UIImage imageNamed:@"signIn_input_back"];
        _inputTextBack.userInteractionEnabled = YES;
    }
    return _inputTextBack;
}

- (UIImageView *)ruleCardBack {
    if (!_ruleCardBack) {
        _ruleCardBack = [UIImageView new];
        _ruleCardBack.image = [UIImage imageNamed:@"share_input_back"];
        _ruleCardBack.clipsToBounds = YES;
    }
    return _ruleCardBack;
}

- (UILabel *)ruleCardTextBox {
    if (!_ruleCardTextBox) {
        _ruleCardTextBox = [UILabel new];
        _ruleCardTextBox.numberOfLines = 0;
    }
    return _ruleCardTextBox;
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton.enabled = YES;
    }
    return _confirmButton;
}

- (SSCatchShareOrganizer *)organizer {
    if (!_organizer) {
        _organizer = [[SSCatchShareOrganizer alloc] init];
    }
    return _organizer;
}

@end
