//
//  FTDataOperation.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/3.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface FTDataOperation : NSObject
@property (strong ,nonatomic) FMDatabase *dataBase;
+ (FTDataOperation *)shareInstance;

@end
