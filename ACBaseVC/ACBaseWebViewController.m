//
//  BaseWebViewController.m

//
//  Created by 张西方 on 2018/11/19.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "ACBaseWebViewController.h"
#import <WebKit/WebKit.h>
@interface ACBaseWebViewController ()<UIWebViewDelegate>
/**<# #>*/
@property (nonatomic, strong)  UIWebView *webView;
/**<#Description#>*/
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) ACWebViewProgress * progressView;

@end

@implementation ACBaseWebViewController
-(instancetype)initWithUrl:(NSString *)url WithTitle:(nonnull NSString *)title{
    if (self = [super init]) {
        self.url = url;
        self.currentTitle = title;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.currentTitle = self.currentTitle;
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.currentContentV addSubview:webView];
    self.progressView = [ACWebViewProgress new];
    self.progressView.frame = CGRectMake(0, ll_MaxNavigationHeight - 2, ll_ScreenWidth, 2);
    [self.currentNavigationBar.layer addSublayer:self.progressView];
    if (self.url) {
        if ([self.url hasPrefix:@"http"]) {
            
        }else{
            if ([self.url hasPrefix:@"/"]) {
                self.url = [NSString stringWithFormat:@"%@%@", Base_IP_Url, self.url];
            }else{
                self.url = [NSString stringWithFormat:@"%@/%@", Base_IP_Url, self.url];
            }
        }
        
        [webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:MAXFLOAT]];
        [SVProgressHUD show];
    }else{
        [SVProgressHUD dismiss];
    }
    ll_Log(@"网页URL%@", self.url);
    
    if (@available(iOS 11.0, *)) {
        [webView.scrollView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    webView.delegate = self;
    UIButton *rightNaVBtnnn = [UIButton ll_buttonWithFrame:CGRectZero Title:@"看看别的" Font:LL_FontFromiPhone6ByeSizeAndWeight(12, UIFontWeightMedium) TextColot:LL_ThemeColor BackGroundImageNor:nil BackGroundImageSel:nil ActionSel:@selector(rightNaVBtnAction) target:self];
    [self.currentNavigationBar addSubview:rightNaVBtnnn];
    [rightNaVBtnnn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ll_WidthFromIphone6(15));
        make.right.mas_equalTo(ll_WidthFromIphone6(-10));
        make.centerY.equalTo(self.currentTitleL);
        make.width.mas_greaterThanOrEqualTo(0);
    }];
    self.rightNaVBtnnn = rightNaVBtnnn;
    rightNaVBtnnn.hidden = NO;
    UIView *LineVVVV = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:LL_ThemeColor];
    [self.currentNavigationBar addSubview:LineVVVV];
    [LineVVVV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(rightNaVBtnnn);
        make.height.mas_equalTo(1);
    }];
    if ([self.currentTitle isEqualToString:[NSString stringWithFormat:@"%@更新", APPName]]) {
        LineVVVV.hidden = rightNaVBtnnn.hidden = YES;
    }
}

-(void)rightNaVBtnAction{
    if (self.isFromBorrowVC) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self.navigationController popViewControllerAnimated:NO];
        if (self.rightNaVBtnnnBlock) {
            self.rightNaVBtnnnBlock();
        }
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [SVProgressHUD showWithStatus:@"加载中..."];
    [self.progressView startLoad];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [webView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
     [self.progressView speedLoad];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
    /*
     WeakSelf;
     JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
     
     context[@"onClose"] = ^() { // 后退
     // NSArray *args = [JSContext currentArguments];
     [weakSelf.navigationController popViewControllerAnimated:YES];
     };
     */
     [self.progressView speedLoad];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.progressView closeTimer];
    [self.progressView removeFromSuperlayer];
    self.progressView = nil;
    [SVProgressHUD dismiss];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
