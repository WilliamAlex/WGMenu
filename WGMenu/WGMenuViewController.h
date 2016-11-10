//
//  WGMenuViewController.h
//  WGMenu
//
//  Created by Alex William on 2016/11/10.
//  Copyright © 2016年 William. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WGMenuViewController;

@protocol WGMenuViewDelegate <NSObject>

@required
/**点击menu中对应行*/
- (void)wgMenuController:(WGMenuViewController *)menuVc didSelectRowAtIndex:(NSUInteger)index;

@end

@interface WGMenuViewController : UITableViewController

// 代理属性
@property (nonatomic, weak) id<WGMenuViewDelegate>delegate;
@end
