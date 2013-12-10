//
//  Enemy.m
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright 2013年 only. All rights reserved.
//

#import "Enemy.h"
#import "CheckBump.h"

@implementation Enemy

+(Enemy*)enemy
{
    return [[[self alloc] initWithFile] autorelease];
}

-(id) initWithFile
{
    if(self = [super initWithFile:@"monster.png"])
    {
        size = [self contentSize];
        
    }
    return self;
}

-(void) attackBySpeed:(float)speed_in
{
    //对敌人的运动速度进行初始化
    speed = speed_in;
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    size = [self contentSize];
    
    //设置敌人的初始位置
    int pos_y = CCRANDOM_0_1() * (winSize.height - size.height) + size.height/2;
    int pos_x = winSize.width + size.width/2;
    CGPoint pos = CGPointMake(pos_x, pos_y);
    self.position = pos;
    
    //开启运动更新
    [self scheduleUpdate];
}

-(void) update:(ccTime)delta
{
    //更新位置
    CGPoint point = CGPointMake(self.position.x - speed, self.position.y);
    self.position = point;
    
    //判断是否碰撞
    CheckBump* checkBump = [[CheckBump alloc] init];
    if([checkBump isBump:self])
    {
        self.visible = NO;
        [self unscheduleUpdate];
    }
    
    //判断位置是否超出边界
    if(self.position.x < -(size.width*0.5f))
    {
        self.visible = NO;
        [self unscheduleUpdate];
    }
}

@end
