//
//  UIButton+UI.h
//  JTProject
//
//  Created by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (UI)
+(instancetype)ll_buttonWithFrame:(CGRect)frame
                            Title:(NSString *)title
                             Font:(UIFont *)font
                        TextColot:(UIColor *)textColot
               BackGroundImageNor:(UIImage *)backGroundImageNor
               BackGroundImageSel:(UIImage *)backGroundImageSel
                        ActionSel:(SEL)actionSel target:(id)target;
#pragma mark ----- 圆角
+(instancetype)ll_buttonWithFrame:(CGRect)frame
                            Title:(NSString *)title
                             Font:(UIFont *)font
                        TextColot:(UIColor *)textColot
                     CornerRadius:(CGFloat)cornerRadius
                      BorderColor:(UIColor *)borderColor
                      BorderWidth:(CGFloat)borderWidth
               BackGroundImageNor:(UIImage *)backGroundImageNor
               BackGroundImageSel:(UIImage *)backGroundImageSel
                        ActionSel:(SEL)actionSel target:(id)target;


#pragma mark ----- 加载图片
-(void)ll_setImageWithURL:(nullable NSString *)url forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
