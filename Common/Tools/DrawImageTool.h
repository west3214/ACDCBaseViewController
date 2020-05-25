//
//  DrawImageTool.h
//  JinFuLite
//
//  Created by CC on 2018/3/12.
//  Copyright © 2018年 gf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrawImageTool : NSObject


/**
 画方形
 
 */
+(UIImage *)drawSquareColor:(UIColor *)color size:(CGSize )size;
+(UIImage *)drawSquare:(UIColor *)color;
/**
 画圆形
 */
+(UIImage *)drawCircleColor:(UIColor *)color size:(CGSize )size;
+(UIImage *)drawCircleColor:(UIColor *)color;


/**
 画X
 */
+(UIImage *)drawCloseColor:(UIColor *)color;
+(UIImage *)drawCloseColor:(UIColor *)color size:(CGSize)size;
+(UIImage *)drawCloseColor:(UIColor *)color size:(CGSize)size width:(CGFloat)width;

/**
 画 播放按钮
 */
+(UIImage *)drawPlayColor:(UIColor *)color;
+(UIImage *)drawPlayTwo;
/**
 画 + 按钮
 */
+(UIImage *)drawAddColor:(UIColor *)color;
+(UIImage *)drawAddColor:(UIColor *)color size:(CGSize)size;
+(UIImage *)drawAddColor:(UIColor *)color size:(CGSize)size width:(CGFloat)width;
/**
 画 - 按钮
 */
+(UIImage *)drawMinusColor:(UIColor *)color;
+(UIImage *)drawMinusColor:(UIColor *)color size:(CGSize)size;

/**
 画 >
 */
+(UIImage *)drawRightArrowColor:(UIColor *)color;
+(UIImage *)drawRightArrowColor:(UIColor *)color with:(CGFloat)width size:(CGSize)size;
/**
 画 <
 */
+(UIImage *)drawLeftArrowColor:(UIColor *)color;
+(UIImage *)drawLeftArrowColor:(UIColor *)color with:(CGFloat)width size:(CGSize)size;


/**
 画 ...
 */
+(UIImage *)draw3PointColor:(UIColor *)color size:(CGSize )size;
+(UIImage *)draw3Point;
@end
