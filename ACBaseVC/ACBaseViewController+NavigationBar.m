//
//  ACBaseViewController+NavigationBar.m
//  ACLease
//
//  Created by west3214 on 2019/12/3.
//  Copyright © 2019 west3214. All rights reserved.
//

#import "ACBaseViewController+NavigationBar.h"

#import <UIKit/UIKit.h>


@implementation ACBaseViewController (NavigationBar)
-(void)setUpCustomNavigationBar{
    self.navigationController.navigationBarHidden = YES;
    self.currentNavigationBar = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:LL_ColorWithHexStr(@"FFFFFF")];
    [self.view addSubview:self.currentNavigationBar];
    [self.currentNavigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(ll_MaxNavigationHeight);
    }];

    CustomButton *currentBackBtn = [CustomButton ll_buttonWithFrame:CGRectZero Title:nil Font:nil TextColot:nil BackGroundImageNor:LL_ImageNamed(@"AC_LeftBlack_Arrow") BackGroundImageSel:LL_ImageNamed(@"AC_LeftBlack_Arrow") ActionSel:@selector(currentBackBtnAction) target:self];
    [self.currentNavigationBar addSubview:currentBackBtn];
    [currentBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(ll_WidthFromIphone6(40), ll_WidthFromIphone6(30)));
        make.bottom.mas_equalTo(ll_WidthFromIphone6(-9.5));
    }];
    [currentBackBtn.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ll_WidthFromIphone6(7), ll_WidthFromIphone6(13)));
        make.left.mas_equalTo(ll_WidthFromIphone6(17));
        make.centerY.equalTo(currentBackBtn);
    }];
    self.currentBackBtn = currentBackBtn;
    if (self.navigationController.viewControllers.count < 2) {
        currentBackBtn.hidden = YES;
    }else{
        currentBackBtn.hidden = NO;
    }
    
    
    UILabel *currentTitleL = [UILabel ll_LabelWithFrame:CGRectZero Text:nil Font:LL_FontFromiPhone6ByeSizeAndWeight(19, UIFontWeightBold) TextColor:LL_ColorWithHexStr(@"000000") TextAlignment:1 BackGroundColor:nil];
    [self.currentNavigationBar addSubview:currentTitleL];
    [currentTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.currentNavigationBar);
        make.height.mas_greaterThanOrEqualTo(ll_NavigationBarHeight);
        make.left.equalTo(self.currentBackBtn.mas_right).mas_offset(ll_WidthFromIphone6(2)).priorityHigh();
        make.top.mas_equalTo(ll_StatusBarHeihgt);
    }];
    self.currentTitleL = currentTitleL;
 
    
    
    self.currentContentV = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:LL_ColorWithHexStr(@"FFFFFF")];
    [self.view addSubview:self.currentContentV];
    [self.currentContentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(self.currentNavigationBar.mas_bottom);
    }];
    self.currentNavigationBarBottomLine = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:LL_ColorWithHexStr(@"eeeeee")];
    [self.currentNavigationBar addSubview:self.currentNavigationBarBottomLine];
    [self.currentNavigationBarBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(ll_WidthFromIphone6(0.7));
    }];
    
    [self.view bringSubviewToFront:self.currentNavigationBar];
}







@end
