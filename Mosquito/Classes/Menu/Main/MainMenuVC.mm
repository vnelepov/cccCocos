//
//  MainMenuVC.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainMenuVC.h"
#import "Levels.h"

@implementation MainMenuVC


- (IBAction)startLevel:(id)sender {

    UIButton *button = (UIButton*) sender;
    
    CCScene *scene = [CCScene node];
    switch (button.tag)
    {
		case 1: {
            [scene addChild: [Level1 node]];
            break;
        }
    }
    
    if (button.tag == 1) 
    {
        [[CCDirector sharedDirector] replaceScene:scene];
    }

}
@end
