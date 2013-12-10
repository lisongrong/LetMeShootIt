//
//  PlayerManager.m
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright (c) 2013年 only. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

@synthesize player;

-(id) init
{
    if(self = [super init]){
        
        //对player初始化
        player = [[Player alloc] init];
        
    }
    return self;
}

@end
