       //
//  SteButton.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/7/14.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIControl
/**<#Description#>*/
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;




-(void)setTitle:(nullable NSString *)title forState:(UIControlState)controlState;
-(void)setBackgroundImage:(nullable UIImage *)image forState:(UIControlState)controlState;
-(void)setTitleColor:(nullable UIColor *)color forState:(UIControlState)controlState;

+(instancetype)ll_buttonWithFrame:(CGRect)frame
                            Title:(NSString *)title
                             Font:(UIFont *)font
                        TextColot:(UIColor *)textColot
               BackGroundImageNor:(UIImage *)backGroundImageNor
               BackGroundImageSel:(UIImage *)backGroundImageSel
                        ActionSel:(SEL)actionSel target:(id)target;
@end
