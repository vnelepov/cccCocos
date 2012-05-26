//
//  Weapon.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 24.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import "Weapon.h"

#define Z_ORDER 1000000

@implementation Weapon

@synthesize weaponSprite;
@synthesize power;

- (void)dealloc{
    
    [weaponSprite release];
    [super dealloc];
}
- (id)initWithType:(WEAPONTYPE) _type aboveLayer:(CCLayer *) layer{
    if (self = [super init]) {
        // z:1000000 for location weapon over others sprite
        if (_type == OneTrunk) {
            
            self.weaponSprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
            self.weaponSprite.position = ccp(240,20);
            [layer addChild:self.weaponSprite z:Z_ORDER];
            
            self.power = 1;
            
        } else if (_type == TwoTrunk) {
            
            self.weaponSprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
            self.weaponSprite.position = ccp(240,20);
            [layer addChild:self.weaponSprite z:Z_ORDER];
        
            self.power = 2;
        } 

    }
    return self;
}

- (void)shotAnimate{

    CCSprite *sprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
    sprite.position = ccp(14.5,30);
    [self.weaponSprite addChild:sprite z:Z_ORDER];
    id anim = [CCFadeTo actionWithDuration:0.7f opacity:0.0f];
    id actionCallBackFunc = [CCCallFunc actionWithTarget:self selector:@selector(clearFromLayer)];
    id seqAnims = [CCSequence actions:[[anim copy] autorelease],[[actionCallBackFunc copy] autorelease], nil];
    [sprite  runAction:seqAnims];        
}    

- (void)clearFromLayer{
      [self.weaponSprite removeAllChildrenWithCleanup:YES];
}

@end
