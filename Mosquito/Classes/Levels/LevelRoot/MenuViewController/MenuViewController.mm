//
//  MenuViewController.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuViewController.h"
#import "LevelRoot.h"
#import "CaptureAction.h"

@implementation MenuViewController

@synthesize menuController;
@synthesize buttonExit;
@synthesize captureAction;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.captureAction = [[CaptureAction alloc] init];
    [self.captureAction initDevice];
    [self.captureAction addVideoLayer];
    [self.captureAction addOutput];
    AVCaptureVideoDataOutput *captureOutput = [[AVCaptureVideoDataOutput alloc] init];
    captureOutput.alwaysDiscardsLateVideoFrames = YES;
    
//    captureAction.captureLayer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI/.25f, 0, 100, 1);
    [captureAction.captureLayer setOrientation:AVCaptureVideoOrientationLandscapeRight];
    CGRect videoLayer = [self.view bounds];
    [self.captureAction.captureLayer setBounds:videoLayer];
    [self.captureAction.captureLayer setPosition:CGPointMake(CGRectGetMidX(videoLayer),CGRectGetMidY(videoLayer))];
    [self.view.layer addSublayer:self.captureAction.captureLayer];
    
      
    
    [self.captureAction.captureThread startRunning];
    self.buttonExit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.buttonExit setTitle:@"Exit" forState:UIControlStateNormal];
    self.buttonExit.frame = CGRectMake(10, 40, 120, 40);
    [self.buttonExit addTarget:self.menuController  action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buttonExit];
    }

- (void)viewDidUnload
{
    [self setButtonExit:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc{
    [self.captureAction release];
    [self.menuController release];
    [self.buttonExit release];
    [super dealloc];
}


@end
