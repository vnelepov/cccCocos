//
//  LevelRoot.h
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

/* Order sprites
    z=0 - backgroud
    z betwen 1 and 999999 - mosquitoes (tag = 999999)
    z=1000000 - gun
*/

#import <CoreLocation/CoreLocation.h>
#import "cocos2d.h"
#import "MenuViewController.h"
#import "GameObjects.h"



@interface LevelRoot : CCLayer <MosquitoLifeDelegate, CLLocationManagerDelegate> {
    
    NSMutableArray *arrayMosquitoes;

}

@property (retain, nonatomic) MenuViewController *menuBar;
@property (retain, nonatomic) Weapon *weapon;
@property (retain, nonatomic) CLLocationManager *locationManager;

- (void)back; //return to main menu
- (void)startGame; 
- (void)gameLoop;

- (void)createMosquito;
- (void)freezeMosquitoes;
- (void)unFreezeMosquitoes;

- (void)createWeapon;
@end
