//
//  MenuLayer.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import "MenuLayer.h"


@implementation MenuLayer

@synthesize mainMenu;

- (void) dealloc{
    [self.mainMenu release];
    [super dealloc];
}

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MenuLayer *layer = [MenuLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init {
    
	if( (self = [super init])) {

        mainMenu = [[MainMenuVC alloc] init];
        [[[CCDirector sharedDirector] view] addSubview:mainMenu.view];

    }
	return self;
}

@end
