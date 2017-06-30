//
//  FTProduct.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTProduct.h"
#import "FTProductParm.h"
@implementation FTProduct
- (NSArray<FTProductParm *> *)parms{
    if (_parameters) {
        NSArray *array = [self dictionaryWithJsonString:_parameters];
        NSMutableArray *list = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            FTProductParm *parm = [[FTProductParm alloc]initWithJSON:dic];
            [list addObject:parm];
        }

        return [list copy];
    }
    return nil;
}
- (void)setColor:(NSString *)color{
    _color = [NSString stringWithFormat:@"#%@",color];
}
- (NSArray *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return array;
}
@end
