//
//  UIImage+Category.m
//  JTProject
//
//  Created by 张西方 on 2018/11/18.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)
+(UIImage *)ll_imageWithColor:(UIColor *)color{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

//图片转base64字符串
-(NSString *)ll_transformImageToBase64Str{
    NSData *imagedata = UIImagePNGRepresentation(self);
    NSString *image64 = [imagedata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return image64;
}
//base64字符串转图片
+(UIImage *)ll_transformImageFromBase64Str:(NSString *)base64Str{
    NSData * imageData =[[NSData alloc] initWithBase64EncodedString:base64Str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    UIImage *photo = [UIImage imageWithData:imageData ];
    
    return photo;
}
@end
