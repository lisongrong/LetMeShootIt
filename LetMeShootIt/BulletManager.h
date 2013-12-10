//
//  BulletManager.h
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright (c) 2013年 only. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Bullet.h"

@interface BulletManager : NSObject
{
    CCSpriteBatchNode* batch;
    int nextInactiveBullet;
}

@property (readonly)CCSpriteBatchNode* batch;

-(void) shootBulletFrom:(CCSprite*)player to:(CGPoint) position;

@end
