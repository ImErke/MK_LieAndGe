//
//  ViewController.h
//  MK_LieAndGe
//
//  Created by tusm on 17/6/8.
//  Copyright © 2017年 tusm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UIButton *swithBtn;
@end

