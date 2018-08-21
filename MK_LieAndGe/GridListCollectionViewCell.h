//
//  GridListCollectionViewCell.h
//  MK_LieAndGe
//
//  Created by tusm on 17/6/8.
//  Copyright © 2017年 tusm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridListCollectionViewCell : UICollectionViewCell
@property (nonatomic, assign) BOOL isGrid;
@property (nonatomic, strong) NSDictionary *model;
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@end
