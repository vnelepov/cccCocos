//
//  Mosquito.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 23.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Mosquito.h"


@implementation Mosquito

@synthesize mosquitoSprite;
@synthesize delegate;


- (void) dealloc{
   
    [mosquitoSprite release];
    [super dealloc];
}


- (id)initWithType:(MOSQUITOTYPE) _type andPosition:(CGPoint) _pos aboveLayer:(CCLayer *) layer{
    if (self = [super init]) {
        self.mosquitoSprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
        self.mosquitoSprite.position = _pos;
        [layer addChild:self.mosquitoSprite];
        
        id anim = [CCScaleTo actionWithDuration:2.0f scale:2.0];
        id actionCallBackFunc = [CCCallFunc actionWithTarget:self selector:@selector(suction)];
        id seqAnims = [CCSequence actions:[[anim copy] autorelease],[[actionCallBackFunc copy] autorelease], nil];
        
        [self.mosquitoSprite  runAction:seqAnims];
    }
    return self;
}

- (void)suction{

    [delegate doSuctionWithMosquito:self];
}

@end
