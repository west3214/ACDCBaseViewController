//
//  UIColor+UI.h
//  JTProject
//
//  Created by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (UI)
+ (UIColor *)ll_ColorWithRGBHex:(UInt32)hex;
+ (UIColor *)ll_ColorWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha;


+(instancetype)ll_ColorWithHexStr:(NSString *)hexStr;
+(instancetype)ll_ColorWithHexStr:(NSString *)hexStr alpha:(CGFloat)alpha;


+ (UIColor *)ll_RandomColor;




@end

NS_ASSUME_NONNULL_END
