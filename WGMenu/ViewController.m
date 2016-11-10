//
//  ViewController.m
//  WGMenu
//
//  Created by Alex William on 2016/11/10.
//  Copyright © 2016年 William. All rights reserved.
//

#import "ViewController.h"
#define WGScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<WGMenuViewDelegate>

@property (nonatomic, weak) Menu *menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [button setTintColor:[UIColor whiteColor]];
    [button addTarget:self action:@selector(buttonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

#pragma mark - buttonOnClicked
- (void)buttonOnClicked:(UIButton *)button {

    // 首先判断是否已经显示了,如果显示直接返回
    if (_menu.state == kMenuStateShow) return;
    
    WGMenuViewController *menVc = [[WGMenuViewController alloc] init];
    menVc.delegate = self;
    Menu *menu = [[Menu alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    menu.ContentViewController = menVc;
    menu.anchorPoint = CGPointMake(1, 0);
    menu.contentOrigin = CGPointMake(0, 8);
    [menu showMenuFromPoint:CGPointMake((WGScreenW - 170), 64)];
    self.menu = menu;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_menu hideMenu];
}

- (void)wgMenuController:(WGMenuViewController *)menuVc didSelectRowAtIndex:(NSUInteger)index
{

    NSLog(@"%s====%ld",__func__, index);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
