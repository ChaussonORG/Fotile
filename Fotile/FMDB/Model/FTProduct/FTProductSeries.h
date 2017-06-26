//
//  FTProductSeries.h
//  Fotile
//
//  Created by Chausson on 2017/6/25.
//  Copyright © 2017年 Gjt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTImage.h"
#import "FTProduct.h"

@interface FTProductSeries : NSObject
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *packageId;

@property (nonatomic ,strong) NSArray <FTProduct *>*products;
@property (nonatomic ,strong) FTImage *image;
@end
