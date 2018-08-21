//
//  ViewController.m
//  MK_LieAndGe
//
//  Created by tusm on 17/6/8.
//  Copyright © 2017年 tusm. All rights reserved.
//

#import "ViewController.h"
#import "GridListCollectionViewCell.h"
@interface ViewController ()
{
    BOOL _isGrid;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //默認列表試圖
    _isGrid = NO;
    [self setButton];
    [self.view addSubview:self.collectionView];

}
- (void)setButton
{
    _swithBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _swithBtn.frame = CGRectMake(0, 22, self.view.frame.size.width, 50);
    _swithBtn.backgroundColor = [UIColor blueColor];
    [_swithBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_swithBtn addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_swithBtn setTitle:@"方格" forState:UIControlStateNormal];
    [self.view addSubview:_swithBtn];
}
- (void)onBtnClick:(id)sender
{
    _isGrid = !_isGrid;
    [self.collectionView reloadData];
    
    if (_isGrid)
    {
        [self.swithBtn setTitle:@"变列表" forState:UIControlStateNormal];
    } else {
        [self.swithBtn setTitle:@"变方格" forState:UIControlStateNormal];
    }
}
- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        //设置滚动方向
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        //左右间距
        flowlayout.minimumInteritemSpacing = 10;
//        //上下间距
        flowlayout.minimumLineSpacing = 10;
        //區頭高度
        flowlayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 10);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0 , 72, self.view.bounds.size.width, self.view.bounds.size.height - 72) collectionViewLayout:flowlayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        //注册cell
        [_collectionView registerClass:[GridListCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isGrid)
    {
        return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 10) / 2, ([UIScreen mainScreen].bounds.size.width - 6) / 2 + 40);
    } else
    {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.width - 6) / 4 + 20);
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GridListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[GridListCollectionViewCell alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50)];
    }
    cell.isGrid = _isGrid;
    cell.model = nil;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Section===========%ld\nRow=========>%ld",(long)indexPath.section,(long)indexPath.row);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
