//
//  Enemy.h
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright 2013年 only. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Enemy : CCSprite {
    
    CGSize size;
    float speed;
}

-(void) attackBySpeed:(float)speed;

+(Enemy*) enemy;

@end
