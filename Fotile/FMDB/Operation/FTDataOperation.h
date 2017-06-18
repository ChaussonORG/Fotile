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
typedef void(^FTDownloadDatabase)(BOOL isSusscess);
@property (strong ,nonatomic) FMDatabase *dataBase;
+ (NSString *)dbPath;
+ (FTDataOperation *)shareInstance;
- (void)downDataBaseWithUrl:(NSString *)url
                 completion:(FTDownloadDatabase )result;
@end
