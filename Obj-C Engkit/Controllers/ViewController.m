//
//  ViewController.m
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 24/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

#import "LoadingView.h"

#import "NetworkServiceHelper.h"

#import "NSURLSession+NSURLSession_NetworkHelper.h"

#import "QRCodeViewController.h"

#import "ViewController.h"

@interface ViewController () <LoadingDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;
@property (strong, nonatomic) LoadingView* loading;
@property (strong, nonatomic) NetworkServiceHelper* networkService;
@property (weak, nonatomic) NSDictionary *responseDict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loading = [[LoadingView alloc] initWithOwner:self];
    self.networkService = [[NetworkServiceHelper alloc] init];
    
    self.loading.delegate = self;
}

- (IBAction)nextButtonTapped:(id)sender {
    
    [self performSegueWithIdentifier:@"showNext" sender:sender];
}

- (IBAction)loginButtonTapped:(id)sender {
    [self.loading show];
}

-(void) wasAddedToScreen:(NSString*) sender {
    NSString *user = self.userTextField.text;
    NSString *pass = self.passTextField.text;
    
//    [self.networkService performLogin:user withPassword:pass completion:^(NSData *response, NSError *error) {
//
//        if (error) {
//
//        }
//
//
//    }];
    
    
    [self.networkService getAnimeList:^(NSDictionary *responseDict) {
        
        self.responseDict = responseDict;
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.userTextField.text = [self.responseDict valueForKey:@"Contact"];
            self.passTextField.text = [self.responseDict valueForKey:@"Author"];
            
        });
        
        NSLog(@"%@, %@", self.responseDict, sender);
    } failureBlock:^(NSError *error) {
        
    }];

}

-(void) wasRemovedFromScreen:(NSString*) sender {
    
}

@end
