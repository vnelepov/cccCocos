//
//  Mosquito.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 23.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import "Mosquito.h"



@implementation Mosquito

// for release
@synthesize mosquitoSprite;

// not release
@synthesize delegate;
@synthesize countShots;
@synthesize countBonus;
@synthesize death;
@synthesize mosquitoType;

- (void) dealloc{
    [self.mosquitoSprite release];	
    [super dealloc];
}

// Create mosquito and animation him
- (id)initWithType:(MOSQUITOTYPE) _type andPosition:(CGPoint) _pos aboveLayer:(CCLayer *) layer{
    if (self = [super init]) {
        self.death = NO;
        if (_type == Normal) {
            
            self.mosquitoSprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
            self.mosquitoSprite.position = _pos;
            self.mosquitoSprite.scale = 0.1f;
            [layer addChild:self.mosquitoSprite];
            
            self.countBonus = 5;
            self.countShots = 1;
            self.mosquitoType = Normal;
            
        } else if (_type == Small) {
        
            self.mosquitoSprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
            self.mosquitoSprite.position = _pos;
            self.mosquitoSprite.scale = 0.1f;
            [layer addChild:self.mosquitoSprite];
            
            self.countBonus = 10;
            self.countShots = 1;
            self.mosquitoType = Small;
        
        } else if (_type == Armored) {
        
            self.mosquitoSprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
            self.mosquitoSprite.position = _pos;
            self.mosquitoSprite.scale = 0.1f;
            [layer addChild:self.mosquitoSprite];
            
            self.countBonus = 20;
            self.countShots = 2;
            self.mosquitoType = Armored;
            
        }
        
        // Create animation for mosquito's fly
        id anim = [CCScaleTo actionWithDuration:5.0f scale:2.0];
        id actionCallBackFunc = [CCCallFunc actionWithTarget:self selector:@selector(suction)];
        id seqAnims = [CCSequence actions:[[anim copy] autorelease],[[actionCallBackFunc copy] autorelease], nil];
        self.mosquitoSprite.orderOfArrival = 100;
        [self.mosquitoSprite  runAction:seqAnims];
    
    
    }
    return self;
}

- (void)freeze{
    [self.mosquitoSprite pauseSchedulerAndActions];
}

- (void)unFreeze{
    [self.mosquitoSprite resumeSchedulerAndActions];
}

// mosquito fly away after sting
- (void)flyAway{
    id anim = [CCFadeTo actionWithDuration:2.0f opacity:0.0f];
    id actionCallBackFunc = [CCCallFunc actionWithTarget:self selector:@selector(clearFromLayer)];
    id seqAnims = [CCSequence actions:[[anim copy] autorelease],[[actionCallBackFunc copy] autorelease], nil];
    [self.mosquitoSprite  runAction:seqAnims];
}

- (void)clearFromLayer{
    [self.mosquitoSprite removeFromParentAndCleanup:YES];

}
- (void)killYourSelfWithAnimation{
    id anim = [CCFadeTo actionWithDuration:2.0f opacity:0.0f];
    id actionCallBackFunc = [CCCallFunc actionWithTarget:self selector:@selector(clearFromLayer)];
    id seqAnims = [CCSequence actions:[[anim copy] autorelease],[[actionCallBackFunc copy] autorelease], nil];
    [self.mosquitoSprite  runAction:seqAnims];
}

// Mosquito's sting
- (void)suction{

    [delegate doSuctionWithMosquito:self];
}

@end
