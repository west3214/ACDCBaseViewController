//
//  UILabel+UI.h
//  JTProject
//
//  d by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (UI)




/**
 创建Label :frame、内容、字体、文字颜色、背景色
 */
+(instancetype)ll_LabelWithFrame:(CGRect)frame
                                  Text:(NSString *)text
                                 Font:(UIFont *)font
                            TextColor:(UIColor *)textColor
                     TextAlignment:(NSTextAlignment)textAlignment
                      BackGroundColor:(UIColor *)backGroundColor;
/**
 创建Label :frame、内容、字体、文字颜色、背景色、圆角
 */
//+(instancetype)ll_LabelWithFrame:(CGRect)frame
//                                  Text:(NSString *)text
//                                  Font:(UIFont *)font
//                             TextColor:(UIColor *)textColor
//                       BackGroundColor:(UIColor *)backGroundColor
//                         CornerRadius:(CGFloat)cornerRadius;
//
///**
// 创建Label :frame、内容、字体、文字颜色、背景色、圆角、边框宽度、边框颜色
// */
//+(instancetype)ll_LabelWithFrame:(CGRect)frame
//                                  Text:(NSString *)text
//                                  Font:(UIFont *)font
//                             TextColor:(UIColor *)textColor
//                       BackGroundColor:(UIColor *)backGroundColor
//                          CornerRadius:(CGFloat)cornerRadius
//                          BorderWidth:(CGFloat)borderWidth
//                          BorderColor:(UIColor *)borderColor;



#pragma mark ----- 行间距、字间距
/**
 *  改变行间距
 */
+ (void)ll_ChangeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)ll_ChangeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)ll_ChangeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end

NS_ASSUME_NONNULL_END
