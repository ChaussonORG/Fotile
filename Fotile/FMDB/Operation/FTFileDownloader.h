//
//  FTFileDownloader.h
//  FoliteDB
//
//  Created by Chausson on 2017/6/18.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "CHNetworking.h"

@interface FTFileDownloader : CHNetRequest
@property (readonly ,nonatomic) NSString *url;
@property (readonly ,nonatomic) NSString *path;

- (instancetype)initWithUrl:(NSString *)url
                  savedPath:(NSString *)path;
@end
