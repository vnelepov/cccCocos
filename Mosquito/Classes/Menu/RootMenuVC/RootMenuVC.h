//
//  RootMenuVC.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class MenuLayer;

@interface RootMenuVC : UIViewController

@property (nonatomic, retain) MenuLayer *menuController;

@end
