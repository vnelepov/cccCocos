//
//  Weapon.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 24.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Weapon.h"

@implementation Weapon

@synthesize weaponSprite;
@synthesize power;

- (void)dealloc{
    
    [weaponSprite release];
    [super dealloc];
}
- (id)initWithType:(WEAPONTYPE) _type aboveLayer:(CCLayer *) layer{
    if (self = [super init]) {

        if (_type == OneTrunk) {
            
            self.weaponSprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
            self.weaponSprite.position = ccp(240,20);
            [layer addChild:self.weaponSprite];
            
            self.power = 1;
            
        } else if (_type == TwoTrunk) {
            
            self.weaponSprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
            self.weaponSprite.position = ccp(240,20);
            [layer addChild:self.weaponSprite];
        
            self.power = 2;
        }

    }
    return self;
}

- (void)shotAnimateOnLayer{

    CCSprite *sprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
    sprite.position = ccp(14.5,30);
    [weaponSprite addChild:sprite];
    // Create animation for mosquito's fly
    id anim = [CCFadeTo actionWithDuration:0.7f opacity:0.0f];
    [sprite  runAction:anim];        
}    

@end
