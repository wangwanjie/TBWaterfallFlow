//
//  ViewController.m
//  TBWaterfallFlow
//
//  Created by VanJay on 16/1/22.
//  Copyright © 2016年 VanJay. All rights reserved.
//

#import "ViewController.h"
#import "TBCollectionReusableView.h"
#import "TBCollectionViewCell.h"
#import "TBWaterfallFlowLayout.h"
#import "TBViewModel.h"
#import "DataModel.h"

#define CELLBOTTOMHEIGHT 30;//item底部的高度

@interface ViewController ()<TBWaterfallFlowLayoutDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *TBCollectionView;
@property (strong, nonatomic) TBViewModel *viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configCollectionView];
    
    self.viewModel = [[TBViewModel alloc] init];
    [self.viewModel getData];
    
    [self.TBCollectionView reloadData];
}

- (void)configCollectionView {
    TBWaterfallFlowLayout *waterfallFlowLayout = [[TBWaterfallFlowLayout alloc] init];
    waterfallFlowLayout.itemSpacing = 10;//间距
    waterfallFlowLayout.lineSpacing = 10;//间距
    waterfallFlowLayout.colCount = 3;//控制列数
    waterfallFlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);//视图边界
    waterfallFlowLayout.delegate = self;
    self.TBCollectionView.collectionViewLayout = waterfallFlowLayout;
    self.TBCollectionView.dataSource = self;
    self.TBCollectionView.delegate = self;
    [self.TBCollectionView registerNib:[UINib nibWithNibName:@"TBCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"TBCollectionViewCell"];
    [self.TBCollectionView registerNib:[UINib nibWithNibName:@"TBCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeader"];
    [self.TBCollectionView registerNib:[UINib nibWithNibName:@"TBCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"sectionFooter"];
}

#pragma mark UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.viewModel.dataArray.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.viewModel.dataArray[section] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TBCollectionViewCell" forIndexPath:indexPath];
    cell.bottomHeight.constant = CELLBOTTOMHEIGHT;
    [cell setCellData:self.viewModel.dataArray[indexPath.section][indexPath.item]];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        TBCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeader" forIndexPath:indexPath];
        headerView.titleLa.text = [NSString stringWithFormat:@"header%@", self.viewModel.nameArray[indexPath.section]];
        return headerView;
    }
    else {
        TBCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"sectionFooter" forIndexPath:indexPath];
        footerView.titleLa.text = [NSString stringWithFormat:@"footer%@", self.viewModel.nameArray[indexPath.section]];
        return footerView;
    }
}

#pragma mark UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //在这里编写点击事件
    NSLog(@"%zi--%zi", indexPath.section, indexPath.item);
}


#pragma mark TBWaterfallFlowLayoutDelegate
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(TBWaterfallFlowLayout *)collectionViewLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath
{
    DataModel *model = self.viewModel.dataArray[indexPath.section][indexPath.item];
    return model.h/model.w * width + CELLBOTTOMHEIGHT;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(TBWaterfallFlowLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.frame.size.width - 20, 20);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(TBWaterfallFlowLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(self.view.frame.size.width - 20, 20);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
