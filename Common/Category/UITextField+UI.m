//
//  UITextField+UI.m
//  JTProject
//
//  Created by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "UITextField+UI.h"

@implementation UITextField (UI)
+(instancetype)ll_textFieldWithFrame:(CGRect)frame
                                Text:(NSString *)text
                                Font:(UIFont *)font
                           TextColor:(UIColor *)textColor
                       TextAlignment:(NSTextAlignment)alignment{
    UITextField *tmpTextField = [[UITextField alloc] initWithFrame:frame];
    tmpTextField.text = text;
    tmpTextField.textColor = textColor;
    tmpTextField.textAlignment = alignment;
    tmpTextField.font = font;
    return tmpTextField;
}
//必须先设置placeholder
-(void)ll_updatePlaceholderFont:(UIFont *)font
                placeholdeColor:(UIColor *)color{
    NSMutableDictionary *atrs = @{}.mutableCopy;
    atrs[NSFontAttributeName] = font;
    atrs[NSForegroundColorAttributeName] = color;
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:atrs];
  
    

}
@end
