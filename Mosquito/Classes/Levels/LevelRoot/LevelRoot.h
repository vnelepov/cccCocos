//
//  LevelRoot.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "cocos2d.h"
#import "MenuViewController.h"
#import "Mosquito.h"

@interface LevelRoot : CCLayer <MosquitoLifeDelegate> {
    CCSprite *spriteShips;
    NSMutableArray *arrayMosquitoes;
}

@property (retain, nonatomic)  MenuViewController *menuBar;
@property (retain, nonatomic) CCSprite *spriteShips;


- (void)back;
- (void)startGame;
- (void)gameCycle;
- (void)createMosquito;


@end
