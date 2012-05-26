//
//  RootMenuVC.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import "RootMenuVC.h"

@implementation RootMenuVC

- (id)init
{
    self = [super init];
    if (self) { 
        
        for (id view in [[[CCDirector sharedDirector] view] subviews]) 
        
            if ([view isKindOfClass:[UIView class]]) {
                [view removeFromSuperview];
               
            }
        
    }
    return self;
}





@end
