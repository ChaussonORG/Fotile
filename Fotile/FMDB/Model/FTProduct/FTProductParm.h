//
//  FTProductParm.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/18.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface FTProductParm : NSObject
@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *content;

- (instancetype)initWithJSON:(NSDictionary *)json;
@end


