//
//  AppDelegate.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright RusWizards LLC 2012. All rights reserved.
//

#import "cocos2d.h"

#import "AppDelegate.h"
#import "MenuLayer.h"

@implementation AppController

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc]initWithFrame: [[UIScreen mainScreen] bounds]];

    
    CCDirector *director = [CCDirector sharedDirector];
    
    viewController = [[RootViewController alloc] init];
    
    CCGLView *glView = [CCGLView viewWithFrame:[window bounds]
                                   pixelFormat:kEAGLColorFormatRGB565    
                                   depthFormat:0    
                            preserveBackbuffer:NO
                                    sharegroup:nil
                                 multiSampling:NO
                               numberOfSamples:0];
    
    [director setView:glView];
    [director setAnimationInterval:1.0 / 60];
    [director setDisplayStats:NO];
    
    [viewController setView:glView];
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];
    
    Class transition = NSClassFromString(@"CCTransitionFade"); 
   
    CCScene *scene = [CCScene node];
    [scene addChild: [MenuLayer node]];
    
    [[CCDirector sharedDirector] runWithScene: [transition transitionWithDuration:0.2f  scene:scene]];
    
    return YES;    
    
}



/*
// getting a call, pause the game
-(void) applicationWillResignActive:(UIApplication *)application
{
	if(viewController == director )
		[director_ pause];
}

// call got rejected
-(void) applicationDidBecomeActive:(UIApplication *)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ resume];
}

-(void) applicationDidEnterBackground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ startAnimation];
}
*/
// application will be killed
- (void)applicationWillTerminate:(UIApplication *)application
{
	CC_DIRECTOR_END();
}

// purge memory
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	[[CCDirector sharedDirector] purgeCachedData];
}

// next delta time will be zero
-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void) dealloc
{
	[self.window release];
	[self.viewController release];

	[super dealloc];
}
@end
