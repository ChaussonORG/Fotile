//
//  FTImageManager.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTImageManager.h"
#import "FTDataOperation.h"
#import "FTImageDownloader.h"
#import <FMDB/FMDB.h>

@implementation FTImageManager{
    NSMutableArray <FTImage *>* _images;
    FTImageDownloaderProgressBlock _progress;
    FTImageDownloaderFailureBlock _failure;
    NSInteger _totalDownloadImages;
}

+ (FTImageManager *)shareInstance{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FTImageManager alloc]init];
        
    });
    return instance;
}

- (void)downloadAllImages:(FTImageDownloaderProgressBlock)progress
             failureBlock:(FTImageDownloaderFailureBlock)failure{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM t_image_file"];
    FMDatabase  *db = [self openDB];
    FMResultSet *rs = [db executeQuery:sql];
    _images = [NSMutableArray array];
    while ([rs next]) {
        FTImage *image = [self fetchImageWithId:[rs stringForColumn:@"id"]];


        [_images addObject:image];
    }
    [self closeDB];
    _totalDownloadImages = _images.count;
    _progress = progress;
    _failure = failure;
    [self startDownload];
 
}
- (void)startDownload{
    if (_images.count > 0) {
        FTImage *image = _images.firstObject;
        BOOL isExist =[self checkImageIsExisted:image.url fileName:image.identifier];
        if (isExist) {
            [self->_images removeObject:image];
            if (self->_progress) {
                NSInteger total = self->_totalDownloadImages;
                self->_progress(total-self->_images.count,total);
                
            }
            [self startDownload];

        }else{
            FTImageDownloader *load = [[FTImageDownloader alloc]initWithUrl:image.url fileName:image.identifier];
            [load startWithSuccessBlock:^(__kindof FTImageDownloader *request) {
                [self->_images removeObject:image];
                if (self->_progress) {
                    NSInteger total = self->_totalDownloadImages;
                    self->_progress(total-self->_images.count,total);
                    
                }
                [self startDownload];
            } failureBlock:^(__kindof CHBaseRequest *request) {
                if (self->_failure) {
                    self->_failure();
                }
            }];
        }
  
    }
}
- (FTImage *)fetchImageWithId:(NSString *)identifier{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM t_image_file where id= '%@'",identifier];
    FMDatabase  *db = [self openDB];

    FMResultSet *rs = [db executeQuery:sql];
    FTImage *image = [[FTImage alloc]init];
    while ([rs next]) {
        image.url = [rs stringForColumn:@"url"];
        image.createTime = [rs stringForColumn:@"create_time"];
        image.updateTime = [rs stringForColumn:@"update_time"];
        image.fileName = [rs stringForColumn:@"file_name"];
        image.size = [rs intForColumn:@"size"];
        image.identifier =  [rs stringForColumn:@"id"];
    }
    [self closeDB];
    return image;
}
- (FTGroupImage *)fetchGroupImageWithId:(NSString *)identifier{
    FTGroupImage *groupImage = [[FTGroupImage alloc]init];
    groupImage.identifier = identifier;
    FMDatabase *db = [self openDB];
  
  
    NSString *groupSql = [NSString stringWithFormat:@"select * from t_image_group where id= '%@'",identifier];
    
    FMResultSet *group = [db executeQuery:groupSql];
    while ([group next]) {
        groupImage.createTime = [group stringForColumn:@"create_time"];
        groupImage.updateTime = [group stringForColumn:@"update_time"];
        groupImage.day1 = [self fetchImageWithId:[group stringForColumn:@"image_day1id"]];
        groupImage.day2 = [self fetchImageWithId:[group stringForColumn:@"image_day2id"]];
        groupImage.day3 = [self fetchImageWithId:[group stringForColumn:@"image_day3id"]];
        groupImage.night1 = [self fetchImageWithId:[group stringForColumn:@"image_night1id"]];
        groupImage.night2 = [self fetchImageWithId:[group stringForColumn:@"image_night2id"]];
        groupImage.night3 = [self fetchImageWithId:[group stringForColumn:@"image_night3id"]];
    }

    [self closeDB];
    return groupImage;
}
- (BOOL)checkImageIsExisted:(NSString *)url
                   fileName:(NSString *)name{
    // 要检查的文件目录
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *suffix = [url pathExtension];
    
    NSString *path = [cachesPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",name,suffix]];
    NSFileManager *fileManager = [NSFileManager defaultManager];

    return [fileManager fileExistsAtPath:path];
}
#pragma mark 打开数据库
- (FMDatabase *)openDB{
    FMDatabase  *db = [FTDataOperation shareInstance].dataBase;
    BOOL isOpen = [db goodConnection];
    if (!isOpen) {
        [db open];
        
    }
    return db;
}
- (void)closeDB{
    FMDatabase  *db = [FTDataOperation shareInstance].dataBase;
    BOOL isOpen = [db goodConnection];
    if (!isOpen) {
        [db close];
    }
}
@end
