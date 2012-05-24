//
//  Mosquito.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 23.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


enum MOSQUITOTYPE {
    Normal, Small, Armored
    };


@protocol MosquitoLifeDelegate;


@interface Mosquito : NSObject


@property (assign, nonatomic) id <MosquitoLifeDelegate>  delegate;
@property (assign, nonatomic) NSInteger countShots;
@property (assign, nonatomic) NSInteger countBonus;
@property (assign, nonatomic, getter = isDeath) BOOL death;
@property (retain, nonatomic) CCSprite *mosquitoSprite;
@property (assign, nonatomic) MOSQUITOTYPE mosquitoType;


- (id)initWithType:(enum MOSQUITOTYPE) _type andPosition:(CGPoint) _pos aboveLayer:(CCLayer *) layer;

- (void)suction;

- (void)killYourSelfWithAnimation;
- (void)flyAway;

- (void)freeze;
- (void)unFreeze;


@end



@protocol MosquitoLifeDelegate <NSObject>

@required
- (void) doSuctionWithMosquito:(Mosquito *) mosquit;

@end