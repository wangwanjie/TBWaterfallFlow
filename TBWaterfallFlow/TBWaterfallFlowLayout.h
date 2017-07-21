//
//  TBWaterfallFlowLayout.h
//  TBWaterfallFlow
//
//  Created by VanJay on 16/1/26.
//  Copyright © 2016年 VanJay. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TBWaterfallFlowLayoutDelegate;
@interface TBWaterfallFlowLayout : UICollectionViewLayout
@property (nonatomic, assign) UIEdgeInsets sectionInset;
@property (nonatomic, assign) CGFloat lineSpacing;
@property (nonatomic, assign) CGFloat itemSpacing;
@property (nonatomic, assign) CGFloat colCount;
@property (nonatomic, weak) id<TBWaterfallFlowLayoutDelegate>delegate;
@end

@protocol TBWaterfallFlowLayoutDelegate <NSObject>

@required
//item heigh
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(TBWaterfallFlowLayout*)collectionViewLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPath;

@optional
//section header
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(TBWaterfallFlowLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
//section footer
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(TBWaterfallFlowLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

@end
