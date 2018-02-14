//
//  ICKViewController.m
//  InjectedContentKit
//
//  Created by flypigrmvb on 02/09/2018.
//  Copyright (c) 2018 flypigrmvb. All rights reserved.
//

#import "ICKViewController.h"
#import <InjectedContentKit.h>

@interface ICKViewController ()

@end

@implementation ICKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [[GameDetailDataComposer new] loadDataWithBlock:nil];
    
    [[PubSearchDataComposer new] loadSuggestionWithCompletionBlock:nil];
    
    [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
