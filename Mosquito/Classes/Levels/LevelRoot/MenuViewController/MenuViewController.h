//
//  MenuViewController.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LevelRoot;
@class CaptureAction;

@interface MenuViewController : UIViewController

@property (retain, nonatomic) LevelRoot *menuController;
@property (nonatomic, retain) UIButton *buttonExit;
@property (retain) CaptureAction *captureAction;




@end
