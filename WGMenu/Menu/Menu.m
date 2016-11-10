//
//  Menu.m
//  WGMenu
//
//  Created by Alex William on 2016/11/10.
//  Copyright © 2016年 William. All rights reserved.
//

#import "Menu.h"

static const NSTimeInterval kzoomAnimationDuration = 0.3;
@interface Menu()

@property (nonatomic, weak) UIImageView *containerView;
@end

@implementation Menu

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
    
        self.backgroundColor = [UIColor clearColor];
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.userInteractionEnabled = YES;
        containerView.image = [UIImage imageNamed:@"home_menubackground"];
        
        // 默认不显示(点击后动画显示:可设置transfrom)
        self.transform = CGAffineTransformMakeScale(0.00001, 0.00001);
        containerView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return self;
}

#pragma mark - 从View下面显示menu
- (void)showMenuFromView:(UIView *)view
{

    CGFloat wg_x = view.center.x;
    CGFloat wg_y = CGRectGetMaxY(view.frame);
    [self showMenuFromPoint:CGPointMake(wg_x, wg_y)];
}

#pragma mark - 从某个点显示
- (void)showMenuFromPoint:(CGPoint)point {

    // 首先判断是否已经显示了,如果显示了就直接返回
    if (_state == kMenuStateShow) return;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    // 动画显示
    [UIView animateWithDuration:kzoomAnimationDuration animations:^{
        
        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
    // 设置位置
    // frame.origin.x = position.x - anchorPoint.x * bounds.size.width；
    // frame.origin.y = position.y - anchorPoint.y * bounds.size.height；
    self.layer.position = CGPointMake(self.layer.anchorPoint.x * self.frame.size.width + point.x, self.layer.anchorPoint.y * self.frame.size.height + point.y);
    
    // 记录当前menu的状态
    _state = kMenuStateShow;
}

#pragma mark - 隐藏menu
- (void)hideMenu
{
    // 动画隐藏
    [UIView animateWithDuration:kzoomAnimationDuration animations:^{
        
        self.transform = CGAffineTransformMakeScale(0.00001, 0.00001);
    }];
    
    // 记录当前menu的状态
    _state = kMenuStateDismiss;
}

#pragma mark - 给menu传递内容
- (void)setContentView:(UIView *)contentView
{
    _contentView = contentView;
    contentView.frame = self.containerView.frame;
    [self.containerView addSubview:contentView];
}

#pragma mark - 给menu传递一个控制器
- (void)setContentViewController:(UIViewController *)ContentViewController
{
    _ContentViewController = ContentViewController;
    self.contentView = ContentViewController.view;
}

#pragma mark - 设置锚点
- (void)setAnchorPoint:(CGPoint)anchorPoint
{
    self.layer.anchorPoint = anchorPoint;
}

#pragma mark - 设置背景图片
- (void)setBackgroundImage:(NSString *)backgroundImage
{
    _backgroundImage = backgroundImage;
    self.containerView.image = [UIImage imageNamed:backgroundImage];
}

- (void)setContentOrigin:(CGPoint)contentOrigin
{
    _contentOrigin = contentOrigin;
    
    // 改变内容view的偏移
    CGRect frame = _contentView.frame;
    frame.origin = contentOrigin;
    _contentView.frame = frame;
}
@end























