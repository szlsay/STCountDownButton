//
//  ViewController.m
//  STCountDownButton
//
//  Created by https://github.com/STShenZhaoliang/STCountDownButton on 16/2/14.
//  Copyright © 2016年 https://github.com/STShenZhaoliang/STCountDownButton. All rights reserved.
//

#import "ViewController.h"
#import "STCountDownButton.h"
@interface ViewController ()
@property (nonatomic, strong, nullable)STCountDownButton *countDownCode; //
@property (nonatomic, strong, nullable)UIButton *buttonStop; //
@end

@implementation ViewController

#pragma mark - --- lift cycle 生命周期 ---

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.countDownCode];
    
    [self.view addSubview:self.buttonStop];
}
#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---

- (void)startCountDown:(STCountDownButton *)button {
    [button start];
}

- (void)stopCountDown
{
    [self.countDownCode stop];
}
#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- getters and setters 属性 ---
- (STCountDownButton *)countDownCode
{
    if (!_countDownCode) {
        _countDownCode = [[STCountDownButton alloc]initWithFrame:CGRectMake(80, 200, 150, 44)];
        _countDownCode.backgroundColor = [UIColor blueColor];
        [_countDownCode setSecond:5];
        [_countDownCode addTarget:self
                           action:@selector(startCountDown:)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    return _countDownCode;
}

- (UIButton *)buttonStop
{
    if (!_buttonStop) {
        _buttonStop = [[UIButton alloc]initWithFrame:CGRectMake(80, 300, 150, 44)];
        _buttonStop.backgroundColor = [UIColor blueColor];
        [_buttonStop setTitle:@"Stop" forState:UIControlStateNormal];
        [_buttonStop addTarget:self action:@selector(stopCountDown) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonStop;
}
@end
