//
//  FTImageDownloader
//  FoliteDB
//
//  Created by Chausson on 2017/6/12.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "CHNetworking.h"

@interface FTImageDownloader : CHNetRequest
@property (readonly ,nonatomic) NSString *url;
@property (readonly ,nonatomic) NSString *fileName;

/*将图片id作为文件名保存*/
- (instancetype)initWithUrl:(NSString *)url
                   fileName:(NSString *)name;

@end
