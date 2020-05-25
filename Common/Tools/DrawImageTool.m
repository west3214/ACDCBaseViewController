//
//  DrawImageTool.m
//  JinFuLite
//
//  Created by CC on 2018/3/12.
//  Copyright © 2018年 gf. All rights reserved.
//

#import "DrawImageTool.h"

@implementation DrawImageTool

+(UIImage *)drawSquareColor:(UIColor *)color size:(CGSize )size{
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(2, 2, size.width - 4, size.height - 4)];
    CGContextAddPath(context, path.CGPath);
    
    if (!color) {
        color = [UIColor lightGrayColor];
    }
    
    //    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    //    CGContextFillPath(context);
    CGContextStrokePath(context);
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  newImg;
}
+(UIImage *)drawSquare:(UIColor *)color{
    return [self drawSquareColor:color  size:CGSizeMake(40, 30)];
}


+(UIImage *)drawCircleColor:(UIColor *)color size:(CGSize )size{
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2, 2, size.width - 4, size.height - 4)];
    CGContextAddPath(context, path.CGPath);
    
    if (!color) {
        color = [UIColor lightGrayColor];
    }
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    //    CGContextFillPath(context);
    CGContextStrokePath(context);
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  newImg;
}
+(UIImage *)drawCircleColor:(UIColor *)color{
    return [self drawCircleColor:nil size:CGSizeMake(40, 30)];
}

+(UIImage *)drawCloseColor:(UIColor *)color size:(CGSize)size width:(CGFloat)width{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, width);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat centX = size.width  * 0.5;
    CGFloat centY = size.height * 0.5;
    CGFloat pathW = size.width * 0.5 - 3;
    
    CGPathMoveToPoint(path, NULL, centX - pathW, centY - pathW);
    CGPathAddLineToPoint(path, NULL, centX + pathW, centY + pathW);
    CGPathMoveToPoint(path, NULL, centX - pathW, centY + pathW);
    CGPathAddLineToPoint(path, NULL, centX + pathW, centY - pathW);
    
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  newImg;
    
}

+(UIImage *)drawCloseColor:(UIColor *)color size:(CGSize)size{
    
    return  [self drawCloseColor:color size:size width:3.0];;
}


+(UIImage *)drawCloseColor:(UIColor *)color{
    
    return [self drawCloseColor:color size:CGSizeMake(20, 20)];
}

+(UIImage *)drawPlayColor:(UIColor *)color size:(CGSize)size{
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(3, 3, size.width - 6, size.height - 6)];
    CGContextAddPath(context, circle.CGPath);
    CGContextStrokePath(context);
    
    CGMutablePathRef triangle = CGPathCreateMutable();
    CGFloat centX = size.width * 0.5;
    CGFloat centY = size.height * 0.5;
    CGFloat maxW = (size.width * 0.5 - 8) * 0.7;
    CGPathMoveToPoint(triangle, NULL, centX - maxW * 0.5, centY - maxW);
    CGPathAddLineToPoint(triangle, NULL, centX - maxW * 0.5, centY + maxW);
    CGPathAddLineToPoint(triangle, NULL, centX + maxW, centY);
    CGPathCloseSubpath(triangle);
    
    CGContextAddPath(context, triangle);
    CGContextFillPath(context);
    
    
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  newImg;
    
}

+(UIImage *)drawPlayColor:(UIColor *)color{
    
    return [self drawPlayColor:color size:CGSizeMake(50, 50)];
}

+(UIImage *)drawPlayTwo{
    UIColor *color = [UIColor whiteColor];
    CGSize size = CGSizeMake(60, 60);
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 3.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    [[UIColor colorWithWhite:1.0 alpha:0.5]setFill];
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(3, 3, size.width - 6, size.height - 6)];
    CGContextAddPath(context, circle.CGPath);
    [circle fill];
    
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGMutablePathRef triangle = CGPathCreateMutable();
    CGFloat centX = size.width * 0.5;
    CGFloat centY = size.height * 0.5;
    CGFloat maxW = (size.width * 0.5 - 8) * 0.7;
    CGPathMoveToPoint(triangle, NULL, centX - maxW * 0.5, centY - maxW);
    CGPathAddLineToPoint(triangle, NULL, centX - maxW * 0.5, centY + maxW);
    CGPathAddLineToPoint(triangle, NULL, centX + maxW, centY);
    CGPathCloseSubpath(triangle);
    
    CGContextAddPath(context, triangle);
    CGContextFillPath(context);
    
    
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  newImg;
    
}


+(UIImage *)drawAddColor:(UIColor *)color{
    return [self drawAddColor:color size:CGSizeMake(20, 20)];
}
+(UIImage *)drawAddColor:(UIColor *)color size:(CGSize)size{
    
    return  [self drawAddColor:color size:size width:3.0 ];
    
}
+(UIImage *)drawAddColor:(UIColor *)color size:(CGSize)size width:(CGFloat)width{
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, width);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat centX = size.width  * 0.5;
    CGFloat centY = size.height * 0.5;
    CGFloat pathW = size.width * 0.5 - 3;
    
    CGPathMoveToPoint(path, NULL, centX, centY - pathW);
    CGPathAddLineToPoint(path, NULL, centX, centY + pathW);
    CGPathMoveToPoint(path, NULL, centX - pathW, centY);
    CGPathAddLineToPoint(path, NULL, centX + pathW, centY);
    
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  newImg;
}

+(UIImage *)drawMinusColor:(UIColor *)color{
    return [self drawMinusColor:color size:CGSizeMake(20, 20)];
}
+(UIImage *)drawMinusColor:(UIColor *)color size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 3.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat centX = size.width  * 0.5;
    CGFloat centY = size.height * 0.5;
    CGFloat pathW = size.width * 0.5 - 3;
    
    
    CGPathMoveToPoint(path, NULL, centX - pathW, centY);
    CGPathAddLineToPoint(path, NULL, centX + pathW, centY);
    
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  newImg;
    
}

+(UIImage *)drawRightArrowColor:(UIColor *)color{
    return [self drawRightArrowColor:color size:CGSizeMake(30, 30)];
}
+(UIImage *)drawRightArrowColor:(UIColor *)color with:(CGFloat)width size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, width);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat centX = size.width  * 0.5;
    CGFloat centY = size.height * 0.5;
    CGFloat pathW = size.width * 0.2;
    CGFloat pathH = size.width * 0.5 - 3;
    
    CGPathMoveToPoint(path, NULL, centX - pathW, centY - pathH);
    CGPathAddLineToPoint(path, NULL, centX + pathW, centY);
    CGPathAddLineToPoint(path, NULL, centX - pathW, centY + pathH);
    
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  newImg;
    
}

+(UIImage *)drawRightArrowColor:(UIColor *)color size:(CGSize)size{
    return [self drawRightArrowColor:color with:3 size:size];
}

//
+(UIImage *)drawLeftArrowColor:(UIColor *)color{
    return  [self drawLeftArrowColor:color with:3.0 size:CGSizeMake(30, 30)];
}
+(UIImage *)drawLeftArrowColor:(UIColor *)color with:(CGFloat)width size:(CGSize)size{
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, width);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat centX = size.width  * 0.5;
    CGFloat centY = size.height * 0.5;
    CGFloat pathW = size.width * 0.2;
    CGFloat pathH = size.width * 0.5 - 3;
    
    CGPathMoveToPoint(path, NULL, centX + pathW, centY - pathH);
    CGPathAddLineToPoint(path, NULL, centX - pathW, centY);
    CGPathAddLineToPoint(path, NULL, centX + pathW, centY + pathH);
    
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  newImg;
    
}



+(UIImage *)draw3PointColor:(UIColor *)color size:(CGSize )size{
    
    UIGraphicsBeginImageContext(size);
    
    CGFloat pointWH = size.width / 5 - 2;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(size.width * 0.5 - pointWH * 0.5, size.height * 0.5 - pointWH * 0.5, pointWH, pointWH)];
    CGContextAddPath(context, path1.CGPath);
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(size.width * 0.5 - pointWH * 2.5, size.height * 0.5 - pointWH * 0.5, pointWH, pointWH)];
    CGContextAddPath(context, path2.CGPath);
    
    UIBezierPath *path3 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(size.width * 0.5 + pointWH * 1.5, size.height * 0.5 - pointWH * 0.5, pointWH, pointWH)];
    CGContextAddPath(context, path3.CGPath);
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);
    
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  newImg;
    
}

+(UIImage *)draw3Point{
    
    return  [self draw3PointColor:LL_ColorWithHexStr(@"#A0A0A0") size:CGSizeMake(36, 36)];
    
}

@end
