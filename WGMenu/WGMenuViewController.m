//
//  WGMenuViewController.m
//  WGMenu
//
//  Created by Alex William on 2016/11/10.
//  Copyright © 2016年 William. All rights reserved.
//

#import "WGMenuViewController.h"

@interface WGMenuViewController ()

@property (nonatomic, strong) NSMutableArray *menuListArray;
@end

@implementation WGMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    [self initCurrentTableViewCotroller];
}

#pragma mark - init
- (void)initCurrentTableViewCotroller {

    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *const CELLID = @"CELLID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"menu_recharge"];
            break;
        case 1:
             cell.imageView.image = [UIImage imageNamed:@"menu_personalCenter"];
            break;
        case 2:
              cell.imageView.image = [UIImage imageNamed:@"menu_calculate"];
            break;
        default:
            break;
    }
    
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    selectedBackgroundView.backgroundColor = [UIColor colorWithRed:181/255.0 green:128/255.0 blue:67/255.0 alpha:1];
    
    cell.selectedBackgroundView = selectedBackgroundView;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.menuListArray[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - UITableViewDataDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(wgMenuController:didSelectRowAtIndex:)]) {
        
        [_delegate wgMenuController:self didSelectRowAtIndex:indexPath.row];
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)menuListArray
{

    if (!_menuListArray) {
        
        _menuListArray = [NSMutableArray arrayWithObjects:@"充值金币", @"余额宝", @"个人中心", nil];
    }

    return _menuListArray;
}

@end
