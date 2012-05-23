//
//  MenuLayer.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
#import "MainMenuVC.h"

@implementation MenuLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MenuLayer *layer = [MenuLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init {
	if( (self = [super init])) {
        MainMenuVC *mainMenu = [[MainMenuVC alloc] init];
        mainMenu.menuController = self;
        [[[CCDirector sharedDirector] view] addSubview:mainMenu.view];
        
        
    }
	return self;
}

@end
