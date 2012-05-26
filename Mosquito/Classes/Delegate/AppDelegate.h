//
//  AppDelegate.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright RusWizards LLC 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "RootViewController.h"
#import "CaptureAction.h"
#import "AVFoundation/AVFoundation.h"
@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>


@property (nonatomic, retain) UIWindow *window;
@property (readonly) RootViewController *viewController;
@property (nonatomic, retain) CaptureAction *captureAction;
@property (nonatomic, retain)  CCDirector *director;

@end
