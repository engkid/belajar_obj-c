//
//  NetworkServiceDelegate.h
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 24/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

@protocol NetworkServiceDelegate <NSObject>

-(void) didReceiveSuccessWhileFetching;
-(void) didReceiveFailWhileFetching;

@end
