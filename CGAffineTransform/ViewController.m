//
//  ViewController.m
//  CGAffineTransform
//
//  Created by ChangQing Yang on 16/7/11.
//  Copyright © 2016年 ChangQing Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *shareLab;         //分享lab
@property (weak, nonatomic) IBOutlet UIImageView *rotateImge;   //旋转img
@property (weak, nonatomic) IBOutlet UIImageView *coolimag;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(ani) userInfo:nil repeats:YES];

    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
}

//弹来弹去的效果
- (void)ani
{
    [UIView animateWithDuration:2.0 animations:^{
        
        _coolimag.transform = CGAffineTransformMakeRotation(M_PI);
        _coolimag.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width - CGRectGetMaxX(_coolimag.frame) - 40 , 0);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2.0 animations:^{
            
            _coolimag.transform = CGAffineTransformMakeRotation(M_PI * 2);
            _coolimag.transform = CGAffineTransformMakeTranslation(0, 0);
            
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//移动
- (IBAction)shareBtnClick:(UIButton *)sender {
    UIButton *btn = sender;
    btn.selected = !btn.selected;
    
    [UIView animateWithDuration:0.4 animations:^{
        
        if (btn.selected) {
            //负数为向左向上
            _shareLab.transform = CGAffineTransformMakeTranslation(0, -42);
        }else{
            _shareLab.transform = CGAffineTransformMakeTranslation(0, 42);
        }
        
    } completion:^(BOOL finished) {
        
    }];
}

//大小的缩放，仿qq空间的点赞
- (IBAction)praiseIcon:(UIButton *)sender {
    
    UIButton *bt = sender;
    
    [UIView animateWithDuration:0.4 animations:^{
        
        //1.5和0，67，两个的缩放的积等于1才能回归原大小
        bt.transform = CGAffineTransformScale(bt.transform, 1.5, 1.5);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{

            bt.transform = CGAffineTransformScale(bt.transform, 0.67, 0.67);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];
}

//旋转
- (IBAction)rotateBtnClick:(UIButton *)sender {
    
    UIButton *btn = sender;
    btn.selected = !btn.selected;
    
    if (btn.selected) {
        [UIView animateWithDuration:0.5 animations:^{
            _rotateImge.transform = CGAffineTransformMakeRotation(M_PI);
        } completion:^(BOOL finished) {
   
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            _rotateImge.transform = CGAffineTransformMakeRotation(2 * M_PI);
        } completion:^(BOOL finished) {
            
        }];
    }
}

@end
