//
//  BaseSearchViewController.m
//  JTProject
//
//  Created by 张西方 on 2018/12/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "ACBaseSearchViewController.h"

@interface ACBaseSearchViewController ()<UISearchBarDelegate>

@end

@implementation ACBaseSearchViewController

-(instancetype)initWithPlaceholder:(NSString *)placeholder CornerRadius:(CGFloat)cornerRadius{
    if (self = [super init]) {
        UISearchBar *searchBar = [[UISearchBar alloc] init];
        searchBar.placeholder = placeholder;
        searchBar.backgroundImage = [[UIImage alloc] init];
        searchBar.backgroundImage = [UIImage imageNamed:@"sexBankgroundImage"];
        searchBar.barTintColor = [UIColor colorWithRed:111 green:212 blue:163 alpha:1];
        searchBar.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.1];
        searchBar.showsCancelButton=NO;
        searchBar.barStyle=UIBarStyleDefault;
        searchBar.keyboardType=UIKeyboardTypeNamePhonePad;
        UIColor *color =  self.navigationController.navigationBar.tintColor;
//        searchBar.searchBarStyle = UISearchBarStyleMinimal;//没有背影，透明样式
        searchBar.delegate=self;
//        searchBar.layer.cornerRadius = cornerRadius;
        searchBar.layer.masksToBounds = YES;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
    
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
