//
//  MenuViewController.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import "MenuViewController.h"
#import "LevelRoot.h"
#import "CaptureAction.h"

@implementation MenuViewController

@synthesize menuController;
@synthesize buttonExit;

- (void)dealloc{
    [self.menuController release];
    [self.buttonExit release];
    [super dealloc];
}


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
    
    }

- (void)viewDidUnload
{
    [self setButtonExit:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (IBAction)buttonExit:(id)sender {
    [self.menuController back];
}

- (IBAction)testt:(id)sender {
    [self.menuController freezeMosquitoes];       
}

- (IBAction)tttttt:(id)sender {
    [self.menuController unFreezeMosquitoes];
}
@end
