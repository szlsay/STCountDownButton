//
//  STCountDownButton.m
//  STCountDownButton
//
//  Created by https://github.com/STShenZhaoliang/STCountDownButton on 16/2/14.
//  Copyright © 2016年 https://github.com/STShenZhaoliang/STCountDownButton. All rights reserved.
//

#import "STCountDownButton.h"
#import "STCountDownConst.h"
@interface STCountDownButton()
@property (nonatomic, assign)NSInteger totalSecond; 
@property (nonatomic, strong, nullable)NSTimer *timer;
@end

@implementation STCountDownButton

#pragma mark - --- init 视图初始化 ---

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitle:STCountDownConstStartText forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---

-(void)timerCountDown:(NSTimer *)theTimer {
    self.totalSecond--;
    
    if (self.totalSecond < 0) {
        [self stop];
    } else {
        NSString *title = [NSString stringWithFormat:@"剩余%ld秒",(long)self.totalSecond+1];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateDisabled];
    }
}

#pragma mark - --- private methods 私有方法 ---
- (void)start
{
    [self setEnabled:NO];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stop{
    [self setEnabled:YES];
    self.totalSecond = self.second;
    
    if (self.timer) {
        if ([self.timer respondsToSelector:@selector(isValid)]) {
            if ([self.timer isValid]) {
                [self.timer invalidate];
                self.timer = nil;
            }
        }
    }
    
    [self setTitle:STCountDownConstEndText forState:UIControlStateNormal];
    [self setTitle:STCountDownConstEndText forState:UIControlStateDisabled];
}

#pragma mark - --- setters 属性 ---

- (void)setSecond:(NSInteger)second
{
    _second = second;
    _totalSecond = second;
}

#pragma mark - --- getters 属性 ---

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(timerCountDown:)
                                                userInfo:nil
                                                 repeats:YES];
    }
    return _timer;
}

@end


