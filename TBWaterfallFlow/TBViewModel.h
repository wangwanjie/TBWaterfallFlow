//
//  TBViewModel.h
//  TBWaterfallFlow
//
//  Created by VanJay on 16/1/25.
//  Copyright © 2016年 VanJay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBViewModel : NSObject
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *nameArray;
- (void)getData;
@end
