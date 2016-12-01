//
//  BaseTableView.h
//  downList
//
//  Created by zhangchu on 16/12/1.
//  Copyright © 2016年 eyrh. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BaseTableViewDelegare;

@interface BaseTableView : UITableView

@property (nonatomic, weak) id<BaseTableViewDelegare> delegate1;
- (id)initWithFrame:(CGRect)frame data:(NSArray *)dataArray;
- (void)refreshTableViewWithArray:(NSArray *)data;

@end

@protocol BaseTableViewDelegare <NSObject>

-(void)baseTableView:(BaseTableView *)tableView didSelectedIndex:(NSInteger)idx;

@end