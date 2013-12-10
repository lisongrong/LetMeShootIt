//
//  GameScene.h
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright 2013年 only. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "GameScene.h"
#import "PlayerManager.h"
#import "EnemyManager.h"
#import "BulletManager.h"

@interface GameScene : CCLayerColor {
    
    PlayerManager* playerManager;
    EnemyManager* enemyManager;
    BulletManager* bulletManager;
    CGRect rect;
    int shootTime;
    int attackTime;
    int time;
    float speed;
    CGSize winSize;
}

@property(readonly)PlayerManager* playerManager;

@property(readonly)BulletManager* bulletManager;

@property(readonly)int time;

+(CCScene*) scene;

+(GameScene*) sharedGameScene;



@end
