//
//  UIImageView+UI.h
//  JTProject
//
//  Created by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (UI)
+(instancetype)ll_imageViewWithFrame:(CGRect)frame
                               Image:(UIImage *)image
                     BackGroundColor:(UIColor *)backGroundColor;


-(void)ll_setImageWithUrl:(NSString *)imgUrl WithPlaceImage:(NSString *)imageName;
@end

NS_ASSUME_NONNULL_END
