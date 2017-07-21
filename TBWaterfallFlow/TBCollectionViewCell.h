//
//  TBCollectionViewCell.h
//  TBWaterfallFlow
//
//  Created by VanJay on 16/1/25.
//  Copyright © 2016年 VanJay. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;
@interface TBCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImg;
@property (weak, nonatomic) IBOutlet UILabel *priceLa;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomHeight;


-(void)setCellData:(DataModel *)dataModel;
@end
