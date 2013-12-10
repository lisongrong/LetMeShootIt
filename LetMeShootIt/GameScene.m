//
//  GameScene.m
//  LetMeShootIt
//
//  Created by user on 13-12-9.
//  Copyright 2013年 only. All rights reserved.
//


#import "GameScene.h"

@interface GameScene()
-(void) createPlayer;
-(void) createManagers;
@end


@implementation GameScene

//设置保存场景的静态变量
static GameScene* instanceOfGameScene = nil;
static int shootGap = 15;

@synthesize playerManager;
@synthesize bulletManager;
@synthesize time;

+(CCScene*) scene
{
    CCScene* scene = [CCScene node];
    GameScene* layer = [GameScene node];
    [scene addChild:layer];
    return scene;
}

+(GameScene*) sharedGameScene
{
    NSAssert(instanceOfGameScene != nil, @"instance not yet initialized!");
    return instanceOfGameScene;
}

-(id) init
{
    if(self = [super initWithColor:ccc4(133, 133, 133, 133)]){
        
        
        //对静态变量初始化
        instanceOfGameScene = self;
        
        //对屏幕的大小初始化
        winSize = [CCDirector sharedDirector].winSize;
        rect = CGRectMake(0, 0, winSize.width, winSize.height);
        [self createPlayer];
        [self createManagers];
        
        //初始化子弹的蓄能时间
        shootTime = 0;
        //初始化怪物的攻击间隔时间
        attackTime = 3;
        //初始化游戏的总时间
        time = 0;
        //初始化怪物的移动速度
        speed = 0.5;
        
        //打开触摸控制
        self.isTouchEnabled = YES;
        
        //设置更新方法
        [self scheduleUpdate];
        [self schedule:@selector(attackUpdata:) interval:attackTime];
        
    }
    return self;
}

-(void) createPlayer
{
    //将初始元素添加进场景
    //添加玩家
    playerManager = [[PlayerManager alloc] init];
    CCSprite* player = [[playerManager player] player];
    [self addChild:player];
    CGSize playerSize = [player contentSize];
    CGPoint position = CGPointMake(playerSize.width, winSize.height/2);
    player.position = position;
}

-(void) createManagers
{
    //添加子弹池
    bulletManager = [[BulletManager alloc] init];
    CCSpriteBatchNode* bullets = [bulletManager batch];
    [self addChild:bullets];
    
    //添加敌人池
    enemyManager = [[EnemyManager alloc] init];
    CCSpriteBatchNode* enemys = [enemyManager batch];
    [self addChild:enemys];

}

-(void) attackUpdata:(ccTime)delta
{
    [enemyManager attackBySpeed:speed];
}

-(void) update:(ccTime)delta
{
    shootTime++;
    time++;
    if(time % 500 == 0){
        if(speed < 2)
        {
            speed = speed + 0.1;
        }
        if(attackTime > 1)
        {
            [self unschedule:@selector(attackUpdata:)];
            attackTime = attackTime - 0.1;
            [self schedule:@selector(attackUpdata:) interval:attackTime];
        }
    }
}

//添加注册器
-(void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(void) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //获取触摸点的坐标
    CGPoint point = [touch locationInView:[touch view]];
    //变换坐标
    point = [[CCDirector sharedDirector] convertToGL:point];
    CCLOG(@"point x = %f, y = %f", point.x, point.y);
    //设置区域
    CGRect rect1 = CGRectMake(0, 0, rect.size.width / 2, rect.size.height);
    //如果触摸点在屏幕左边  移动player
    if(CGRectContainsPoint(rect1, point))
    {
        [[playerManager player] moveTo:point];
        //连续触摸时 移动会累加
    }
    else
    {
        if(shootTime > shootGap)
        {
            [bulletManager shootBulletFrom:[[playerManager player] player] to:point];
            shootTime = 0;
        }
    }
  //  CCLOG(@"2");
}

-(void) ccTouchMoved:(UITouch*)touch withEvent:(UIEvent *)event
{
}


-(void) dealloc{
    [super dealloc];
}

@end
