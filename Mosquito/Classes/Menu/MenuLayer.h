//
//  MenuLayer.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import "cocos2d.h"
#import "MainMenuVC.h"

@interface MenuLayer : CCLayer 

@property (retain, nonatomic) MainMenuVC *mainMenu;

+ (CCScene *) scene;

@end
 