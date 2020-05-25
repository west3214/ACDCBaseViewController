//
//  ACBaseTableViewCell.m
//  ACPNew
//
//  Created by west3214 on 2019/12/12.
//  Copyright © 2019 west3214. All rights reserved.
//

#import "ACBaseTableViewCell.h"

@implementation ACBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = LL_ColorWithHexStr(@"FFFFFF");
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
@end
