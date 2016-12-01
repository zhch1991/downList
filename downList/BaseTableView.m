//
//  BaseTableView.m
//  downList
//
//  Created by zhangchu on 16/12/1.
//  Copyright © 2016年 eyrh. All rights reserved.
//

#import "BaseTableView.h"

@interface BaseTableView()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation BaseTableView

- (id)initWithFrame:(CGRect)frame data:(NSArray *)dataArray
{
    if(self = [super init])
    {
        self.frame = frame;
        self.delegate = self;
        self.dataSource = self;
        _dataArray = dataArray;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate1 respondsToSelector:@selector(baseTableView:didSelectedIndex:)])
    {
        [self. delegate1 baseTableView:self didSelectedIndex:indexPath.row];
    }
}

- (void)refreshTableViewWithArray:(NSArray *)data
{
    _dataArray = data;
    [self reloadData];
}

@end
