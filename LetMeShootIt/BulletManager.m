//
//  BulletManager.m
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright (c) 2013年 only. All rights reserved.
//

#import "BulletManager.h"
#import "Bullet.h"

@implementation BulletManager

@synthesize batch;

-(id) init
{
    if(self = [super init]){
        
        //对bullets初始化
        batch = [CCSpriteBatchNode batchNodeWithFile:@"projectile.png"];
        
        nextInactiveBullet = 0;
        for( int i = 0; i < 300; i++)
        {
            Bullet* bullet = [Bullet bullet];
            bullet.visible = NO;
            [batch addChild:bullet];
        }
        
    }
    return self;
}

-(void) shootBulletFrom:(CCSprite*)player to:(CGPoint) position
{
    //获取子弹池的子弹
    CCArray *bullets = [batch children];
    CCNode* node = [bullets objectAtIndex:nextInactiveBullet];
    NSAssert([node isKindOfClass:[Bullet class]], @"not a bullet!");
    Bullet* bullet = (Bullet*)node;
    
    bullet.visible = YES;
    
    [bullet shootBulletFrom:player toPosition:position];
    
    nextInactiveBullet++;
    if(nextInactiveBullet >= [bullets count])
    {
        nextInactiveBullet = 0;
    }
}

@end
