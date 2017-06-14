//
//  FTDataOperation.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/3.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTDataOperation.h"
#define DB_FILE_NAME @"ftdb.db"

@implementation FTDataOperation
+ (FTDataOperation *)shareInstance{
    static FTDataOperation *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FTDataOperation alloc]init];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex:0];
        NSString *path = [docDir stringByAppendingPathComponent:DB_FILE_NAME];
        instance.dataBase = [FMDatabase databaseWithPath:path];
        
    });
    return instance;
}
@end
