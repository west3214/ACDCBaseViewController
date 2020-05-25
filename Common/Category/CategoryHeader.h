//
//  CategoryHeader.h
//  JTProject
//
//  Created by iMac on 2018/11/13.
//  Copyright © 2018 iMac. All rights reserved.
//

#ifndef CategoryHeader_h
#define CategoryHeader_h

#import "UILabel+UI.h"
#import "UIButton+UI.h"
#import "UITextField+UI.h"
#import "UITextView+UI.h"
#import "UIImageView+UI.h"
#import "UIView+UI.h"
#import "UIColor+UI.h"
#import "UIFont+UI.h"
#import "YYLabel+UI.h"


#import "NSString+Category.h"
#import "MF_Base64Additions.h"
#import "NSDictionary+Category.h"
#import "NSMutableDictionary+Category.h"
#import "UIImage+Category.h"
#import "NSDate+Category.h"
#import "NSArray+Category.h"


#define ll_ScreenBounds [UIScreen mainScreen].bounds
#define ll_ScreenSize ll_ScreenBounds.size
#define ll_ScreenWidth ll_ScreenSize.width
#define ll_ScreenHeight ll_ScreenSize.height

#define ll_StatusBarFrame [[UIApplication sharedApplication] statusBarFrame]
#define ll_StatusBarHeihgt ll_StatusBarFrame.size.height
#define ll_NavigationBarFrame [[UINavigationController alloc] init].navigationBar.frame
#define ll_NavigationBarHeight ll_NavigationBarFrame.size.height
#define ll_MaxNavigationHeight (ll_NavigationBarHeight + ll_StatusBarHeihgt)
#define ll_BottomSafeHeight   (ll_IsiPhoneX ? 34.0 : 0.0)
#define ll_TabBarHeight   [[UITabBarController alloc] init].tabBar.frame.size.height


#define ll_WidthFromIphone6(width) (ll_ScreenWidth * width / 375.0)
#define ll_HeightFromIphone6(height) ll_ScreenHeight * height / 667.0)


#define LL_FontFromiPhone6ByeSize(size) [UIFont systemFontOfSize:ll_WidthFromIphone6(size)]
#define LL_FontFromiPhone6ByNameAndSize(name, size) [UIFont fontWithName:name size:LL_WidthFromIphone6(size)]
#define LL_FontFromiPhone6ByeSizeAndWeight(size, fontWeight) [UIFont systemFontOfSize:ll_WidthFromIphone6(size) weight:fontWeight]

#define LL_ColorWithRGBHex(RGBHex) [UIColor ll_ColorWithRGBHex:RGBHex]
#define LL_ColorWithRGBHexA(RGBHex, aph) [UIColor ll_ColorWithRGBHex:RGBHex alpha:aph]
#define LL_ColorWithHexStr(hexStr) [UIColor ll_ColorWithHexStr:hexStr]
#define LL_ColorWithHexStrA(hexStr, aph) [UIColor ll_ColorWithHexStr:hexStr alpha:aph]
#define LL_RandomColor [UIColor ll_RandomColor]


#define LL_ImageNamed(imageName) [UIImage imageNamed:imageName]

#endif /* CategoryHeader_h */
