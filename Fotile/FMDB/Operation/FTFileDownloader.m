//
//  FTFileDownloader.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/18.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTFileDownloader.h"

@implementation FTFileDownloader
- (instancetype)initWithUrl:(NSString *)url
                  savedPath:(NSString *)path{
    
    self = [super init];
    if (self) {
        _url = url;
        _path = path;
    }
    return self;
}
- (NSString *)customUrl{
    return _url;
}

- (NSURL *)specificDownloadPath{
    
    return [NSURL fileURLWithPath:_path];
}
- (CHRequestMethod)requestMethod{
    return CHRequestMethodGet;
}
/// 请求的SerializerType
- (CHRequestSerializerType)requestSerializerType{
    return CHRequestSerializerPlainText;
}
/// 请求的ResponseType
- (CHRequestResponseType)requestResponseType{
    return CHRequestResponseTypeData;
}
@end
