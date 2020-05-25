//
//  BaseActionSheetView.m
//  JTProject
//
//  Created by 张西方 on 2018/12/27.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "BaseActionSheetView.h"

@implementation BaseActionSheetView

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
        UIView *contentV = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:LL_ColorWithHexStrA(@"ffffff", 1)];
        [self addSubview:contentV];
        [contentV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_greaterThanOrEqualTo(0);
            make.bottom.mas_equalTo(1000);
        }];
        self.contentView = contentV;
    }
    return self;
}


- (void)show
{
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
    }];
}
- (void)dismiss
{
    [self layoutIfNeeded];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(1000);
        }];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
//////////////////////////////
@end
