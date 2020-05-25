//
//  UIView+UI.h
//  JTProject
//
//  d by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UI)
/**
 创建View :frame、背景色
 */
+(id)ll_ViewWithFrame:(CGRect)frame
      BackGroundColor:(UIColor *)backGroundColor;
/**
 创建View :frame、背景色、四个圆角
 */
+(id)ll_ViewWithFrame:(CGRect)frame
      BackGroundColor:(UIColor *)backGroundColor
         CornerRadius:(CGFloat)cornerRadius;

/**
 创建View :frame、背景色、任意圆角、圆角
 */
+(id)ll_ViewWithFrame:(CGRect)frame
      BackGroundColor:(UIColor *)backGroundColor
          RectCorners:(UIRectCorner)rectCorners
         CornerRadius:(CGFloat)cornerRadius;
/**
 创建View :frame、背景色、圆角、边框宽度、边框颜色
 */
+(id)ll_ViewWithFrame:(CGRect)frame
      BackGroundColor:(UIColor *)backGroundColor
         CornerRadius:(CGFloat)cornerRadius
          BorderWidth:(CGFloat)borderWidth
          BorderColor:(UIColor *)borderColor;


/**
 设置四个圆角
 */
-(void)ll_setCornerRadius:(CGFloat)cornerRadius;
/**
 设置任意圆角
 */
-(void)ll_setRoundingCorners:(UIRectCorner)roundingCorners CornerRadius:(CGFloat)cornerRadius;
/**
 设置阴影
 */
-(void)ll_setShadowColor:(UIColor *)shadowColor ShadowOffset:(CGSize)shadowOffset ShadowOpacity:(CGFloat)shadowOpacity ShadowRadius:(CGFloat)shadowRadius;

/**
设置渐变背景色+阴影
*/
-(void)ll_setGradientBackColorWithColors:(NSArray <UIColor *>*)colors
                          WithStartPoint:(CGPoint)startPoint
                            WithEndPoint:(CGPoint)endPoint
                           WithLocations:(NSArray <NSNumber *>*)locations
                         WithShadowColor:(UIColor *)shadowColor
                        WithShadowOffset:(CGSize)shadowOffset
                       WithShadowOpacity:(CGFloat)shadowOpacity
                        WithShadowRadius:(CGFloat)shadowRadius
                        WithCornerRadius:(CGFloat)cornerRadius;
#pragma mark ----- 获取当前视图控制器
-(UIViewController *)ll_viewController;




@end

NS_ASSUME_NONNULL_END
