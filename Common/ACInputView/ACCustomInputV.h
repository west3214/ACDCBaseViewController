//
//  ACCustomInputV.h
//  ACP3
//
//  Created by 张西方 on 2019/1/3.
//  Copyright © 2019年 west3214. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ACTextInput_NUM @"0123456789"//只输入数字
#define ACTextInput_ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"//只输入字母
#define ACTextInput_ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"//数字和字母




typedef enum : NSUInteger {
    Input_type_Num = 1,
    Input_type_Alpha,
    Input_type_NumAndAlpha
} CustomInput_Type;


@interface ACCustomInputV : UIView<UITextFieldDelegate>
/**<# #>*/
@property (nonatomic, strong) UILabel *titleL;
/**<# #>*/
@property (nonatomic, strong) UIView *line;
/**<# #>*/
@property (nonatomic, strong) UITextField *textField;
/**<# #>*/
@property (nonatomic, assign) BOOL allowTextFieldEditing;
/**<# #>*/
@property (nonatomic, assign) UIKeyboardType keyboardType;

/**<# #>*/
@property (nonatomic, assign) CustomInput_Type inputType;
/**<# #>*/
@property (nonatomic, strong) UIButton *eyeBtn;
/**<# #>*/
@property (nonatomic, strong) UIButton *verifyCodeBtn;
/**<# #>*/
@property (nonatomic, strong) UIImageView *arrowImg;

/**/
@property (nonatomic, assign) BOOL isShowEyeBtn;
/**<# #>*/
@property (nonatomic, assign) BOOL isShowVerifyCodeBtn;
/**<# #>*/
@property (nonatomic, assign) BOOL isShowRightArrowImg;
/**<# #>*/
@property (nonatomic, assign) BOOL isShowVerificationCodeImg;
@property (nonatomic, strong) UIButton *verifyCodeImgBtn;

/**<# #>*/
@property (nonatomic, copy) void(^getVerifyCodelBlock)(void);
-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title Text:(NSString *)text TextPlaceholder:(NSString *)placeholde;



/**
 UITextView文本输入
 */
-(instancetype)initWithFrame:(CGRect)frame
             WithPlaceholder:(NSString *)placeholder
    WithPlaceholderTextColor:(UIColor *)placeholderTextColor
               WithTextColor:(UIColor *)textColor
                    WithFont:(UIFont *)font;
/**<# #>*/
@property (nonatomic, strong) UILabel *placeholderL;
/**<# #>*/
@property (nonatomic, strong) UITextView *textView;
/**<# #>*/
@property (nonatomic, copy) void (^textViewDidEndEditingBlock)(NSString * text);
@end
