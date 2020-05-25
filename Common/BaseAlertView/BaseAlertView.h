//
//  BaseAlertView.h
//  ACP3
//
//  Created by iMac on 2018/12/21.
//  Copyright © 2018 west3214. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseAlertView : UIView
@property (nonatomic, strong) UIView *contentV;
-(void)show;
-(void)dismiss;
@end

NS_ASSUME_NONNULL_END
