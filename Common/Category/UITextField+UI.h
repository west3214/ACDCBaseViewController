//
//  UITextField+UI.h
//  JTProject
//
//  Created by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (UI)
+(instancetype)ll_textFieldWithFrame:(CGRect)frame
                                Text:(NSString *)text
                                Font:(UIFont *)font
                           TextColor:(UIColor *)textColor
                       TextAlignment:(NSTextAlignment)alignment;
-(void)ll_updatePlaceholderFont:(UIFont *)font
                placeholdeColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
