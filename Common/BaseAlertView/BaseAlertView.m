//
//  BaseAlertView.m
//  ACP3
//
//  Created by iMac on 2018/12/21.
//  Copyright © 2018 west3214. All rights reserved.
//

#import "BaseAlertView.h"


@interface BaseAlertView ()



@end


@implementation BaseAlertView


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.bounds]) {
        self.backgroundColor = LL_ColorWithHexStrA(@"000000", 0.4);
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
//        window.windowLevel = UIWindowLevelAlert;
        self.frame = window.bounds;
        [window addSubview:self];
        UIView *contentV = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:LL_ColorWithHexStrA(@"ffffff", 0)];
        [self addSubview:contentV];
        [contentV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.left.top.mas_greaterThanOrEqualTo(0);
        }];
        self.contentV = contentV;
    }
    return self;
}





+(void)showWithTitle:(NSString *)title Message:(NSString *)message Cancel:(NSString *)cancel Cancel:(void (^)(void))cancelBlock Confirm:(NSString *)confirm Confirm:(void (^)(void))confirmBlock{
    BaseAlertView *alterV = [[BaseAlertView alloc] initWithFrame:CGRectZero];
    UILabel *titleL = [UILabel ll_LabelWithFrame:CGRectZero Text:title Font:LL_FontFromiPhone6ByeSize(18) TextColor:LL_ColorWithHexStr(@"#272727") TextAlignment:1 BackGroundColor:nil];
    [alterV.contentV addSubview:titleL];
    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_greaterThanOrEqualTo(ll_WidthFromIphone6(20));
        make.width.mas_equalTo(ll_WidthFromIphone6(225));
        make.centerX.equalTo(alterV.contentV);
        make.top.mas_equalTo(ll_WidthFromIphone6(20));
        make.height.mas_greaterThanOrEqualTo(ll_WidthFromIphone6(18));
    }];
    titleL.numberOfLines = 0;
    
    
    UILabel *messageL = [UILabel ll_LabelWithFrame:CGRectZero Text:message Font:LL_FontFromiPhone6ByeSize(15) TextColor:LL_ColorWithHexStr(@"999999") TextAlignment:1 BackGroundColor:nil];
    [alterV.contentV addSubview:messageL];
    [messageL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_greaterThanOrEqualTo(ll_WidthFromIphone6(20));
        make.centerX.equalTo(alterV.contentV);
        make.top.equalTo(titleL.mas_bottom).mas_offset(ll_WidthFromIphone6(20));
        make.height.mas_greaterThanOrEqualTo(ll_WidthFromIphone6(15));
    }];
    
    
    UIView *lineH = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:LL_ColorWithHexStr(@"#C1C1C1")];
    [alterV addSubview:lineH];
    [lineH mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0);
        make.top.equalTo(messageL.mas_bottom).mas_offset(ll_WidthFromIphone6(19));
    }];
    UIView *lineV = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:LL_ColorWithHexStr(@"#C1C1C1")];
    [alterV.contentV addSubview:lineV];
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineH.mas_bottom);
        make.centerX.equalTo(alterV.contentV);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(ll_WidthFromIphone6(39));
        make.bottom.mas_equalTo(0);
    }];
    
    UIButton *cancelBtn = [UIButton ll_buttonWithFrame:CGRectZero Title:cancel Font:LL_FontFromiPhone6ByeSize(16) TextColot:LL_ColorWithHexStr(@"333333") BackGroundImageNor:[UIImage imageNamed:@""] BackGroundImageSel:[UIImage imageNamed:@""] ActionSel:@selector(cancelAct:) target:self];
    [alterV.contentV addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.top.equalTo(lineH.mas_bottom);
        make.right.equalTo(lineV.mas_left);
    }];
    
    UIButton *confirmBtn = [UIButton ll_buttonWithFrame:CGRectZero Title:confirm Font:LL_FontFromiPhone6ByeSize(16) TextColot:LL_ColorWithHexStr(@"333333") BackGroundImageNor:[UIImage imageNamed:@""] BackGroundImageSel:[UIImage imageNamed:@""] ActionSel:@selector(confirmAct:) target:self];
    [alterV.contentV addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.top.equalTo(lineH.mas_bottom);
        make.left.equalTo(lineV.mas_right);
    }];
}



-(void)cancelBtn:(UIButton *)button{
    
}

-(void)confirmAct:(UIButton *)button{
    
}








-(instancetype)initWithcontentView:(UIView *)customView{
    if (self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.bounds]) {
        self.backgroundColor = LL_ColorWithHexStrA(@"000000", 0.4);
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.windowLevel = UIWindowLevelAlert;
        self.frame = window.bounds;
        [window addSubview:self];
        [self addSubview:customView];
        [customView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.height.mas_greaterThanOrEqualTo(0);
        }];
        
    }
    return self;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    self.contentV.center = self.center;
}









-(void)show{
    [self layoutIfNeeded];
}
-(void)dismiss{
     [self removeFromSuperview];
}
@end
