//
//  LevelRoot.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//


#import "cocos2d.h"
#import "MenuViewController.h"
#import "GameObjects.h"

@interface LevelRoot : CCLayer <MosquitoLifeDelegate> {
    
    NSMutableArray *arrayMosquitoes;

}

@property (retain, nonatomic) MenuViewController *menuBar;
@property (retain, nonatomic) Weapon *weapon;

- (void)back; //return to main menu
- (void)startGame; 
- (void)gameLoop;

- (void)createMosquito;
- (void)freezeMosquitoes;
- (void)unFreezeMosquitoes;

- (void)createWeapon;
@end
