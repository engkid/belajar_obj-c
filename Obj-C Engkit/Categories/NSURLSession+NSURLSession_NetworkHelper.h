//
//  NSURLSession+NSURLSession_NetworkHelper.h
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 24/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetworkServiceDelegate.h"

@interface NSURLSession (NSURLSession_NetworkHelper)

-(void)request: (NSString *) url withParameters: (NSDictionary *) param completionHandler:(void (^)(NSData* response, NSError* error)) completion;
-(void)request:(NSString *)method withURL: (NSString *) url completionHandler: (void (^)(NSDictionary *responseDict, NSError *error)) completion;

@end
