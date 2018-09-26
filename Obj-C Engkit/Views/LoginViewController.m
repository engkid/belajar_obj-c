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

@interface LoginViewController () <LoadingDelegate, NetworkServiceDelegate>

//@property (strong, nonatomic) UIView *qrView;
@property (strong, nonatomic) LoadingView *loading;
@property (strong, nonatomic) NetworkServiceHelper *networkService;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;

@end

@implementation LoginViewController

+(instancetype)sharedInstance {
    static LoginViewController *sharedInstance = nil;
    
    static dispatch_once_t DispatchOnce;
    
    dispatch_once(&DispatchOnce, ^{
        sharedInstance = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    });
    
    return sharedInstance;
}

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
    _networkService.delegate = self;
    
//    _qrView = [[UIView alloc] init];
//    _qrView.layer.masksToBounds = YES;
//    _qrView.layer.cornerRadius = 5;
//    _qrView.translatesAutoresizingMaskIntoConstraints = NO;
//    [_qrView setBackgroundColor:[UIColor redColor]];
//
//    [self.view addSubview: _qrView];
    
    [self setupView];
    
}

#pragma mark - buttonActions methods

- (IBAction)nextButtonTapped:(UIButton *)sender {
    
    [_loading show];
    
    SecondViewController *crCodeVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:crCodeVC animated:YES];
}

- (IBAction)loginButtonTapped:(UIButton *)sender {
    
    [_networkService performLogin:self.userTextField.text withPassword:self.passTextField.text completion:^(NSData *response, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error);
        }
        
        NSDictionary *responseDict =(NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:response];
        
        NSLog(@"%@", responseDict);
        
    }];
}

#pragma mark - loadingViewDelegate methods

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

#pragma mark - fileprivate functions

-(void)setupView {
    
//    NSArray *arrConst = @[[self.qrView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100.0], [self.qrView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor], [self.qrView.heightAnchor constraintEqualToConstant:self.view.bounds.size.height / 2], [self.qrView.widthAnchor constraintEqualToConstant:self.view.bounds.size.width - 32]];
//    
//    [NSLayoutConstraint activateConstraints:arrConst];
    
}

- (void)didReceiveFailWhileFetching {
    
}

- (void)didReceiveSuccessWhileFetching {
    NSLog(@"succeed retrieve data");
}

@end
