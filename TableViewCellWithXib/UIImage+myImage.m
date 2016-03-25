
//
//  UIImage+myImage.m
//  TableViewCellWithXib
//
//  Created by 张健 on 16/3/25.
//  Copyright (c) 2016年 张健. All rights reserved.
//

#import "UIImage+myImage.h"

@implementation UIImage (myImage)

-(UIImage *)zjSizeToFill {
    
    UIGraphicsBeginImageContext(CGSizeMake(93, 93));

    [self drawInRect:CGRectMake(0, 0, 93, 93)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
