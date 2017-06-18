//
//  FTProductParm.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/18.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTProductParm.h"

@implementation FTProductParm
- (instancetype)initWithJSON:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        if (json[@"title"]) {
            _title = json[@"title"];
        }
        if (json[@"content"]) {
            _content = json[@"content"];
        }
    }
    return self;
}
@end

