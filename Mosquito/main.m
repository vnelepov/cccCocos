//
//  main.m
//  Mosquito
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright RusWizards LLC 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"AppController");
    [pool release];
    return retVal;
}
