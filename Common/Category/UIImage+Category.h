//
//  UIImage+Category.h
//  JTProject
//
//  Created by 张西方 on 2018/11/18.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)
+(UIImage *)ll_imageWithColor:(UIColor *)color;
//图片转base64字符串
-(NSString *)ll_transformImageToBase64Str;
//base64字符串转图片
+(UIImage *)ll_transformImageFromBase64Str:(NSString *)base64Str;
@end

NS_ASSUME_NONNULL_END
