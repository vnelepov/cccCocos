//
//  Level1.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import "Level1.h"


@implementation Level1

-(id) init
{
	if( (self = [super init])) {
        // Set backgroud for level
        CCSprite* levelBackground = [CCSprite spriteWithFile:@"bg_1.jpg"];
        [levelBackground setPosition:ccp(240, 160)];
        // z:0 for location background under others sprite
        [self addChild:levelBackground z:0];
        
        [self startGame];
        
     }        
    
	return self;
}


@end
