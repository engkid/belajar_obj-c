//
//  networkServiceHelper.h
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 24/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkServiceDelegate.h"

@interface NetworkServiceHelper : NSObject

typedef void (^failureBlock)(NSError *error);
typedef void (^dictionarySuccessBlock)(NSDictionary *responseDict);
typedef void (^httpURLResponse)(NSHTTPURLResponse *urlResponse);

@property (weak, nonatomic) id <NetworkServiceDelegate> delegate;

-(void)performLogin:(NSString *) username withPassword: (NSString *) password completion: (void (^)(NSData* response, NSError* error)) completion;

-(void)getAnimeList: (dictionarySuccessBlock) successBlock failureBlock:(failureBlock) failureBlock;

@end
