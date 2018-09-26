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
    
    [param setValue:@"asdasdasd" forKey:@"username"];
    [param setValue:@"pass" forKey:@"password"];
    
    NSURLSession *session = [[NSURLSession alloc] init];
    
    [session request:k_LOGIN_URL withParameters:param completionHandler:^(NSData *response, NSError *error) {
        
        completion(response, error);
        
    }];
    
}

-(void)getAnimeList:(dictionarySuccessBlock)successBlock failureBlock:(failureBlock)failureBlock {
    
    NSURLSession *session = [[NSURLSession alloc] init];
    
    [session request:@"GET" withURL:k_LOGIN_URL completionHandler:^(NSDictionary *responseDict, NSError *error) {
        
        if (error) {
            failureBlock(error);
        }
        
        successBlock(responseDict);
        
    }];
    
}

@end
