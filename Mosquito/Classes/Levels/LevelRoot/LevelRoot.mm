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
#import "AppDelegate.h"

//static int score = 0;
//static int health = 5;

#define COUNT_MOSQUITOES 5
#define TIME_GAME_LOOP 0.5f //seconds

#define TAG_FOR_MOSQUITOES 999999

@implementation LevelRoot

@synthesize menuBar;
@synthesize weapon;
@synthesize locationManager;

#pragma mark - Dealloc
- (void)dealloc{
    [self.weapon release];
    [arrayMosquitoes release];
//    [self.menuBar release]; // release work into -(void)back 
    [self.locationManager release];
    [super dealloc];
}

-(id) init
{
	if( (self = [super init])) {
		
        
        for (id view in [[[CCDirector sharedDirector] view] subviews])
        {
            [view removeFromSuperview];
        }

        self.zOrder = 9;
        if( ![[CCDirector sharedDirector] enableRetinaDisplay:YES] )            
            CCLOG(@"Retina of Display don't support");
        else CCLOG(@"Retina of Display supports");
        
        if (!self.menuBar) {
            self.menuBar = [[[MenuViewController alloc] init] autorelease];
            self.menuBar.menuController = self;
            [[[CCDirector sharedDirector] view] addSubview:self.menuBar.view];       
        }
        
        
        [((AppController *)[[UIApplication sharedApplication] delegate]).captureAction.captureThread startRunning];

        
        if (!arrayMosquitoes) {
            arrayMosquitoes = [[NSMutableArray alloc] init];
        }
        srand ( time(NULL) );
        self.isTouchEnabled = YES;
        self.isAccelerometerEnabled = YES;
        locationManager = nil;
        self.locationManager = [[[CLLocationManager alloc] init] autorelease];
        self.locationManager.delegate = self;
        if([CLLocationManager locationServicesEnabled] && [CLLocationManager headingAvailable]) 	
        {
            [self.locationManager startUpdatingLocation];
            [self.locationManager startUpdatingHeading];
        } else {
            NSLog(@"Can't report heading");
        }
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    }
	return self;
}

- (void)back{
    [((AppController *)[[UIApplication sharedApplication] delegate]).captureAction.captureThread stopRunning];
    [self removeAllChildrenWithCleanup:YES];
    [self removeFromParentAndCleanup:YES];
    [[CCDirector sharedDirector] replaceScene:[MenuLayer scene]];
    [self.menuBar release];
}


#pragma mark - Game actions

- (void)startGame{
    [self createWeapon];
    [self schedule:@selector(gameLoop) interval:TIME_GAME_LOOP];
}

- (void)gameLoop{

    if ([arrayMosquitoes count]<COUNT_MOSQUITOES) [self createMosquito];
    
    
}

#pragma mark - Create gameplay objects
#pragma mark - Work with mosquitoes

- (void)createMosquito{
    int x,y,z;
    x = rand() % 420 + 30;
    y = rand() % 280 + 30;

    
    // definition mosquitoes order
    int min_z = 1000000;
    
    for(CCSprite *sprite in self.children) {
        if ([sprite isKindOfClass:[CCSprite class]]) 
            if (sprite.tag == TAG_FOR_MOSQUITOES && min_z > sprite.zOrder) 
               min_z = sprite.zOrder;
    }
    
    z = min_z-1;
    if (z < 1) z = 1000000;

    Mosquito *mosquito = [[Mosquito alloc] initWithType:Normal andPosition:ccp(x,y) aboveLayer:self];
    [mosquito setDelegate:self];
    mosquito.mosquitoSprite.tag = TAG_FOR_MOSQUITOES;
    [arrayMosquitoes addObject:mosquito];

    // Set new mosquito under others mosquito
    [self reorderChild:mosquito.mosquitoSprite z:z];
    
    [mosquito release];

}

- (void) freezeMosquitoes{
    [self pauseSchedulerAndActions];
    for (Mosquito *obj in arrayMosquitoes) {
        [obj freeze];
    }

}

- (void) unFreezeMosquitoes{
    [self resumeSchedulerAndActions];
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
    
    self.weapon = [[[Weapon alloc] initWithType:OneTrunk aboveLayer:self] autorelease];
    
}


#pragma mark - Device controllers
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    [self.weapon shotAnimate];
    return YES;
}


- (void)locationManager:(CLLocationManager*)manager didUpdateHeading:(CLHeading*)newHeading{
    
    // If the accuracy is valid, process the event.
    if (newHeading.headingAccuracy > 0){
//        CLLocationDirection theHeading = newHeading.magneticHeading;
        
    //    NSLog(@"%f",theHeading);
        
        // Do something with the event data.
        
    }
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration {	
    
   // NSLog(@"%f",acceleration.x);

}


@end
