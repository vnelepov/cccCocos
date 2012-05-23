//
//  LevelRoot.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelRoot.h"
#import "MenuLayer.h"

@implementation LevelRoot

@synthesize menuBar;
@synthesize spriteShips;

-(id) init
{
	if( (self = [super init])) {
		
        for (id view in [[[CCDirector sharedDirector] view] subviews]) 
            [view removeFromSuperview];
        
        if( ![[CCDirector sharedDirector] enableRetinaDisplay:YES] )            
            CCLOG(@"Retina of Display don't support");
        else CCLOG(@"Retina of Display supports");
            
        self.menuBar = [[MenuViewController alloc] init];
        self.menuBar.menuController = self;

        [[[CCDirector sharedDirector] view] addSubview:self.menuBar.view];       
    }
	return self;
}

- (void)back{
    
    [[CCDirector sharedDirector] replaceScene:[MenuLayer scene]];  
}

- (void)dealloc{
    [self.spriteShips release];
    [self.menuBar release];
    [super dealloc];
}

@end
