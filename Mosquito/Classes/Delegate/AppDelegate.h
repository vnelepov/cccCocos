//
//  AppDelegate.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "RootViewController.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window;
	UINavigationController *navController;

}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) RootViewController *viewController;

@end
