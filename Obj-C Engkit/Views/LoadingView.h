//
//  LoadingView.h
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 24/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LoadingDelegate.h"

@interface LoadingView : NSObject

@property (nonatomic, weak) id <LoadingDelegate> delegate;

- (id)initWithOwner: (UIViewController*) viewController;
- (void) show;
- (void) hide;

@end
