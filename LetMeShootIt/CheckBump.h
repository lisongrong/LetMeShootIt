//
//  CheckBump.h
//  LetMeShootIt
//
//  Created by user on 13-12-10.
//  Copyright 2013年 only. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PlayerManager.h"
#import "BulletManager.h"
#import "GameScene.h"

@interface CheckBump : CCNode {
    
    PlayerManager* playerManager;
    BulletManager* bulletManager;
}

-(BOOL)isBump:(CCSprite*)sprite;

@end
