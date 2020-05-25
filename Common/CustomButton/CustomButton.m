//
//  SteButton.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/7/14.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "CustomButton.h"

@interface CustomButton()
/**<# #>*/

@property (nonatomic, strong) NSString *titleNor, *titleHig, *titleSel, *titleDis;
@property (nonatomic, strong) UIFont *fontNor, *fontHig, *fontSel, *fontDis;
@property (nonatomic, strong) UIColor *colorNor, *colorHig, *colorSel, *colorDis;
/**<# #>*/
@property (nonatomic, strong) UIImage *imgNor, *imgHig, *imgSel, *imgDis;

@end

@implementation CustomButton
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


+(instancetype)ll_buttonWithFrame:(CGRect)frame
                            Title:(NSString *)title
                             Font:(UIFont *)font
                        TextColot:(UIColor *)textColot
               BackGroundImageNor:(UIImage *)backGroundImageNor
               BackGroundImageSel:(UIImage *)backGroundImageSel
                        ActionSel:(SEL)actionSel
                           target:(id)target{
    CustomButton *button = [[CustomButton alloc] initWithFrame:frame Title:title Font:font TextColot:textColot BackGroundImageNor:backGroundImageNor BackGroundImageSel:backGroundImageSel ActionSel:actionSel target:target];
    return button;
}



-(instancetype)initWithFrame:(CGRect)frame
                       Title:(NSString *)title
                        Font:(UIFont *)font
                   TextColot:(UIColor *)textColot
          BackGroundImageNor:(UIImage *)backGroundImageNor
          BackGroundImageSel:(UIImage *)backGroundImageSel
                   ActionSel:(SEL)actionSel target:(id)target{
    if (self = [super initWithFrame:frame]) {
        
        self.titleNor = title;
        self.fontNor = font;
        self.colorNor = textColot;
        self.imgNor = backGroundImageNor;
        self.imgSel = backGroundImageSel;

        
        
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
        imageView.image = backGroundImageNor;
        self.imageView = imageView;
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        titleLabel.text = title;
        titleLabel.font = font;
        titleLabel.textColor = textColot;
        titleLabel.textAlignment = 1;
        

        
        [self.titleLabel setTextColor:textColot];
        [self addTarget:target action:actionSel forControlEvents:UIControlEventTouchUpInside];
        
        [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}

-(void)setTitle:(nullable NSString *)title forState:(UIControlState)controlState{
    if (controlState == UIControlStateNormal) {
        self.titleNor = title;
    }else if (controlState == UIControlStateHighlighted){
        self.titleHig = title;
    }else if (controlState == UIControlStateDisabled){
        self.titleDis = title;
    }else if (controlState == UIControlStateSelected){
        self.titleSel = title;
    }
    [self updateNewState];
}

-(void)setBackgroundImage:(nullable UIImage *)image forState:(UIControlState)controlState{
//    if (controlState == UIControlStateNormal) {
//        self.imageView.image = self.imgNor;
//        self.titleLabel.text = self.titleNor;
//    }else if (controlState == UIControlStateHighlighted){
//        self.imageView.image = self.imgHig;
//        self.titleLabel.text = self.titleHig;
//    }else if (controlState == UIControlStateDisabled){
//        self.imageView.image = self.imgDis;
//        self.titleLabel.text = self.titleDis;
//    }else if (controlState == UIControlStateSelected){
//        self.imageView.image = self.imgSel;
//        self.titleLabel.text = self.titleSel;
//    }
    
    if (controlState == UIControlStateNormal) {
        self.imgNor = image;
    }else if (controlState == UIControlStateHighlighted){
        self.imgHig = image;
    }else if (controlState == UIControlStateDisabled){
        self.imgDis = image;
    }else if (controlState == UIControlStateSelected){
        self.imgSel = image;
    }
    [self updateNewState];
}
-(void)setTitleColor:(nullable UIColor *)color forState:(UIControlState)controlState{
    if (controlState == UIControlStateNormal) {
        self.colorNor = color;
    }else if (controlState == UIControlStateHighlighted){
        self.colorHig = color;
    }else if (controlState == UIControlStateDisabled){
        self.colorDis = color;
    }else if (controlState == UIControlStateSelected){
        self.colorSel = color;
    }
    
    [self updateNewState];
    
    
}
-(void)updateNewState{
    if (self.state == UIControlStateNormal) {
        self.imageView.image = self.imgNor;
        self.titleLabel.text = self.titleNor;
        self.titleLabel.textColor = self.colorNor;
        self.titleLabel.font = self.fontNor;
    }else if (self.state == UIControlStateHighlighted){
        self.imageView.image = self.imgHig ? self.imgHig : self.imgNor;
        self.titleLabel.text = self.titleHig ? self.titleHig : self.titleNor;
        self.titleLabel.textColor = self.colorHig ? self.colorHig : self.colorNor;
        self.titleLabel.font = self.fontHig ? self.fontHig : self.fontNor;
    }else if (self.state == UIControlStateDisabled){
        self.imageView.image = self.imgDis ? self.imgDis : self.imgNor;
        self.titleLabel.text = self.titleDis ? self.titleDis : self.titleNor;
        self.titleLabel.textColor = self.colorDis ? self.colorDis : self.colorNor;
        self.titleLabel.font = self.fontDis ? self.fontDis : self.fontNor;
    }else if (self.state == UIControlStateSelected){
        self.imageView.image = self.imgSel ? self.imgSel : self.imgNor;
        self.titleLabel.text = self.titleSel ? self.titleSel : self.titleNor;
        self.titleLabel.textColor = self.colorSel ? self.colorSel : self.colorNor;
        self.titleLabel.font = self.fontSel ? self.fontSel : self.fontNor;
    }
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    CustomButton *control = (CustomButton *)object;
    if ([keyPath isEqualToString:@"highlighted"] || [keyPath isEqualToString:@"selected"]){
            if (control.state == UIControlStateNormal) {
                control.imageView.image = control.imgNor;
                control.titleLabel.text = control.titleNor;
                control.titleLabel.textColor = control.colorNor;
                control.titleLabel.font = control.fontNor;
            }else if (control.state == UIControlStateHighlighted){
                control.imageView.image = control.imgHig ? control.imgHig : control.imgNor;
                control.titleLabel.text = control.titleHig ? control.titleHig : control.titleNor;
                control.titleLabel.textColor = control.colorHig ? control.colorHig : control.colorNor;
                control.titleLabel.font = control.fontHig ? control.fontHig : control.fontNor;
            }else if (control.state == UIControlStateDisabled){
                control.imageView.image = control.imgDis ? control.imgDis : control.imgNor;
                control.titleLabel.text = control.titleDis ? control.titleDis : control.titleNor;
                control.titleLabel.textColor = control.colorDis ? control.colorDis : control.colorNor;
                control.titleLabel.font = control.fontDis ? control.fontDis : control.fontNor;
            }else if (control.state == UIControlStateSelected){
                control.imageView.image = control.imgSel ? control.imgSel : control.imgNor;
                control.titleLabel.text = control.titleSel ? control.titleSel : control.titleNor;
                control.titleLabel.textColor = control.colorSel ? control.colorSel : control.colorNor;
                control.titleLabel.font = control.fontSel ? control.fontSel : control.fontNor;
            }
    }
}
@end
