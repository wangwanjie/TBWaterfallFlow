//
//  TBCollectionViewCell.m
//  TBWaterfallFlow
//
//  Created by VanJay on 16/1/25.
//  Copyright © 2016年 VanJay. All rights reserved.
//

#import "TBCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "DataModel.h"
@implementation TBCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setCellData:(DataModel *)dataModel
{
    [self.cellImg sd_setImageWithURL:[NSURL URLWithString:dataModel.img]];
    self.priceLa.text = dataModel.price;
}

@end
