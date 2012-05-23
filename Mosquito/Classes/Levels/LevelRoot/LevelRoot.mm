//
//  LevelRoot.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelRoot.h"
#import "MenuLayer.h"
#import "Mosquito.h"

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
        
        arrayMosquitoes = [[NSMutableArray alloc] init];
    }
	return self;
}

- (void)back{
    
    [[CCDirector sharedDirector] replaceScene:[MenuLayer scene]];  
}

- (void)startGame{
    [self gameCycle];
}

- (void)gameCycle{
    [self createMosquito];
    int i = 0;
    int mosScale = 0;
    while (i!=0) {
        for (Mosquito *obj in arrayMosquitoes) {
            mosScale = [obj.mosquitoSprite.actionManager numberOfRunningActionsInTarget:obj.mosquitoSprite];
            if (mosScale == 0) {
                [obj.mosquitoSprite removeFromParentAndCleanup:YES];
                [arrayMosquitoes removeObjectAtIndex:0];
                i++;
                
                
            }
            
        }
        
        sleep(2);
    }
    
}

- (void)createMosquito{

    Mosquito *mosquito = [[Mosquito alloc] initWithType:Normal andPosition:ccp(100,100) aboveLayer:self];
    [mosquito setDelegate:self];
    [arrayMosquitoes addObject:mosquito];
    [mosquito release];

}
- (void)doSuctionWithMosquito:(Mosquito *)mosquit{
    [mosquit.mosquitoSprite removeFromParentAndCleanup:YES];
    [arrayMosquitoes removeObjectIdenticalTo:mosquit];
}

- (void)dealloc{
    [arrayMosquitoes release];
    [self.spriteShips release];
    [self.menuBar release];
    [super dealloc];
}

@end
