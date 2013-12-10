//
//  Bullet.m
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright 2013年 only. All rights reserved.
//

#import "Bullet.h"
#import "player.h"


@implementation Bullet

@synthesize shootGap;


+(id) bullet
{
    return [[[self alloc] initWithFile] autorelease];
}

-(id) initWithFile
{
    if(self = [super initWithFile:@"projectile.png"]);
    {
        //对屏幕大小初始化
        width = [CCDirector sharedDirector].winSize.width;
        //对射击间隔初始化
        shootGap = 2;
    }
    return self;
}

-(void) shootBulletFrom:(CCSprite*)player toPosition:(CGPoint)position
{
    //对位置初始化
    CGPoint pos = player.position;
    CGSize size = [player contentSize];
    self.position = CGPointMake( pos.x + size.width*0.5, pos.y);
    //对速度初始化
    float x = position.x - player.position.x;
    float y = position.y - player.position.y;
    float temp = sqrtf((x * x) + (y * y));
    velocity = CGPointMake((x * 3)/temp, (y * 3)/temp);
    
    [self scheduleUpdate];
}

-(void) hit
{
    self.visible = NO;
    [self unscheduleUpdate];
}

-(void) update:(ccTime)delta
{
    CGPoint pos = self.position;
    pos.x += velocity.x;
    pos.y += velocity.y;
    self.position = pos;
    
    if(velocity.x > (width + [self contentSize].width))
    {
        //超出边界  回收子弹
        self.visible = NO;
        [self unscheduleUpdate];
    }
}

@end
