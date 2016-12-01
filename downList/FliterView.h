//
//  FliterView.h
//  downList
//
//  Created by zhangchu on 16/12/1.
//  Copyright © 2016年 eyrh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FlicterCategory) {
    FlicterCategory0 = 0,
    FlicterCategory1,
    FlicterCategory2
};

@protocol FliterViewDelegate;

@interface FliterView : UIView

@property(nonatomic, weak) id<FliterViewDelegate> delegate;

- (instancetype)initWithData:(NSDictionary *)data frame:(CGRect)frame;
@end

@protocol FliterViewDelegate <NSObject>

- (void)FliterView:(FliterView *)self selectedCategory:(FlicterCategory)category Index:(NSInteger)index;

@end