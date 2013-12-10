//
//  GameOver.h
//  LetMeShootIt
//
//  Created by user on 13-12-10.
//  Copyright 2013年 only. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameScene.h"

@interface GameOver : CCNode {
    
    GameScene* gameScene;
    
}

-(void) letPlayerDied;

@end
