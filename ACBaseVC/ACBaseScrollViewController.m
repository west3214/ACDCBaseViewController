//
//  BaseScrollViewController.m
//  JTProject
//
//  Created by 张西方 on 2018/11/22.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "ACBaseScrollViewController.h"

@interface ACBaseScrollViewController ()

@end

@implementation ACBaseScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scrollView= [[UIScrollView alloc] initWithFrame:CGRectZero];
    [self.currentContentV addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(0);
    }];
    self.scrollView = scrollView;
    
    
    UIView *contentView = [[UIView alloc] init];
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
        make.height.mas_greaterThanOrEqualTo(0);
        make.width.equalTo(scrollView);
    }];
    self.contentView = contentView;
    self.contentView.backgroundColor = LL_ColorWithHexStr(@"FFFFFF");
    
    
    if (@available(iOS 11.0, *)) {
        [self.scrollView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
