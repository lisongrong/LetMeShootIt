//
//  EnemyManager.h
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright (c) 2013年 only. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Enemy.h"

@interface EnemyManager : NSObject
{
    CCSpriteBatchNode* batch;
    int nextInactiveEnemy;
}

@property (readonly) CCSpriteBatchNode* batch;

-(void)attackBySpeed:(float)speed;

@end
