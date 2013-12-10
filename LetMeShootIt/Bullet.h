//
//  Bullet.h
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright 2013年 only. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Player.h"



@interface Bullet : CCSprite{
    
    CGPoint velocity;
    int shootGap;
    int width;
}

@property (readonly)int shootGap;

+(id) bullet;

-(void) shootBulletFrom:(CCSprite*)player toPosition:(CGPoint)position;

-(void) hit;

@end
