//
//  ICKXibTestViewController.m
//  InjectedContentKit_Example
//
//  Created by aron on 2018/4/8.
//  Copyright © 2018年 flypigrmvb. All rights reserved.
//

#import "ICKXibTestViewController.h"

@interface ICKXibTestViewController ()

@end

@implementation ICKXibTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)hello:(NSString*)name
          age:(NSUInteger)age {
    
}

- (void)fetchCodeWithToast:(BOOL)showToast completion:(void (^)(NSString* invitationCode))block {
    
    
    
}

- (void)fetchInvitateWithCode:(NSString*)invitationCode
                        toast:(BOOL)showToast
                   completion:(void (^)(BOOL result))block {
    
    
}


@end
