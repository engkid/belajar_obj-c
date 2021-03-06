//
//  networkServiceHelper.m
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 24/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//
#import "NetworkServiceHelper.h"

#import "AppConstants.h"

#import "NSURLSession+NSURLSession_NetworkHelper.h"

static NSString *loginUrlConstant = @"https://api.jikan.moe/v3";

@implementation NetworkServiceHelper

-(void)performLogin: (NSString *) username withPassword: (NSString *) password completion: (void (^)(NSData* response, NSError* error)) completion {
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    [param setValue:username forKey:@"username"];
    [param setValue:password forKey:@"password"];
    
    NSURLSession *session = [[NSURLSession alloc] init];
    
    __weak typeof (self)weakSelf = self; //avoid retain cycle that can causing memory leak
    
    [session request:k_LOGIN_URL withParameters:param completionHandler:^(NSData *response, NSError *error) {
        
        __strong typeof (weakSelf)strongSelf = weakSelf; //avoid retain cycle that can causing memory leak
        
        if (!error) {
            if ([strongSelf.delegate respondsToSelector:@selector(didReceiveSuccessWhileFetching)]) {
                [strongSelf.delegate didReceiveSuccessWhileFetching];
            }
            
//            [self.delegate didReceiveSuccessWhileFetching];
        }
        
        completion(response, error);
        
    }];
    
}

-(void)getAnimeList:(dictionarySuccessBlock)successBlock failureBlock:(failureBlock)failureBlock {
    
    NSURLSession *session = [[NSURLSession alloc] init];
    
    __weak typeof(self)weakSelf = self; //avoid retain cycle that can causing memory leak
    
    [session request:@"GET" withURL:k_LOGIN_URL completionHandler:^(NSDictionary *responseDict, NSError *error) {
        
        __strong typeof(weakSelf)strongSelf = weakSelf; //avoid retain cycle that can causing memory leak
        
        if (error) {
            failureBlock(error);
        }
        
        successBlock(responseDict);
        if ([strongSelf.delegate respondsToSelector:@selector(didReceiveSuccessWhileFetching)]) {
            [strongSelf.delegate didReceiveSuccessWhileFetching];
        }
        
//        [self.delegate didReceiveSuccessWhileFetching];
    }];
    
}

@end
