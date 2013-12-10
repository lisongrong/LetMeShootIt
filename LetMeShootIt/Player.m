//
//  Player.m
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright 2013年 only. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize player;

-(id) init
{
    if( self = [super init]){
        //初始化palyer精灵
        player = [CCSprite spriteWithFile:@"player.png"];
        
    }
    return self;
}

-(void) moveTo:(CGPoint)position
{
    [player stopAllActions];
    float speed = 200.0f;
//    int x,y;
    
    /*
    if(self.position.x > position.x)
    {
        x = self.position.x - position.x;
    }
    else
    {
        x = position.x - self.position.x;
    }
    
    if(self.position.y > position.y)
    {
        y = self.position.y - position.y;
    }
    else
    {
        y = position.y - self.position.y;
    }
    */
    
  //  float distance = sqrtf(x * x + y * y);
    float distance = ccpDistance([self position], position);
    float duration = distance / speed;
    CCLOG(@"point x = %f, y = %f", position.x, position.y);
    CGPoint position
    CCLOG(@"point2 x = %f, y = %f", [self position].x, [self position].y);
    CCLOG(@"disntance = %f", distance);
    CCLOG(@"duration = %f", duration);
    CCMoveTo *move = [CCMoveTo actionWithDuration:duration position:position];
    [player runAction:move];
}

@end
