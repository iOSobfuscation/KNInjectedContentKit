//
//  ICKViewController.m
//  InjectedContentKit
//
//  Created by flypigrmvb on 02/09/2018.
//  Copyright (c) 2018 flypigrmvb. All rights reserved.
//

#import "ICKViewController.h"
#import <InjectedContentKit.h>

@implementation ICKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [[GameDetailDataComposer new] loadDataWithBlock:nil];
    
    [[PubSearchDataComposer new] loadSuggestionWithCompletionBlock:nil];
    
    [[WriterDataComposer new] loadWithType:MMLoadTypeMore completionBlock:nil];
    
    
    NSLog(@"====");
    NSString* bundlePath = [[NSBundle mainBundle] resourcePath];
    NSFileManager* manager = [NSFileManager defaultManager];
    NSString* path = [NSString stringWithFormat:@"%@/_CodeSignature/CodeResources", bundlePath];
    NSData* data = [manager contentsAtPath:path];
    NSString* hashStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"\n%@", hashStr);
    
    NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"\n%@", dict);
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key=%@ ==> obj=%@", key, obj);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"====");
    NSString* bundlePath = [[NSBundle mainBundle] resourcePath];
    NSFileManager* manager = [NSFileManager defaultManager];
    NSString* path = [NSString stringWithFormat:@"%@/_CodeSignature/CodeResources", bundlePath];
    NSData* data = [manager contentsAtPath:path];
    NSString* hashStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"\n%@", hashStr);
    
    NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"\n%@", dict);
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key=%@ ==> obj=%@", key, obj);
    }];
}

@end
