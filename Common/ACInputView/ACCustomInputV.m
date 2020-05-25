//
//  ACCustomInputV.m
//  ACP3
//
//  Created by 张西方 on 2019/1/3.
//  Copyright © 2019年 west3214. All rights reserved.
//

#import "ACCustomInputV.h"
/**<#mark#>*/
#define ACCustomInputV_LineColor LL_ColorWithHexStr(@"e5e5e5")
@interface ACCustomInputV()<UITextViewDelegate>

@end

@implementation ACCustomInputV
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */



-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title Text:(NSString *)text TextPlaceholder:(NSString *)placeholde{
    if (self = [super initWithFrame:frame]) {
        
        UIView *line = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:ACCustomInputV_LineColor];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ll_WidthFromIphone6(20));
            make.centerX.equalTo(self);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
        self.line = line;
        
        UILabel *titleL = [UILabel ll_LabelWithFrame:CGRectZero Text:title Font:LL_FontFromiPhone6ByeSize(16) TextColor:LL_ColorWithHexStr(@"#2D2D2D") TextAlignment:1 BackGroundColor:nil];
        [self addSubview:titleL];
        [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ll_WidthFromIphone6(20));
            make.top.mas_equalTo(0);
            make.bottom.equalTo(line.mas_top);
            make.width.mas_equalTo([NSString ll_getTheActualWidthOfString:title WithFont:LL_FontFromiPhone6ByeSize(16)]);
        }];
        self.titleL = titleL;
        
        UITextField *inputTextField = [UITextField ll_textFieldWithFrame:CGRectZero Text:text Font:LL_FontFromiPhone6ByeSize(14) TextColor:LL_ColorWithHexStr(@"202020") TextAlignment:0];
        [self addSubview:inputTextField];
        [inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(titleL);
            make.right.mas_equalTo(ll_WidthFromIphone6(-20));
            make.left.equalTo(titleL.mas_right).mas_offset(ll_WidthFromIphone6(15));
        }];
        inputTextField.placeholder = placeholde;
        self.textField = inputTextField;
        inputTextField.delegate = self;
        
        UIImageView *arrowImg = [UIImageView ll_imageViewWithFrame:CGRectZero Image:[DrawImageTool drawRightArrowColor:LL_ColorWithHexStr(@"#A0A0A0")] BackGroundColor:nil];
        [self addSubview:arrowImg];
        [arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ll_WidthFromIphone6(7), ll_WidthFromIphone6(13)));
            make.centerY.equalTo(titleL);
            make.right.mas_equalTo(ll_WidthFromIphone6(-20));
        }];
        arrowImg.hidden = YES;
        self.arrowImg = arrowImg;
        
        self.allowTextFieldEditing = YES;
        
    }
    return self;
}
-(void)setIsShowEyeBtn:(BOOL)isShowEyeBtn{
    if (isShowEyeBtn) {
        UIButton *eyebtn = [UIButton ll_buttonWithFrame:CGRectZero Title:@"" Font:LL_FontFromiPhone6ByeSize(0) TextColot:LL_ColorWithHexStr(@"FFFFFF") BackGroundImageNor:[UIImage imageNamed:@"AC_Eye_close.png"] BackGroundImageSel:[UIImage imageNamed:@"AC_Eye_open.png"] ActionSel:@selector(openOrClodeAct) target:self];
        [self addSubview:eyebtn];
        [eyebtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ll_WidthFromIphone6(18), ll_WidthFromIphone6(8.5)));
            make.centerY.equalTo(self);
            make.right.mas_equalTo(ll_WidthFromIphone6(-39));
        }];
        [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(eyebtn.mas_left).mas_offset(-ll_WidthFromIphone6(5));
            make.top.bottom.equalTo(self.titleL);
            make.left.equalTo(self.titleL.mas_right).mas_offset(ll_WidthFromIphone6(15));
        }];
        self.eyeBtn = eyebtn;
        self.textField.secureTextEntry = self.eyeBtn.selected;
        [self.textField setSecureTextEntry:YES];
    }
}

-(void)openOrClodeAct{
    self.eyeBtn.selected = !self.eyeBtn.selected;
    self.textField.secureTextEntry = !self.eyeBtn.selected;
}


-(void)setIsShowVerifyCodeBtn:(BOOL)isShowVerifyCodeBtn{
    _isShowVerifyCodeBtn = isShowVerifyCodeBtn;
    if (isShowVerifyCodeBtn) {
        UIButton *verifyCodeBtn = [UIButton ll_buttonWithFrame:CGRectZero Title:@"获取验证码" Font:LL_FontFromiPhone6ByeSizeAndWeight(15, UIFontWeightMedium) TextColot:LL_ThemeColor BackGroundImageNor:[UIImage imageNamed:@""] BackGroundImageSel:[UIImage imageNamed:@""] ActionSel:@selector(getVerifyCodelAct) target:self];
        [self addSubview:verifyCodeBtn];
        [verifyCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(ll_WidthFromIphone6(-20));
            make.width.mas_equalTo(ll_WidthFromIphone6(97));
            make.top.bottom.equalTo(self.titleL);
            
        }];
        self.verifyCodeBtn = verifyCodeBtn;
        
        UIView *line2 = [UIView ll_ViewWithFrame:CGRectZero BackGroundColor:LL_ColorWithHexStr(@"e5e5e5")];
        [self addSubview:line2];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(verifyCodeBtn);
            make.right.equalTo(verifyCodeBtn.mas_left);
            make.width.mas_equalTo(1);
            make.bottom.equalTo(self.line.mas_top).mas_offset(ll_WidthFromIphone6(-4.5));
        }];
        [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(line2.mas_left).mas_offset(-ll_WidthFromIphone6(5));
            make.top.bottom.equalTo(self.titleL);
            make.left.equalTo(self.titleL.mas_right).mas_offset(ll_WidthFromIphone6(15));
        }];
        
    }
}

-(void)setIsShowVerificationCodeImg:(BOOL)isShowVerificationCodeImg{
    _isShowVerificationCodeImg = isShowVerificationCodeImg;
    if (isShowVerificationCodeImg) {
        UIButton *verifyCodeImgBtn = [UIButton ll_buttonWithFrame:CGRectZero Title:@"" Font:LL_FontFromiPhone6ByeSize(0) TextColot:LL_ColorWithHexStr(@"000000") BackGroundImageNor:[UIImage imageNamed:@"AC_REFRESH.png"] BackGroundImageSel:[UIImage imageNamed:@""] ActionSel:@selector(refreshVerifyCodeAction) target:self];
        
        [self addSubview:verifyCodeImgBtn];
        [verifyCodeImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.line);
            make.centerY.equalTo(self);
            make.height.equalTo(self.mas_height).multipliedBy(0.7);
            make.width.equalTo(self.mas_height).multipliedBy(1.8);
        }];
        self.verifyCodeImgBtn = verifyCodeImgBtn;
        
        
        [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(verifyCodeImgBtn.mas_left).mas_offset(-ll_WidthFromIphone6(5));
            make.top.bottom.equalTo(self.titleL);
            make.left.equalTo(self.titleL.mas_right).mas_offset(ll_WidthFromIphone6(15));
        }];
    }
}

-(void)setIsShowRightArrowImg:(BOOL)isShowRightArrowImg{
    _isShowRightArrowImg = isShowRightArrowImg;
    self.arrowImg.hidden = !isShowRightArrowImg;
}

-(void)getVerifyCodelAct{
    if (self.getVerifyCodelBlock) {
        self.getVerifyCodelBlock();
    }
}
-(void)refreshVerifyCodeAction{
    if (self.getVerifyCodelBlock) {
        self.getVerifyCodelBlock();
    }
}
-(void)setKeyboardType:(UIKeyboardType)keyboardType{
    self.textField.keyboardType = keyboardType;
}
-(void)setInputType:(CustomInput_Type)inputType{
    _inputType = inputType;
    
    self.textField.delegate = self;
    if (inputType == Input_type_Num) {
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    if (inputType == Input_type_Alpha) {
        self.textField.keyboardType = UIKeyboardTypeAlphabet;
        
    }
    if (inputType == Input_type_NumAndAlpha) {
        self.textField.keyboardType = UIKeyboardTypeDefault;
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    #ifdef LL_ThemeColor
        self.line.backgroundColor = LL_ThemeColor;
    #endif
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
#ifdef LL_ThemeColor
    self.line.backgroundColor = ACCustomInputV_LineColor;
#endif
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    
    if (self.allowTextFieldEditing) {
        NSString *inputStr = nil;
        if (self.inputType == Input_type_Num) {
            inputStr = ACTextInput_NUM;
            NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:inputStr] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            return [string isEqualToString:filtered];
        }else if (self.inputType == Input_type_Alpha) {
            inputStr = ACTextInput_ALPHA;
            NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:inputStr] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            return [string isEqualToString:filtered];
        }else if (self.inputType == Input_type_NumAndAlpha) {
            inputStr = ACTextInput_ALPHANUM;
            NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:inputStr] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            return [string isEqualToString:filtered];
        } else{
            return YES;
        }
    }else{
        return NO;
    }
}


-(void)setAllowTextFieldEditing:(BOOL)allowTextFieldEditing{
    _allowTextFieldEditing = allowTextFieldEditing;
    if (!allowTextFieldEditing) {
        self.textField.userInteractionEnabled = NO;
        self.textField.allowsEditingTextAttributes = NO;
    }
}

/**
 UITextView文本输入
 */
-(instancetype)initWithFrame:(CGRect)frame WithPlaceholder:(NSString *)placeholder WithPlaceholderTextColor:(UIColor *)placeholderTextColor WithTextColor:(UIColor *)textColor WithFont:(UIFont *)font{
    if (self = [super initWithFrame:frame]) {
        UILabel *placeholderL = [UILabel ll_LabelWithFrame:CGRectZero Text:placeholder Font:font TextColor:placeholderTextColor TextAlignment:0 BackGroundColor:nil];
        [self addSubview:placeholderL];
        [placeholderL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_greaterThanOrEqualTo(0);
        }];
        placeholderL.numberOfLines = 0;
        self.placeholderL = placeholderL;


        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.textColor = textColor;
        textView.font = font;
        [self addSubview:textView];
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(placeholderL).mas_offset(-font.pointSize / 2.0);
            make.right.equalTo(placeholderL);
            make.bottom.mas_equalTo(0);
        }];
        textView.backgroundColor = UIColor.clearColor;
        textView.delegate = self;
#ifdef LL_ThemeColor
        textView.tintColor = LL_ThemeColor;
#endif
        
        
        self.textView = textView;
    }
 
    return self;
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    self.placeholderL.hidden = YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    self.placeholderL.hidden = textView.text.length;
    if (self.textViewDidEndEditingBlock) {
        self.textViewDidEndEditingBlock(textView.text);
    }
}
@end
