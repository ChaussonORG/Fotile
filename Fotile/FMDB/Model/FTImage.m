//
//  FTImage.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTImage.h"

@implementation FTImage
+ (FTImage *)test{
    FTImage *image = [FTImage new];
    image.identifier = @"ff8081815c6d0f31015c6da68aa00001";
    image.url = @"http://tomcat.ngrok.curvesoft.net/upload/20170527/1495888716196.jpg";
 
    return image;
}
- (UIImage *)picture{
    if (_picture) {
        return _picture;
    }
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *suffix = [self.url pathExtension];
    
    NSString *path = [cachesPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",self.identifier,suffix]];
    UIImage *pic = [UIImage imageWithContentsOfFile:path];
    _picture = pic;
    return _picture;
}
@end
