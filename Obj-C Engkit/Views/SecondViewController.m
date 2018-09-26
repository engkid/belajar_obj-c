//
//  SecondViewController.m
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 26/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

#import "SecondViewController.h"
#import "LoadingView.h"
#import "LoadingDelegate.h"

@interface SecondViewController () <LoadingDelegate>

@property (strong, nonatomic) LoadingView *loading;

@end

@implementation SecondViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _loading = [[LoadingView alloc] init];
        _loading.delegate = self;
    }
    return self;
}

#pragma mark - buttonAction methods

- (IBAction)delegateTapped:(UIButton *)sender {
    [_loading show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - loadingDelegate methods

- (void)wasAddedToScreen:(NSString *)sender {
    
}

- (void)wasRemovedFromScreen:(NSString *)sender {
    
}

@end
