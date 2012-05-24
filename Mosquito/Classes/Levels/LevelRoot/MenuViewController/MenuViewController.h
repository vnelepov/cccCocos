//
//  MenuViewController.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LevelRoot;

@interface MenuViewController : UIViewController

@property (retain, nonatomic) LevelRoot *menuController;
@property (nonatomic, retain) UIButton *buttonExit;


- (IBAction)buttonExit:(id)sender;

- (IBAction)testt:(id)sender;

- (IBAction)tttttt:(id)sender;

@end
