//
//  DataModel.h
//  TBWaterfallFlow
//
//  Created by VanJay on 16/1/25.
//  Copyright © 2016年 VanJay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DataModel : NSObject
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;
@end
