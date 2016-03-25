//
//  InfoTableViewCell.m
//  TableViewCellWithXib
//
//  Created by 张健 on 16/3/25.
//  Copyright (c) 2016年 张健. All rights reserved.
//

#import "InfoTableViewCell.h"

#import "UIImage+myImage.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((rgbValue >> 16) & 0xFF)/255.f \
green:((rgbValue >> 8) & 0xFF)/255.f \
blue:(rgbValue & 0xFF)/255.f \
alpha:1.0f]

@implementation InfoTableViewCell

- (void)awakeFromNib {
    
    _spaceView.layer.borderWidth = 0.5;
    _spaceView.layer.borderColor = UIColorFromRGB(0xcccccc).CGColor;
    _spaceView.backgroundColor = UIColorFromRGB(0xefeff4);
}


+ (instancetype)InfoCell
{
    
    return [[NSBundle mainBundle] loadNibNamed:@"InfoTableViewCell" owner:nil options:nil][0];
}

-(void)setInfoStr:(NSString *)infoStr {
    
    _infoStr = infoStr;
    self.infoLabel.text = infoStr;
}

-(void)setTitleStr:(NSString *)titleStr {
    
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}


-(void)setIconStr:(NSString *)iconStr {
    
    _iconStr = iconStr;

    UIImage *image = iconStr.length > 0 ? [UIImage imageNamed:iconStr] : [UIImage new] ;
    
    if (image.size.width > 80) {
        
        image = image.zjSizeToFill;
    }
    
    self.bottomImg.image = image;
   
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];

    CGFloat availableLabelWidth = self.titleLabel.frame.size.width;
    self.titleLabel.preferredMaxLayoutWidth = availableLabelWidth;

    CGFloat availableLabelWidth1 = self.infoLabel.frame.size.width;
    self.infoLabel.preferredMaxLayoutWidth = availableLabelWidth1;

}


-(void)setModel:(InfoCellModel *)model {
    
    self.titleStr = model.titleString;
    self.infoStr  = model.infoString;
    self.iconStr  = model.imageString;
    
    _muString = [[NSMutableAttributedString alloc]initWithString:model.priceString];
    
    [_muString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(model.priceString.length - 6, 6)];
    
    self.priceLabel.attributedText = _muString;
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
