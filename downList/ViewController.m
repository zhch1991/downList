//
//  ViewController.m
//  downList
//
//  Created by zhangchu on 16/12/1.
//  Copyright © 2016年 eyrh. All rights reserved.
//

#import "ViewController.h"
#import "BaseTableView.h"
#import "FliterView.h"

@interface ViewController ()
<
FliterViewDelegate
>
@property (nonatomic, copy) NSArray *dataArray1;
@property (nonatomic, copy) NSArray *dataArray20;
@property (nonatomic, copy) NSArray *dataArray21;
@property (nonatomic, copy) NSArray *dataArray22;
@property (nonatomic, copy) NSArray *dataArray3;
@property (nonatomic, strong) FliterView *flicterView;

@end

@implementation ViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self initData];
}

#pragma mark - private methods
- (void)initUI
{
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blackColor];
    btn.frame = CGRectMake(100, 200, 100, 50);
    [btn addTarget:self action:@selector(btnCkicked1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [self flicterView];
}

- (void)initData
{
    [self dataArray1];
    [self dataArray20];
    [self dataArray21];
    [self dataArray22];
    [self dataArray3];
}

#pragma mark -eventResponse
- (void)btnCkicked1:(UIButton *)btn
{
    NSLog(@"back btn clicked");
}

- (void)FliterView:(FliterView *)self selectedCategory:(FlicterCategory)category Index:(NSInteger)index
{
    NSLog(@"clicked in : %ld, %ld", category, index);
}

#pragma mark - getter/setter
- (NSArray *)dataArray1
{
    if(!_dataArray1)
    {
        _dataArray1 = @[@"10", @"11", @"12"];
    }
    return _dataArray1;
}

- (NSArray *)dataArray20
{
    if(!_dataArray20)
    {
        _dataArray20 = @[@"200", @"201", @"202", @"203"];
    }
    return _dataArray20;
}


- (NSArray *)dataArray21
{
    if(!_dataArray21)
    {
        _dataArray21 = @[@"210", @"211", @"212", @"213"];
    }
    return _dataArray21;
}

- (NSArray *)dataArray22
{
    if(!_dataArray22)
    {
        _dataArray22 = @[@"220", @"221", @"222", @"223"];
    }
    return _dataArray22;
}

- (NSArray *)dataArray3
{
    if(!_dataArray3)
    {
        _dataArray3 = @[@"30", @"31", @"32", @"33", @"34", @"35", @"36", @"37", ];
    }
    return _dataArray3;
}

- (FliterView *)flicterView
{
    if(!_flicterView)
    {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:self.dataArray1 forKey:@"array1"];
        [dict setObject:self.dataArray20 forKey:@"array20"];
        [dict setObject:self.dataArray21 forKey:@"array21"];
        [dict setObject:self.dataArray22 forKey:@"array22"];
        [dict setObject:self.dataArray3 forKey:@"array3"];
        _flicterView = [[FliterView alloc] initWithData:dict frame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
        _flicterView.delegate = self;
        [self.view addSubview:_flicterView];
    }
    return _flicterView;
}
@end
