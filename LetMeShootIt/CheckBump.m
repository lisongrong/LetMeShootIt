//
//  CheckBump.m
//  LetMeShootIt
//
//  Created by user on 13-12-10.
//  Copyright 2013年 only. All rights reserved.
//

#import "CheckBump.h"
#import "GameOver.h"

@implementation CheckBump

-(id)init
{
    if(self = [super init])
    {
        playerManager = [[GameScene sharedGameScene] playerManager];
        bulletManager = [[GameScene sharedGameScene] bulletManager];
    }
    return self;
}

-(BOOL)isBump:(CCSprite*)sprite
{
    //获取敌人区域
    CGRect rect_sprite = [self getRect:sprite];
    
    //获取玩家区域
    CCSprite* player = [[playerManager player] player];
    CGRect rect_player = [self getRect:player];
    
    if(CGRectIntersectsRect(rect_sprite, rect_player))
    {
        [[[GameOver alloc] init] letPlayerDied];
        return TRUE;
    }
    
    //获取子弹区域
    CCArray* bullets = [[bulletManager batch] children];
    for(int i = 0; i < 300; i++)
    {
        CCNode* node = [bullets objectAtIndex:i];
        NSAssert([node isKindOfClass:[Bullet class]], @"not a bullet!") ;
        Bullet* bullet = (Bullet*) node;
        
        if(bullet.visible)
        {
            //获取子弹区域
            CGRect rect_bullet = [self getRect:bullet];
            if(CGRectIntersectsRect(rect_sprite, rect_bullet))
            {
                //子弹消失
                [bullet hit];
                return TRUE;
            }
        }
    }
    
    return FALSE;
}

-(CGRect)getRect:(CCSprite*)sprite
{
    CGPoint pos = sprite.position;
    CGSize size = [sprite contentSize];
    float winY = [CCDirector sharedDirector].winSize.height;
    //CGRectMake的参照点是左上角!
    CGRect spriteRect = CGRectMake( pos.x - size.width / 2, (winY - pos.y) - size.height / 2 , size.width * 0.8f, size.height * 0.8f);
    
 //   CGRect spriteRect = CGRectMake( pos.x - size.width/2, pos.y - size.height/2 , pos.x + size.width/2, pos.y + size.height/2);
    
    return spriteRect;
}

@end
