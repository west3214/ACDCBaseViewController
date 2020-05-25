//
//  BaseViewController.m
//  JTProject
//
//  Created by iMac on 2018/11/13.
//  Copyright © 2018 iMac. All rights reserved.
//

#import "ACBaseViewController.h"
#import <sys/utsname.h>

@interface ACBaseViewController ()<UIWebViewDelegate, UIScrollViewDelegate>
/**<# #>*/
@property (nonatomic, copy) void(^rightBarItemAction)(void);
/** */
/**<# #>*/
@property (nonatomic, strong) UIButton *tmpCountDodnButton;
@property (nonatomic, assign) NSInteger tmpCountDodnTimeNum;
@property (nonatomic, strong) NSTimer *tmpCountDodnTimer;

/**<# #>*/
@property (nonatomic, copy) void (^getCommonInfoSuccessBloc)(void);
@property (nonatomic, copy) void (^getCommonInfoFaileBloc)(void);

@property(weak,nonatomic) NSTimer *timer;
@property (nonatomic, assign) NSInteger timeNum;
@property (nonatomic, strong) UIButton *veriBtnAC;

/***/
@property (nonatomic, strong) UIImageView *warnImageView;
@property (nonatomic, strong) YYLabel *warnLabel;
@property (nonatomic, copy) void (^highLightTextBlock)(void);
@end

@implementation ACBaseViewController
/**
 <#code#>
 */
-(void)currentBackBtnAction{
    if (self.navigationController.viewControllers.count < 2) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
/**
<#code#>
*/
-(void)setCurrentTitle:(NSString *)currentTitle{
    _currentTitle = currentTitle;
    self.currentTitleL.text = currentTitle;
}

/**
<#code#>
*/
-(void)setCurrentNavigationBarHidden:(BOOL)currentNavigationBarHidden{
    _currentNavigationBarHidden = currentNavigationBarHidden;
    self.currentNavigationBar.hidden = currentNavigationBarHidden;
    if (currentNavigationBarHidden) {
        [self.currentNavigationBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }else{
        [self.currentNavigationBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(ll_MaxNavigationHeight);
        }];
        if (self.navigationController.viewControllers.count < 2) {
            self.currentBackBtn.hidden = NO;
            [self.currentBackBtn setBackgroundImage:[DrawImageTool drawCloseColor:LL_ColorWithHexStr(@"333333")] forState:UIControlStateNormal];
            [self.currentBackBtn.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(ll_WidthFromIphone6(13), ll_WidthFromIphone6(13)));
            }];
        }
    }
}
/**自定义导航栏默认透明度*/
-(void)setCurrentNavigationBarAlpha:(CGFloat)currentNavigationBarAlpha{
    _currentNavigationBarAlpha = currentNavigationBarAlpha;
    self.currentNavigationBar.alpha = currentNavigationBarAlpha;
    if (!self.currentNavigationWillChanged) {
        if (currentNavigationBarAlpha != 1) {
            [self.currentContentV mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.top.bottom.mas_equalTo(0);
            }];
            self.currentNavigationBarBottomLine.alpha = 0;
        }
    }
}
/**自定义导航栏改变透明度 */
- (void)setCurrentNavigationBarAlpha:(CGFloat)currentNavigationBarAlpha
             WithCurrentAlphaOffSetY:(CGFloat)currentAlphaOffSetY
                      WithScrollView:(UIScrollView *)currentScrollView{
    self.currentNavigationBarAlpha = currentNavigationBarAlpha;
    self.currentAlphaOffSetY = currentAlphaOffSetY;
    self.currentScrollView = currentScrollView;
    currentScrollView.delegate = self;
    self.currentNavigationWillChanged = YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.currentScrollView isEqual:scrollView]) {
        if (scrollView.contentOffset.y <= 0) {
            self.currentNavigationBar.alpha = self.currentNavigationBarAlpha;
        }else if (scrollView.contentOffset.y >= self.currentAlphaOffSetY) {
            self.currentNavigationBar.alpha = 1;
        }else{
            self.currentNavigationBarAlpha = self.currentAlphaOffSetY / (self.currentAlphaOffSetY - scrollView.contentOffset.y) - 1.0;
        }
    }
}















-(void)tokenOutTimeAction{
//    if ([ACSystemPreferrence objectForKey:ACUserLoginData]) {
//
//        [[NSNotificationCenter defaultCenter] removeObserver:self name:ADDTokenTime_Noti object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logSuccessAction) name:ACLogInOrRegistSuccess object:nil];
        [ACSystemPreferrence clearPreferrence];
    
    ACBaseNavigationController *navc =[[ACBaseNavigationController alloc] initWithRootViewController:[NSClassFromString(@"ACLoginViewController") new]];
    navc.modalPresentationStyle = 0;
        [self presentViewController:navc animated:YES completion:^{
        }];
//        [UIApplication sharedApplication].keyWindow.rootViewController = [[NSClassFromString(@"ACLoginViewController") class] new];
//        [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
//    }
}
-(void)logSuccessAction{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tokenOutTimeAction) name:ADDTokenTime_Noti object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:ACLogInOrRegistSuccess object:nil];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (void)showNavigationWithClearBackgroundColor{
    self.navigationController.navigationBar.translucent = YES;
    // 将状态栏和导航条设置成透明
    UIImage *image = [UIImage ll_imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
- (void)setNavigationBackgroundWithColor:(UIColor *)color{
    if(self.navigationController.navigationBar.translucent == NO){
        [self.navigationController.navigationBar setTranslucent:YES];
    }
    // 将状态栏和导航条设置成透明
    if (color == nil) {
        color = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0];
    }
    UIImage *image = [UIImage ll_imageWithColor:color];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


-(void)setRightNavigationBarItemWithImge:(UIImage *)image size:(CGSize)size action:(void(^)(void))rightBarItemAction{
    self.rightBarItemAction = rightBarItemAction;
    UIButton *rightNavcBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightNavcBtn.frame = CGRectMake(0, 0, size.width, size.height);
    [rightNavcBtn setBackgroundImage:image forState:UIControlStateNormal];
    [rightNavcBtn addTarget:self action:@selector(rightNavigationBarItemAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightNavcBtn];
    self.navigationItem.rightBarButtonItem = item;
}


//设置rightNavigationBarItem
-(void)setRightNavigationBarItemWithTitle:(NSString *)rightBarItemTitle WithFont:(UIFont *)textFont WithTextColorNor:(UIColor *)textColorNor WithTextColorSel:(UIColor *)textColorSel WithTextColorHighlighted:(UIColor *)textColorHighlighted WithBackImgNor:(UIImage *)backImgNor WithBackImageHighlighted:(UIImage *)backImgHighlighted action:(void(^)(void))rightBarItemAction{
    self.rightBarItemAction = rightBarItemAction;
    UIButton *rightItem = [UIButton ll_buttonWithFrame:CGRectZero Title:rightBarItemTitle Font:textFont ? textFont : LL_FontFromiPhone6ByeSizeAndWeight(12, UIFontWeightMedium) TextColot:textColorNor ? textColorNor : LL_ThemeColor BackGroundImageNor:backImgNor BackGroundImageSel:nil ActionSel:@selector(rightNavigationBarItemAction) target:self];
    [rightItem setTitleColor:textColorSel forState:UIControlStateSelected];
    [rightItem setTitleColor:textColorHighlighted forState:UIControlStateHighlighted];
    [rightItem setBackgroundImage:backImgHighlighted forState:UIControlStateHighlighted];
    [self.currentNavigationBar addSubview:rightItem];
    [rightItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ll_WidthFromIphone6(-5));
        make.top.bottom.equalTo(self.currentBackBtn);
        make.width.mas_greaterThanOrEqualTo(0);
    }];
  
}
-(void)rightNavigationBarItemAction{
    [self.view endEditing:YES];
    if (self.rightBarItemAction) {
        self.rightBarItemAction();
    }
}



#pragma mark ----- 设置导航条

-(void)setThemeColorNavigation{
    [self.navigationController.navigationBar setBarTintColor:LL_ThemeColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]}];
}
-(void)setWhiteNavigation{
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:LL_ColorWithHexStr(@"333333"),NSFontAttributeName:[UIFont systemFontOfSize:17]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //    [self setStatusBarBackgroundColor:LL_ThemeColor];
    [self setUpCustomNavigationBar];
    [self setNavigationBackgroundWithColor:LL_ColorWithHexStr(@"FFFFFF")];
    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    self.edgesForExtendedLayout = UIRectEdgeNone;
   
    
    [SVProgressHUD setMinimumDismissTimeInterval:1.8];
    
    
    [SVProgressHUD setBackgroundColor:LL_ColorWithHexStr(@"FFFFFF")];
    [SVProgressHUD setBorderWidth:1.0];
    [SVProgressHUD setBorderColor:LL_ThemeColor];
    [SVProgressHUD setContainerView:[UIApplication sharedApplication].keyWindow];
    [self.view setBackgroundColor:LL_ColorWithHexStr(@"FFFFFF")];
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self setupWarnBackView];
    [SVProgressHUD setForegroundColor:LL_ThemeColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tokenOutTimeAction) name:ADDTokenTime_Noti object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logSuccessAction) name:ACLogInOrRegistSuccess object:nil];
    
   
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;
       [JPUSHService setBadge:0];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    [SVProgressHUD dismiss];
}



-(void)cancelAct:(UIButton *)button{
    [button.superview removeFromSuperview];
}



-(void)countdownwithBtn:(UIButton *)buttton{
    self.veriBtnAC = buttton;
    self.timeNum = 60;
    buttton.enabled = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeVerificaitonButton) userInfo:nil repeats:YES];
    [self.timer fire];

}
-(void)changeVerificaitonButton{
    [self.veriBtnAC setTitle:[NSString stringWithFormat:@"%zds",self.timeNum] forState:UIControlStateNormal];
    self.timeNum--;
    if (self.timeNum <= 0) {
        self.timeNum = 60;
        [self.timer invalidate];
        self.veriBtnAC.enabled = YES;
        [self.veriBtnAC setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}



-(void)webViewDidFinishLoad:(UIWebView *)webView{
    if (webView.tag == 12300) {
        [SVProgressHUD dismiss];
    }
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    if (webView.tag == 12300) {
        [SVProgressHUD dismiss];
    }
}


-(void)setupWarnBackView{
    UIView *warnBackView = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:LL_ColorWithHexStr(@"FFFFFF")];
    [self.view addSubview:warnBackView];
    [warnBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIImageView *imageView = [UIImageView ll_imageViewWithFrame:CGRectZero Image:[UIImage imageNamed:@"ACRefund_noData.png"] BackGroundColor:nil];
    [warnBackView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ll_WidthFromIphone6(112), ll_WidthFromIphone6(125)));
        make.top.mas_equalTo(ll_WidthFromIphone6(84));
        make.centerX.equalTo(warnBackView);
    }];
    self.warnImageView = imageView;
    
    YYLabel *label = [YYLabel new];
    self.warnLabel = label;
    [warnBackView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(imageView.mas_bottom).mas_offset(ll_WidthFromIphone6(37));
        make.height.mas_equalTo(ll_WidthFromIphone6(15));
    }];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"您还没借款记录，现在前往借款"];
    [str setYy_color:LL_ColorWithHexStr(@"7D7C7C")];
    label.textAlignment = NSTextAlignmentCenter;
    [str yy_setAlignment:NSTextAlignmentCenter range:str.yy_rangeOfAll];
    YYTextDecoration *decoration = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1) color:LL_ThemeColor];
    [str yy_setTextUnderline:decoration range:[str.string rangeOfString:@"现在前往借款"]];
    [str yy_setTextHighlightRange:[str.string rangeOfString:@"现在前往借款"] color:LL_ThemeColor backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        self.tabBarController.selectedIndex = 0;
    }];
    label.attributedText = str;
    self.warnBackView = warnBackView;
    self.warnBackView.hidden = YES;
}
-(void)setWarnViewWithWarnImage:(UIImage *)warnImg WithImageSize:(CGSize)imageSize WithWarnMessage:(NSString *)warnMessage WithHighLightText:(NSString *)highLightText WithHighLightBlock:(void (^)(void))highLightBlock{
    self.warnImageView.image = warnImg;
    [self.warnImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(imageSize);
    }];
    self.highLightTextBlock = highLightBlock;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:warnMessage];
    [str setYy_color:LL_ColorWithHexStr(@"7D7C7C")];
    [str yy_setAlignment:NSTextAlignmentCenter range:str.yy_rangeOfAll];
    YYTextDecoration *decoration = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1) color:LL_ThemeColor];
    ll_WeakSelf;
    if (highLightText) {
        [str yy_setTextUnderline:decoration range:[str.string rangeOfString:highLightText]];
        [str yy_setTextHighlightRange:[str.string rangeOfString:highLightText] color:LL_ThemeColor backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            [weakSelf clickHighLightTextAction];
        }];
    }
    self.warnLabel.attributedText = str;
}
-(void)clickHighLightTextAction{
    if (self.highLightTextBlock) {
        self.highLightTextBlock();
    }
}


-(NSString*)deviceModelName
{
    //https://www.jianshu.com/p/308a4a85e114
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString *platform = deviceString;
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
     if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
     if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
     if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
     if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
     if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
     if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
     if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
     if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
     if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
     if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
     if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
     if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
     if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
     if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
     if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
     if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
     if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
     if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
     if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
     if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
     if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    //2017年9月发布，更新三种机型：iPhone 8、iPhone 8 Plus、iPhone X
     if ([platform isEqualToString:@"iPhone10,1"])  return @"iPhone 8";
     if ([platform isEqualToString:@"iPhone10,4"])  return @"iPhone 8";
     if ([platform isEqualToString:@"iPhone10,2"])  return @"iPhone 8 Plus";
     if ([platform isEqualToString:@"iPhone10,5"])  return @"iPhone 8 Plus";
     if ([platform isEqualToString:@"iPhone10,3"])  return @"iPhone X";
     if ([platform isEqualToString:@"iPhone10,6"])  return @"iPhone X";
     //2018年10月发布，更新三种机型：iPhone XR、iPhone XS、iPhone XS Max
     if ([platform isEqualToString:@"iPhone11,8"])  return @"iPhone XR";
     if ([platform isEqualToString:@"iPhone11,2"])  return @"iPhone XS";
     if ([platform isEqualToString:@"iPhone11,4"])  return @"iPhone XS Max";
     if ([platform isEqualToString:@"iPhone11,6"])  return @"iPhone XS Max";
     //2019年9月发布，更新三种机型：iPhone 11、iPhone 11 Pro、iPhone 11 Pro Max
     if ([platform isEqualToString:@"iPhone12,1"])  return  @"iPhone 11";
     if ([platform isEqualToString:@"iPhone12,3"])  return  @"iPhone 11 Pro";
     if ([platform isEqualToString:@"iPhone12,5"])  return  @"iPhone 11 Pro Max";
    
    
    if([platform isEqualToString:@"iPad1,1"])   return @"iPad";
    if([platform isEqualToString:@"iPad1,2"])   return @"iPad 3G";
    if([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (WiFi)";
    if([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (CDMA)";
    if([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini (WiFi)";
    if([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini";
    if([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini (GSM+CDMA)";
    if([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (WiFi)";
    if([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (GSM+CDMA)";
    if([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (WiFi)";
    if([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (GSM+CDMA)";
    if([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (WiFi)";
    if([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (Cellular)";
    if([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2 (WiFi)";
    if([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2 (Cellular)";
    if([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2";
    if([platform isEqualToString:@"iPad4,7"])   return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,8"])   return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,9"])   return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad5,1"])   return @"iPad Mini 4 (WiFi)";
    if([platform isEqualToString:@"iPad5,2"])   return @"iPad Mini 4 (LTE)";
    if([platform isEqualToString:@"iPad5,3"])   return @"iPad Air 2";
    if([platform isEqualToString:@"iPad5,4"])   return @"iPad Air 2";
    if([platform isEqualToString:@"iPad6,3"])   return @"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,4"])   return @"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,7"])   return @"iPad Pro 12.9";
    if([platform isEqualToString:@"iPad6,8"])   return @"iPad Pro 12.9";
    if([platform isEqualToString:@"iPad6,11"])  return @"iPad 5 (WiFi)";
    if([platform isEqualToString:@"iPad6,12"])  return @"iPad 5 (Cellular)";
    if([platform isEqualToString:@"iPad7,1"])   return @"iPad Pro 12.9 inch 2nd gen (WiFi)";
    if([platform isEqualToString:@"iPad7,2"])   return @"iPad Pro 12.9 inch 2nd gen (Cellular)";
    if([platform isEqualToString:@"iPad7,3"])   return @"iPad Pro 10.5 inch (WiFi)";
    if([platform isEqualToString:@"iPad7,4"])   return @"iPad Pro 10.5 inch (Cellular)";
    //2019年3月发布，更新二种机型：iPad mini、iPad Air
    if ([platform isEqualToString:@"iPad11,1"])   return @"iPad mini (5th generation)";
    if ([platform isEqualToString:@"iPad11,2"])   return @"iPad mini (5th generation)";
    if ([platform isEqualToString:@"iPad11,3"])   return @"iPad Air (3rd generation)";
    if ([platform isEqualToString:@"iPad11,4"])   return @"iPad Air (3rd generation)";
    
    
    
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
       if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
       if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
       if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
       if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
       if ([platform isEqualToString:@"iPod7,1"])      return @"iPod touch (6th generation)";
       //2019年5月发布，更新一种机型：iPod touch (7th generation)
       if ([platform isEqualToString:@"iPod9,1"])      return @"iPod touch (7th generation)";

       return @"Unknown Device";
}
@end
