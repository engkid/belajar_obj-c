//
//  QRCodeViewController.m
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 25/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

#import "QRCodeViewController.h"

@interface QRCodeViewController ()

@property (nonatomic, strong) UIView *qrView;

@end

@implementation QRCodeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _qrView = [[UIView alloc] init];
        _qrView.layer.masksToBounds = YES;
        _qrView.layer.cornerRadius = 5;
        _qrView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _qrView = [[UIView alloc] init];
    _qrView.layer.masksToBounds = YES;
    _qrView.layer.cornerRadius = 5;
    _qrView.translatesAutoresizingMaskIntoConstraints = NO;
    [_qrView setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview: _qrView];
    
    UIView *childView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height, 50, 50)];
    
    [_qrView addSubview:childView];
    
    [self.view setBackgroundColor: [UIColor redColor]];
    
    [self setupView];
}

-(void)setupView {
    
    NSArray *arrConst = @[[self.qrView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100.0], [self.qrView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor], [self.qrView.heightAnchor constraintEqualToConstant:self.view.bounds.size.height / 2], [self.qrView.widthAnchor constraintEqualToConstant:self.view.bounds.size.width - 32]];
    
    [NSLayoutConstraint activateConstraints:arrConst];
}

@end
