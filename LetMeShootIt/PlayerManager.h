//
//  PlayerManager.h
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright (c) 2013年 only. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerManager : NSObject
{
    Player* player;
}

@property (readonly)Player* player;

@end
