//
//  Mosquito.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 23.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"




enum MOSQUITOTYPE {
    Normal, Small, Armored
    };

@protocol MosquitoLifeDelegate;

@interface Mosquito : NSObject{
 //   enum MOSQUITOTYPE mosquitoType;
    BOOL isDeath; 
    
}

@property (assign, nonatomic) id <MosquitoLifeDelegate>  delegate;
@property (retain, nonatomic) CCSprite *mosquitoSprite;


- (id)initWithType:(enum MOSQUITOTYPE) _type andPosition:(CGPoint) _pos aboveLayer:(CCLayer *) layer;
- (void)suction;



@end

@protocol MosquitoLifeDelegate <NSObject>

@required
- (void) doSuctionWithMosquito:(Mosquito *) mosquit;

@end