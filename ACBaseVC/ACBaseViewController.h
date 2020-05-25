//
//  BaseViewController.h
//  JTProject
//
//  Created by iMac on 2018/11/13.
//  Copyright © 2018 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface ACBaseViewController : UIViewController

//设置rightNavigationBarItem
-(void)setRightNavigationBarItemWithTitle:(NSString *)rightBarItemTitle WithFont:(UIFont *)textFont WithTextColorNor:(UIColor *)textColorNor WithTextColorSel:(UIColor *)textColorSel WithTextColorHighlighted:(UIColor *)textColorHighlighted WithBackImgNor:(UIImage *)backImgNor WithBackImageHighlighted:(UIImage *)backImgHighlighted action:(void(^)(void))rightBarItemAction;
//设置rightNavigationBarItem-image
//-(void)setRightNavigationBarItemWithImge:(UIImage *)image size:(CGSize)size action:(void(^)(void))rightBarItemAction;


-(NSString*)deviceModelName;
//-(void)setCountDownButtonWithUrl:(NSString *)url Parameters:(NSMutableDictionary *)paraments WithButton:(UIButton *)button WithIsShowGraphicsValidationView:(BOOL)isShow;

-(void)setCountDownButtonWithUrl:(NSString *)url
                        PhoneNum:(NSString *)phoneNum
                      WithButton:(UIButton *)button
WithIsShowGraphicsValidationView:(BOOL)isShow;


@property (nonatomic, strong) NSString *veryfiCodeSectionId;

-(void)getCommonInfoWithSuccessBlock:(void(^)(void))successBlock
                      WithFaileBlock:(void(^)(void))faileBlock;


-(void)loadData;
#pragma mark ----- 设置导航条
-(void)setThemeColorNavigation;
-(void)setWhiteNavigation;
-(void)countdownwithBtn:(UIButton *)buttton;//倒计时



#pragma mark ----- 界面为空占位view
@property (nonatomic, strong) UIView *warnBackView;
-(void)setWarnViewWithWarnImage:(UIImage *)warnImg
                  WithImageSize:(CGSize)imageSize
                WithWarnMessage:(NSString *)warnMessage
              WithHighLightText:(NSString *)highLightText
             WithHighLightBlock:(void(^)(void))highLightBlock;
/**自定义导航栏*/
@property (nonatomic, strong) UIView *currentNavigationBar;
/**自定义导航栏下的横线*/
@property (nonatomic, strong) UIView *currentNavigationBarBottomLine;
/**自定义导航栏下的控制器的View*/
@property (nonatomic, strong) UIView *currentContentV;
/**自定义导航栏的返回按钮*/
@property (nonatomic, strong) CustomButton *currentBackBtn;
/**自定义导航栏标题文本框*/
@property (nonatomic, strong) UILabel *currentTitleL;
/**自定义导航栏的标题*/
@property (nonatomic, strong) NSString *currentTitle;
/**自定义导航栏显示与否*/
@property (nonatomic, assign) BOOL currentNavigationBarHidden;
/**自定义导航栏默认透明度*/
@property (nonatomic, assign) CGFloat currentNavigationBarAlpha;
/**自定义导航栏改变透明度时候的偏移量*/
@property (nonatomic, assign) CGFloat currentAlphaOffSetY;
/**自定义导航栏改变透明度时候所基于的UIScrollView*/
@property (nonatomic, strong) UIScrollView *currentScrollView;
/**自定义导航栏渐变与否*/
@property (nonatomic, assign) BOOL currentNavigationWillChanged;
/**自定义导航栏渐变透明度 */
- (void)setCurrentNavigationBarAlpha:(CGFloat)currentNavigationBarAlpha
             WithCurrentAlphaOffSetY:(CGFloat)currentAlphaOffSetY
                      WithScrollView:(UIScrollView *)currentScrollView;
/**<# #>*/
@end

NS_ASSUME_NONNULL_END
