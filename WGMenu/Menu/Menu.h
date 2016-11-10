//
//  Menu.h
//  WGMenu
//
//  Created by Alex William on 2016/11/10.
//  Copyright © 2016年 William. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MenuState) {

    kMenuStateDismiss = 0,    // 消失
    kMenuStateShow,           // 显示
};

@interface Menu : UIView

/**内容View*/
@property (nonatomic, weak) UIView *contentView;

/**内容视图*/
@property (nonatomic, strong) UIViewController *ContentViewController;

/**内容View偏移的位置*/
@property (nonatomic, assign) CGPoint contentOrigin;

/**锚点*/
@property (nonatomic, assign) CGPoint anchorPoint;

/**菜单的背景气泡*/
@property (nonatomic, copy) NSString *backgroundImage;

/**菜单的状态*/
@property (nonatomic, assign) MenuState state;

/**隐藏menu*/
- (void)hideMenu;

/**从View下面显示菜单*/
- (void)showMenuFromView:(UIView *)view;

/**从某个点显示菜单*/
- (void)showMenuFromPoint:(CGPoint)point;

@end
