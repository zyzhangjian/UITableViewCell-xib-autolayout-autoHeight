//
//  InfoTableViewCell.h
//  TableViewCellWithXib
//
//  Created by 张健 on 16/3/25.
//  Copyright (c) 2016年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InfoCellModel.h"

@interface InfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImg;
@property (weak, nonatomic) IBOutlet UIView *spaceView;

@property (nonatomic, copy ) NSString                  *titleStr;
@property (nonatomic, copy ) NSString                  *infoStr;
@property (nonatomic, copy ) NSString                  *iconStr;
@property (nonatomic,strong) NSMutableAttributedString * muString;
@property (nonatomic, copy ) InfoCellModel *model;

+ (instancetype)InfoCell;

-(void)setModel:(InfoCellModel *)model;
@end
