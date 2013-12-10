//
//  EnemyManager.m
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright (c) 2013年 only. All rights reserved.
//

#import "EnemyManager.h"

@implementation EnemyManager

@synthesize batch;

-(id) init
{
    if(self = [super init])
    {
        //对enemys初始化
        batch = [CCSpriteBatchNode batchNodeWithFile:@"monster.png"];
        nextInactiveEnemy = 0;
        
        for(int i = 0;i < 100; i++)
        {
            Enemy* enemy = [Enemy enemy];
            enemy.visible = NO;
            [batch addChild:enemy];
        }
        
    }
    return self;
}

-(void)attackBySpeed:(float)speed
{
    //获取敌人池的敌人
    CCArray* enemies = [batch children];
    CCNode* node = [enemies objectAtIndex:nextInactiveEnemy];
    NSAssert([node isKindOfClass:[Enemy class]], @"not a Enemy!");
    Enemy* enemy = (Enemy*)node;
    
    enemy.visible = YES;
    
    [enemy attackBySpeed:speed];
    
    nextInactiveEnemy++;
    
    if(nextInactiveEnemy >= 100)
    {
        nextInactiveEnemy = 0;
    }
    
}

@end
