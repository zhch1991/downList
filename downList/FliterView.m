//
//  FliterView.m
//  downList
//
//  Created by zhangchu on 16/12/1.
//  Copyright © 2016年 eyrh. All rights reserved.
//

#import "FliterView.h"
#import "BaseTableView.h"

@interface FliterView()
<
BaseTableViewDelegare
>
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) BaseTableView *tableView1;
@property (nonatomic, strong) BaseTableView *tableView2;
@property (nonatomic, strong) BaseTableView *tableView3;
@property (nonatomic, strong) NSMutableArray *buttonArray;

@end

@implementation FliterView

- (instancetype)initWithData:(NSDictionary *)data frame:(CGRect)frame
{
    if(self = [super init])
    {
        _data = data;
        self.frame = frame;
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    CGFloat X = 1;
    CGFloat Y = 0;
    CGFloat W = self.frame.size.width/3 - 2;
    CGFloat H = 44;
    
    for(int i = 0 ; i < 3; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(X, Y, W, H);
        btn.tag = i;
        btn.selected = NO;
        btn.backgroundColor = [UIColor greenColor];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.buttonArray addObject:btn];
        X += (W + 2);
    }
    [self addSubview:self.tableView1];
    [self addSubview:self.tableView2];
    [self addSubview:self.tableView3];
}

- (void)btnClicked:(UIButton *)btn
{
    //反选其他所有button
    for (UIButton *button in self.buttonArray)
    {
        if(button != btn)
        {
            button.selected = NO;
        }
    }
    
    
    //计算当前需要展示的高度
    btn.selected = !btn.selected;
    CGFloat height = 0;
    if(btn.selected)
    {
        height = 400;
    }
    else
    {
        height = 0;
    }
    
    
    //对当前button进行事件处理
    switch (btn.tag) {
        case 0:
        {
            self.tableView1.hidden = NO;
            self.tableView2.hidden = NO;
            self.tableView3.hidden = YES;
            [UIView animateWithDuration:0.5 animations:^{
                self.tableView1.frame = CGRectMake(0, 44, self.frame.size.width/2, height);
                self.tableView2.frame = CGRectMake(self.frame.size.width/2, 44, self.frame.size.width/2, height);
                self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height + 44);
            } completion:^(BOOL finished) {
                
            }];
            break;
        }
        case 1:
        {
            self.tableView1.hidden = YES;
            self.tableView2.hidden = YES;
            self.tableView3.hidden = NO;
            [UIView animateWithDuration:0.5 animations:^{
                self.tableView3.frame = CGRectMake(0, 44, self.frame.size.width, height);
                self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height + 44);
            } completion:^(BOOL finished) {
                
            }];

            break;
        }
        case 2:
        {
            break;
        }
        default:
            break;
    }
}

-(void)baseTableView:(BaseTableView *)tableView didSelectedIndex:(NSInteger)idx
{
    if(tableView == _tableView1)
    {
        switch (idx) {
            case 0:
                [self.tableView2 refreshTableViewWithArray:_data[@"array20"]];
                break;
            case 1:
                [self.tableView2 refreshTableViewWithArray:_data[@"array21"]];
                break;
            case 2:
                [self.tableView2 refreshTableViewWithArray:_data[@"array22"]];
                break;
            default:
                break;
        }
        if([self.delegate respondsToSelector:@selector(FliterView:selectedCategory:Index:)])
        {
            [self.delegate FliterView:self selectedCategory:FlicterCategory0 Index:idx];
        }
    }
    else if(tableView == _tableView2)
    {
        if([self.delegate respondsToSelector:@selector(FliterView:selectedCategory:Index:)])
        {
            [self.delegate FliterView:self selectedCategory:FlicterCategory1 Index:idx];
        }
    }
    else if(tableView == _tableView3)
    {
        if([self.delegate respondsToSelector:@selector(FliterView:selectedCategory:Index:)])
        {
            [self.delegate FliterView:self selectedCategory:FlicterCategory2 Index:idx];
        }
    }
}

-(BaseTableView *)tableView1
{
    if(!_tableView1)
    {
        _tableView1 = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 44, self.frame.size.width/2, 0) data:_data[@"array1"]];
        _tableView1.delegate1 = self;
        [_tableView1 reloadData];
    }
    return _tableView1;
}

-(BaseTableView *)tableView2
{
    if(!_tableView2)
    {
        _tableView2 = [[BaseTableView alloc] initWithFrame:CGRectMake(self.frame.size.width/2, 44, self.frame.size.width/2, 0) data:_data[@"array20"]];
        _tableView2.delegate1 = self;
        [_tableView2 reloadData];
    }
    return _tableView2;
}

-(BaseTableView *)tableView3
{
    if(!_tableView3)
    {
        _tableView3 = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 44, self.frame.size.width, 0) data:_data[@"array3"]];
        _tableView3.delegate1 = self;
        [_tableView3 reloadData];
    }
    return _tableView3;
}

-(NSMutableArray *)buttonArray
{
    if(!_buttonArray)
    {
        _buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}
@end
