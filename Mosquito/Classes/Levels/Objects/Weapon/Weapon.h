//
//  Weapon.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 24.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

enum WEAPONTYPE {
    OneTrunk, TwoTrunk
    };

@interface Weapon : NSObject

@property (retain, nonatomic) CCSprite *weaponSprite;
@property (assign, nonatomic) NSInteger power;

- (id)initWithType:(WEAPONTYPE) _type aboveLayer:(CCLayer *) layer;
- (void)shotAnimateOnLayer;
@end
