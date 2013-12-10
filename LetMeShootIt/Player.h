//
//  Player.h
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright 2013年 only. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Player : CCNode {
    
    CCSprite* player;
    
}

@property (readonly) CCSprite* player;

-(id) init;

-(void) moveTo:(CGPoint)position;

@end
