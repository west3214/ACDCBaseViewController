//
//  BaseActionSheetView.h
//  JTProject
//
//  Created by 张西方 on 2018/12/27.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseActionSheetView : UIView
/**<# #>*/
@property (nonatomic, copy) void (^baseSheetBlock_num)(NSInteger numArgument);
@property (nonatomic, copy) void (^baseSheetBlock_Id)(id idArgument);
@property (nonatomic, strong) UIView *contentView;

-(void)show;
-(void)dismiss;




///////////
@end
