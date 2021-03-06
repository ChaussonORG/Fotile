//
//  FTImageManager.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTImage.h"
#import "FTGroupImage.h"
@interface FTImageManager : NSObject

typedef void(^FTImageDownloaderProgressBlock)(NSInteger completeCount, NSInteger totalCount);
typedef void(^FTImageDownloaderFailureBlock)();

+ (FTImageManager *)shareInstance;
/*根据最新更新时间下载数据库中所有图片到本地*/
- (void)downloadAllImages:(FTImageDownloaderProgressBlock)progress
             failureBlock:(FTImageDownloaderFailureBlock)failure;

- (BOOL)checkImageIsExisted:(NSString *)url
                   fileName:(NSString *)name;
- (FTImage *)fetchImageWithId:(NSString *)identifier;
- (FTGroupImage *)fetchGroupImageWithId:(NSString *)identifier;
@end
