//
//  FTProductHL.h
//  Fotile
//
//  Created by Chausson on 2017/6/25.
//  Copyright © 2017年 Gjt. All rights reserved.
//

#import "FTObject.h"
#import "FTImage.h"

@interface FTProductHL : FTObject
@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *desc;
@property (nonatomic ,strong) FTImage *image;
@end
