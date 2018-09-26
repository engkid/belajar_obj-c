//
//  LoadingDelegate.h
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 24/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

@protocol LoadingDelegate <NSObject>

-(void) wasAddedToScreen:(NSString*) sender;
-(void) wasRemovedFromScreen:(NSString*) sender;

@end

@protocol textFieldDelegate <NSObject>

-(NSString*) getUserTextValue;
-(NSString*) getPasswordTextValue;

@end
