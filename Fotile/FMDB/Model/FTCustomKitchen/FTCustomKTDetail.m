//
//  FTCustomKTDetail.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTCustomKTDetail.h"

@implementation FTCustomKTDetail
- (BOOL)hasNight{
    return self.groupImage.night1.identifier.length > 0 && self.groupImage.night2.identifier.length > 0 && self.groupImage.night3.identifier.length > 0;
}
@end
