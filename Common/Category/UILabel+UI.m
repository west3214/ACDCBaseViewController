//
//  UILabel+UI.m
//  JTProject
//
//  d by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "UILabel+UI.h"

@implementation UILabel (UI)

/**
 创建Label :frame、内容、字体、文字颜色、背景色
 */
+(instancetype)ll_LabelWithFrame:(CGRect)frame
                            Text:(NSString *)text
                            Font:(UIFont *)font
                       TextColor:(UIColor *)textColor
                   TextAlignment:(NSTextAlignment)textAlignment
                 BackGroundColor:(UIColor *)backGroundColor{
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:frame];
    tempLabel.text = text;
    tempLabel.font = font;
    tempLabel.textColor = textColor;
    tempLabel.textAlignment = textAlignment;
    if (backGroundColor) {
        tempLabel.backgroundColor = backGroundColor;
    }
    return tempLabel;
}
/**
 创建Label :frame、内容、字体、文字颜色、背景色、圆角
 */
//+(instancetype)ll_LabelWithFrame:(CGRect)frame
//                                  Text:(NSString *)text
//                                  Font:(UIFont *)font
//                             TextColor:(UIColor *)textColor
//                       BackGroundColor:(UIColor *)backGroundColor
//                          CornerRadius:(CGFloat)cornerRadius{
//
//}

/**
 创建Label :frame、内容、字体、文字颜色、背景色、圆角、边框宽度、边框颜色
 */
//+(instancetype)ll_LabelWithFrame:(CGRect)frame
//                                  Text:(NSString *)text
//                                  Font:(UIFont *)font
//                             TextColor:(UIColor *)textColor
//                       BackGroundColor:(UIColor *)backGroundColor
//                          CornerRadius:(CGFloat)cornerRadius
//                           BorderWidth:(CGFloat)borderWidth
//                           BorderColor:(UIColor *)borderColor{
//    
//}

#pragma mark ----- 行间距、字间距
/**
 *  改变行间距
 */
+ (void)ll_ChangeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
/**
 *  改变字间距
 */
+ (void)ll_ChangeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
/**
 *  改变行间距和字间距
 */
+ (void)ll_ChangeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
@end
