//
//  LoadingView.m
//  Obj-C Engkit
//
//  Created by Engkit Satia Riswara on 24/09/18.
//  Copyright © 2018 Engkit Satia Riswara. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView()

@property (strong, nonatomic) UIActivityIndicatorView *loadingView;

@end

@implementation LoadingView

- (id)init {
    self = [super init];
    
    if (self) {
        return self;
    }
    
    return nil;
}

- (id)initWithOwner: (UIViewController*) viewController {
    
    self = [self init];
    
    return self;
}

- (void) show {
    [self.delegate wasAddedToScreen:@"loading added to the screen"];
}

- (void) hide {
    [self.delegate wasRemovedFromScreen:@"Loading removed from the screen"];
}

@end
