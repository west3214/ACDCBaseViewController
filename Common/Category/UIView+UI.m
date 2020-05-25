//
//  UIView+UI.m
//  JTProject
//
//  d by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "UIView+UI.h"


@implementation UIView (UI)
/**
 创建View :frame、背景色
 */
+(id)ll_ViewWithFrame:(CGRect)frame
            BackGroundColor:(UIColor *)backGroundColor{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    if (backGroundColor) {
        view.backgroundColor = backGroundColor;
    }
    
    
    return view;
}

/**
 创建View :frame、背景色、四个圆角
 */
+(id)ll_ViewWithFrame:(CGRect)frame
            BackGroundColor:(UIColor *)backGroundColor
               CornerRadius:(CGFloat)cornerRadius{
    UIView *view = [UIView ll_ViewWithFrame:frame BackGroundColor:backGroundColor];
    //得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;

    return view;
}
/**
 创建View :frame、背景色、任意圆角
 */
+(id)ll_ViewWithFrame:(CGRect)frame
      BackGroundColor:(UIColor *)backGroundColor
          RectCorners:(UIRectCorner)rectCorners
         CornerRadius:(CGFloat)cornerRadius{
    UIView *view = [UIView ll_ViewWithFrame:frame BackGroundColor:backGroundColor];
    //得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:rectCorners cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;

    return view;
}
/**
 创建View :frame、背景色、圆角、边框宽度、边框颜色
 */
+(id)ll_ViewWithFrame:(CGRect)frame
            BackGroundColor:(UIColor *)backGroundColor
               CornerRadius:(CGFloat)cornerRadius
                BorderWidth:(CGFloat)borderWidth
                BorderColor:(UIColor *)borderColor{
    
    UIView *view = [UIView ll_ViewWithFrame:frame BackGroundColor:backGroundColor];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer *temp = [CAShapeLayer layer];
    temp.lineWidth = borderWidth;
    temp.fillColor = [UIColor clearColor].CGColor;
    temp.strokeColor = borderColor.CGColor;
    temp.frame = view.bounds;
    temp.path = path.CGPath;
    [view.layer addSublayer:temp];
    
    CAShapeLayer *mask = [[CAShapeLayer alloc]initWithLayer:temp];
    mask.path = path.CGPath;
    view.layer.mask = mask;
    return view;
}




/**
 设置四个圆角
 */
-(void)ll_setCornerRadius:(CGFloat)cornerRadius{
    [self layoutIfNeeded];//这句代码很重要，不能忘了
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}

/**
 设置任意圆角
 */
-(void)ll_setRoundingCorners:(UIRectCorner)roundingCorners CornerRadius:(CGFloat)cornerRadius{
    [self layoutIfNeeded];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:roundingCorners cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

/**
 设置阴影
 */
-(void)ll_setShadowColor:(UIColor *)shadowColor ShadowOffset:(CGSize)shadowOffset ShadowOpacity:(CGFloat)shadowOpacity ShadowRadius:(CGFloat)shadowRadius{
    self.layer.cornerRadius = shadowRadius;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius = shadowRadius;
}


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
                        WithCornerRadius:(CGFloat)cornerRadius{
    [self layoutIfNeeded];
    
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = self.bounds;
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    NSMutableArray *colorsM = @[].mutableCopy;
    for (int i = 0; i < colors.count; i++) {
        [colorsM addObject:((__bridge id)((UIColor *)colors[i]).CGColor)];
    }
    gl.colors = colorsM;
    gl.locations = locations;
    gl.cornerRadius = cornerRadius;
    gl.shadowColor = shadowColor.CGColor;
    gl.shadowOffset = shadowOffset;
    gl.shadowOpacity = shadowOpacity;
    gl.shadowRadius = shadowRadius;
    gl.cornerRadius = cornerRadius;
    [self.layer insertSublayer:gl atIndex:0];
    
}



/**
 获取当前视图控制器
 */
- (UIViewController *)ll_viewController {
//    for (UIWindow *window in [UIApplication sharedApplication].windows.reverseObjectEnumerator) {
//        UIView *tempView = window.subviews.lastObject;
//        for (UIView *subview in window.subviews.reverseObjectEnumerator) {
//            if ([subview isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
//                tempView = subview;
//                break;
//            }
//        }
//        BOOL(^canNext)(UIResponder *) = ^(UIResponder *responder){
//            if (![responder isKindOfClass:[UIViewController class]]) {
//                return YES;
//            } else if ([responder isKindOfClass:[UINavigationController class]]) {
//                return YES;
//            } else if ([responder isKindOfClass:[UITabBarController class]]) {
//                return YES;
//            } else if ([responder isKindOfClass:NSClassFromString(@"UIInputWindowController")]) {
//                return YES;
//            }
//            return NO;
//        };
//        UIResponder *nextResponder = tempView.nextResponder;
//
//        while (canNext(nextResponder)) {
//            tempView = tempView.subviews.firstObject;
//            if (!tempView) {
//                return nil;
//            }
//            nextResponder = tempView.nextResponder;
//        }
//        UIViewController *currentVC = (UIViewController *)nextResponder;
//        if (currentVC) {
//            return currentVC;
//        }
//    }
//    return nil;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
        UIView *tempView = window.subviews.lastObject;
        for (UIView *subview in window.subviews.reverseObjectEnumerator) {
            if ([subview isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
                tempView = subview;
                break;
            }
        }
        BOOL(^canNext)(UIResponder *) = ^(UIResponder *responder){
            if (![responder isKindOfClass:[UIViewController class]]) {
                return YES;
            } else if ([responder isKindOfClass:[UINavigationController class]]) {
                return YES;
            } else if ([responder isKindOfClass:[UITabBarController class]]) {
                return YES;
            } else if ([responder isKindOfClass:NSClassFromString(@"UIInputWindowController")]) {
                return YES;
            }
            return NO;
        };
        UIResponder *nextResponder = tempView.nextResponder;
        
        while (canNext(nextResponder)) {
            tempView = tempView.subviews.firstObject;
            if (!tempView) {
                return nil;
            }
            nextResponder = tempView.nextResponder;
        }
        UIViewController *currentVC = (UIViewController *)nextResponder;
        if (currentVC) {
            return currentVC;
        }
    return nil;
}


@end
