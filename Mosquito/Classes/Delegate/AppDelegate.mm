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
@synthesize captureAction;
@synthesize director;

- (void) dealloc
{
	[self.window release];
	[self.viewController release];
    [self.director release];
	[super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc]initWithFrame: [[UIScreen mainScreen] bounds]];

    
    director = [CCDirector sharedDirector];
    
    viewController = [[RootViewController alloc] init];
    
    CCGLView *glView = [CCGLView viewWithFrame:[window bounds]
                                   pixelFormat:kEAGLColorFormatRGBA8    
                                   depthFormat:0    
                            preserveBackbuffer:NO
                                    sharegroup:nil
                                 multiSampling:NO
                               numberOfSamples:0];
    
    [director setView:glView];

    [director setAnimationInterval:1.0 / 40];
    [director setDisplayStats:YES];
    

    captureAction = [[CaptureAction alloc] init];
    [captureAction initDevice];
    [captureAction addVideoLayer];
    [captureAction addOutput];
    
    
    CGRect videoLayer = [glView.layer bounds];
    [captureAction.captureLayer setBounds:videoLayer];
    [captureAction.captureLayer setPosition:CGPointMake(CGRectGetMidY(videoLayer),CGRectGetMidX(videoLayer))];
    captureAction.captureLayer.transform = CATransform3DRotate(CATransform3DIdentity, -M_PI/2.0f, 0, 0, 1);
    captureAction.captureLayer.zPosition=0;
    
    
    glView.opaque = NO;
    // FIX bug cocos2d v.2
	glClearColor(0.0f,0.0f,0.0f,0.0f);
	glClear(GL_COLOR_BUFFER_BIT);
    
    [self.viewController.view.layer addSublayer:captureAction.captureLayer];
    [self.viewController.view addSubview:glView];
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];
    
    Class transition = NSClassFromString(@"CCTransitionFade"); 
   
    CCScene *scene = [CCScene node];
    [scene addChild: [MenuLayer node]];
    [CCTexture2D setDefaultAlphaPixelFormat: kCCTexture2DPixelFormat_RGBA8888];
    [[CCDirector sharedDirector] runWithScene: [transition transitionWithDuration:0.2f  scene:scene]];
    
    return YES;    
    
}




// getting a call, pause the game
-(void) applicationWillResignActive:(UIApplication *)application
{
	if(![director isPaused])
		[director pause];
}

// call got rejected
-(void) applicationDidBecomeActive:(UIApplication *)application
{
	if([director isPaused])
		[director resume];
}

-(void) applicationDidEnterBackground:(UIApplication*)application
{
	if([director isAnimating])
		[director stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application
{
	if(![director isAnimating])
		[director startAnimation];
}

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


@end
