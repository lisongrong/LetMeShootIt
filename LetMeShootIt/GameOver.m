//
//  GameOver.m
//  LetMeShootIt
//
//  Created by user on 13-12-10.
//  Copyright 2013年 only. All rights reserved.
//

#import "GameOver.h"


@implementation GameOver

-(id) init
{
    if(self = [super init])
    {
        gameScene = [GameScene sharedGameScene];
    }
    return self;
}

-(void) letPlayerDied
{
    //玩家死亡
    CCSprite* player = [[[gameScene playerManager] player] player];
    player.visible = NO;
    
    //弹出分数
    NSString* score = [NSString stringWithFormat:@"score:%i",[gameScene time]];
    CCLabelTTF* label = [CCLabelTTF labelWithString:score fontName:@"Marker Felt" fontSize:32];
    CGSize winSize = [CCDirector sharedDirector].winSize;
    label.position = CGPointMake(winSize.width / 2, winSize.height / 2);
    [gameScene addChild:label];
    
    
    //停止所有的动作
    [[CCDirector sharedDirector] pause];
}

@end
