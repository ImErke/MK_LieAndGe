//
//  GridListCollectionViewCell.m
//  MK_LieAndGe
//
//  Created by tusm on 17/6/8.
//  Copyright © 2017年 tusm. All rights reserved.
//hahaha

#import "GridListCollectionViewCell.h"

@implementation GridListCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureUI];
    }
    return self;
}
- (void)configureUI
{
    self.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    _imageV = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imageV.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_imageV];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.contentView addSubview:_titleLabel];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    _priceLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_priceLabel];
}
- (void)setIsGrid:(BOOL)isGrid
{
    _isGrid = isGrid;
    
    if (isGrid)
    {
        NSLog(@"这是方格");
        _imageV.frame = CGRectMake(5, 5, self.bounds.size.width - 10, self.bounds.size.height - 60);
        _titleLabel.frame = CGRectMake(5, self.bounds.size.height - 55, self.bounds.size.width-10, 35);
        _priceLabel.frame = CGRectMake(5, self.bounds.size.height -20,self.bounds.size.width-10, 20);
    } else {
        NSLog(@"这是列表");
        _imageV.frame = CGRectMake(5, 5, self.bounds.size.height - 10, self.bounds.size.height - 10);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.frame = CGRectMake(_imageV.frame.origin.x+_imageV.frame.size.width+10, 0,self.bounds.size.width-(_imageV.frame.origin.x+_imageV.frame.size.width+10)-10, self.bounds.size.height - 30);
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.frame = CGRectMake( _titleLabel.frame.origin.x, _titleLabel.frame.origin.y+_titleLabel.frame.size.height, _titleLabel.frame.size.width, 20);;
    }
}
- (void)setModel:(NSDictionary *)model
{
    //_model = model;
    _imageV.image = [UIImage imageNamed:@"baibai.jpg"];
    _titleLabel.text = @"你的發表卡吉巴基看吧阿里舉辦";
    _priceLabel.text = @"123123";
}
@end
