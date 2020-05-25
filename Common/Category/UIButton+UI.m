//
//  UIButton+UI.m
//  JTProject
//
//  Created by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "UIButton+UI.h"

@implementation UIButton (UI)

+(instancetype)ll_buttonWithFrame:(CGRect)frame
                            Title:(NSString *)title
                             Font:(UIFont *)font
                        TextColot:(UIColor *)textColot
               BackGroundImageNor:(UIImage *)backGroundImageNor
               BackGroundImageSel:(UIImage *)backGroundImageSel
                        ActionSel:(SEL)actionSel target:(id)target{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (backGroundImageNor) {
        [button setBackgroundImage:backGroundImageNor forState:UIControlStateNormal];
    }
    if (backGroundImageSel) {
        [button setBackgroundImage:backGroundImageSel forState:UIControlStateSelected];
    }
    [button setTitle:title.length ? title : @"" forState:UIControlStateNormal];
    if (textColot) {
        [button setTitleColor:textColot forState:UIControlStateNormal];
    }
    if (font) {
        button.titleLabel.font  = font;
    }
    if (actionSel) {
        [button addTarget:target action:actionSel forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

#pragma mark ----- 圆角
+(instancetype)ll_buttonWithFrame:(CGRect)frame Title:(NSString *)title Font:(UIFont *)font TextColot:(UIColor *)textColot CornerRadius:(CGFloat)cornerRadius BorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth BackGroundImageNor:(UIImage *)backGroundImageNor BackGroundImageSel:(UIImage *)backGroundImageSel ActionSel:(SEL)actionSel target:(id)target{
    UIButton *button = [UIButton ll_buttonWithFrame:frame Title:title Font:font TextColot:textColot BackGroundImageNor:backGroundImageNor BackGroundImageSel:backGroundImageSel ActionSel:actionSel target:target];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    if (borderWidth) {
        button.layer.borderWidth = borderWidth;
    }
    if (borderColor) {
        button.layer.borderColor = borderColor.CGColor;
    }
    
    return button;
}

-(void)ll_setImageWithURL:(nullable NSString *)url forState:(UIControlState)state{
    if ([url hasPrefix:@"/"]) {
        ll_Log(@"图片地址:%@", [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", Base_IP_Url, url]]);
        [self sd_setImageWithURL:[[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", Base_IP_Url, url]] forState:state];
    }else{
        ll_Log(@"图片地址:%@", [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/%@", Base_IP_Url, url]]);
        [self sd_setImageWithURL:[[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/%@", Base_IP_Url, url]] forState:state];
    }
}

@end
