//
//  LevelRoot.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import "LevelRoot.h"
#import "MenuLayer.h"
#import "CCTouchDispatcher.h"

//static int score = 0;
//static int health = 5;

@implementation LevelRoot

@synthesize menuBar;
@synthesize weapon;

#pragma mark - Dealloc
- (void)dealloc{
    [self.weapon release];
    [arrayMosquitoes release];
    [self.menuBar release];
    [super dealloc];
}

-(id) init
{
	if( (self = [super init])) {
		
        for (id view in [[[CCDirector sharedDirector] view] subviews])
        {
            [view removeFromSuperview];
        }
        if( ![[CCDirector sharedDirector] enableRetinaDisplay:YES] )            
            CCLOG(@"Retina of Display don't support");
        else CCLOG(@"Retina of Display supports");
            
        self.menuBar = [[MenuViewController alloc] init];
        self.menuBar.menuController = self;

        [[[CCDirector sharedDirector] view] addSubview:self.menuBar.view];       
        
        arrayMosquitoes = [[NSMutableArray alloc] init];
        
        self.isTouchEnabled = YES;
        
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    }
	return self;
}

- (void)back{

    [[CCDirector sharedDirector] replaceScene:[MenuLayer scene]];
 
}


#pragma mark - Game actions

- (void)startGame{
    [self gameCycle];
}

- (void)gameCycle{
    [self createWeapon];
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

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    [self.weapon shotAnimateOnLayer];
    return YES;
}

#pragma mark - Create gameplay objects
#pragma mark - Work with mosquitoes

- (void)createMosquito{

    Mosquito *mosquito = [[Mosquito alloc] initWithType:Normal andPosition:ccp(100,100) aboveLayer:self];
    [mosquito setDelegate:self];
    [arrayMosquitoes addObject:mosquito];
    [mosquito release];
    mosquito = [[Mosquito alloc] initWithType:Normal andPosition:ccp(200,200) aboveLayer:self];
    [mosquito setDelegate:self];
    [arrayMosquitoes addObject:mosquito];
    [mosquito release];


}

- (void) freezeMosquitoes{
    for (Mosquito *obj in arrayMosquitoes) {
        [obj freeze];
    }

}

- (void) unFreezeMosquitoes{
    for (Mosquito *obj in arrayMosquitoes) {
        [obj unFreeze];
    }
    
}

#pragma mark - Mosquitoes delegate methods

- (void)doSuctionWithMosquito:(Mosquito *)mosquit{
    [arrayMosquitoes removeObjectIdenticalTo:mosquit];
    [mosquit flyAway];
    
}

#pragma mark - Work with weapon

- (void)createWeapon{
    
    self.weapon = [[Weapon alloc] initWithType:OneTrunk aboveLayer:self];
    [self.weapon shotAnimateOnLayer];
    
}






@end
