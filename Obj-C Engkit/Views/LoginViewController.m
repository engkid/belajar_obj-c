//
//  LoginViewController.m
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 25/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

#import "LoginViewController.h"

#import "LoadingView.h"

#import "SecondViewController.h"

#import "LoadingDelegate.h"

#import "NetworkServiceHelper.h"

@interface LoginViewController () <LoadingDelegate>

@property (strong, nonatomic) UIView *qrView;
@property (strong, nonatomic) LoadingView *loading;
@property (strong, nonatomic) NetworkServiceHelper *networkService;

@end

@implementation LoginViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loading = [[LoadingView alloc] init];
    _networkService = [[NetworkServiceHelper alloc] init];
    
    _loading.delegate = self;
    
    _qrView = [[UIView alloc] init];
    _qrView.layer.masksToBounds = YES;
    _qrView.layer.cornerRadius = 5;
    _qrView.translatesAutoresizingMaskIntoConstraints = NO;
    [_qrView setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview: _qrView];
    
    [self setupView];
    
    
}

- (IBAction)nextButtonTapped:(UIButton *)sender {
    
    [_loading show];
    
    SecondViewController *crCodeVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:crCodeVC animated:YES];
    
}

-(void)setupView {
    
    UIView *childView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height, 50, 50)];
    [childView setBackgroundColor:[UIColor blueColor]];
    
    [_qrView addSubview:childView];
    
    NSArray *arrConst = @[[self.qrView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100.0], [self.qrView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor], [self.qrView.heightAnchor constraintEqualToConstant:self.view.bounds.size.height / 2], [self.qrView.widthAnchor constraintEqualToConstant:self.view.bounds.size.width - 32]];
    
    [NSLayoutConstraint activateConstraints:arrConst];
    
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:@"image.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    
    imgView.frame = CGRectMake(0, 0, 100, 100);
    
    [self.qrView addSubview:imgView];
}

- (void)wasAddedToScreen:(NSString *)sender {
    
    [_networkService getAnimeList:^(NSDictionary *responseDict) {
        NSLog(@"%@", responseDict);
    } failureBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    NSLog(@"%@", sender);
}

- (void)wasRemovedFromScreen:(NSString *)sender {
    
}

@end
