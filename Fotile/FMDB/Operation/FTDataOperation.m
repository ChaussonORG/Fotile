//
//  FTDataOperation.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/3.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTDataOperation.h"
#import "FTFileDownloader.h"
#define DB_FILE_NAME @"ftdb.db"

@implementation FTDataOperation
+ (FTDataOperation *)shareInstance{
    static FTDataOperation *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FTDataOperation alloc]init];
        
        instance.dataBase = [FMDatabase databaseWithPath:[self dbPath]];
        
    });
    return instance;
}

- (void)downDataBaseWithUrl:(NSString *)url
                 completion:(FTDownloadDatabase )result{
    
    FTFileDownloader *f = [[FTFileDownloader alloc]initWithUrl:url savedPath:[FTDataOperation dbPath]];
    [f startWithSuccessBlock:^(__kindof CHBaseRequest *request) {
        if (result) {
            self.dataBase = [FMDatabase databaseWithPath:[FTDataOperation dbPath]];
            result(YES);
        }
    } failureBlock:^(__kindof CHBaseRequest *request) {
        if (result) {
            result(NO);
        }
    }];
}
+ (NSString *)dbPath{
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [cachesPath stringByAppendingPathComponent:DB_FILE_NAME];
    return path;
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"ftdb" ofType:@"db"];
//    return  path;
}
@end
