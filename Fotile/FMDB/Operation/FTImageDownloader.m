//
//  FTImageDownloader
//  FoliteDB
//
//  Created by Chausson on 2017/6/12.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTImageDownloader.h"

@implementation FTImageDownloader
- (instancetype)initWithUrl:(NSString *)url
                   fileName:(NSString *)name{
    self = [super init];
    if (self) {
        _url = url;
        _fileName = name;
    }
    return self;
}
- (NSString *)customUrl{
    return _url;
}
- (NSURL *)specificDownloadPath{
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *suffix = [_url pathExtension];
    
    NSString *path = [cachesPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",_fileName,suffix]];
    return [NSURL fileURLWithPath:path];
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
