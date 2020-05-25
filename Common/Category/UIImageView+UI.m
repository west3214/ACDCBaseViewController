//
//  UIImageView+UI.m
//  JTProject
//
//  Created by 张西方 on 2018/11/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "UIImageView+UI.h"
@implementation UIImageView (UI)
+(instancetype)ll_imageViewWithFrame:(CGRect)frame Image:(UIImage *)image BackGroundColor:(UIColor *)backGroundColor{
    UIImageView *tmpImageView = [[UIImageView alloc] initWithFrame:frame];
    if (image) {
        tmpImageView.image = image;
    }
    if (backGroundColor) {
        tmpImageView.backgroundColor = backGroundColor;
    }
    return tmpImageView;
}

-(void)addTarget:(nullable id)target action:(nonnull SEL)sel{
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:sel]];
}

//处理sdwebimage
-(void)ll_setImageWithUrl:(NSString *)imgUrl WithPlaceImage:(NSString *)imageName{
    if ([imgUrl hasPrefix:@"/"]) {
        ll_Log(@"图片地址:%@", [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", Base_IP_Url, imgUrl]]);
        [self sd_setImageWithURL:[[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", Base_IP_Url, imgUrl]] placeholderImage:[UIImage imageNamed:imageName]];
    }else{
        ll_Log(@"图片地址:%@", [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/%@", Base_IP_Url, imgUrl]]);
        [self sd_setImageWithURL:[[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/%@", Base_IP_Url, imgUrl]] placeholderImage:[UIImage imageNamed:imageName]];
    }
}
@end
