//
//  FTCustomKCService.m
//  FoliteDB
//
//  Created by Chausson on 2017/6/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "FTCustomKCService.h"
#import "FTDataOperation.h"
#import "FTImageManager.h"
#import "FTProduct.h"
@implementation FTCustomKCService
+ (NSArray<FTCustomKitchen *> *)fetchCustomKitchenList{
    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    [db open];
    FMResultSet *rs = [db executeQuery:@"select * from t_virtual_kitchen"];
    NSMutableArray <FTCustomKitchen *>*list = [NSMutableArray array];
    while ([rs next]) {
        FTCustomKitchen *customKT = [[FTCustomKitchen alloc]init];
        customKT.identifier =  [rs stringForColumn:@"id"];
        customKT.createTime = [rs stringForColumn:@"create_time"];
        customKT.updateTime = [rs stringForColumn:@"update_time"];
        customKT.name = [rs stringForColumn:@"name"];
        customKT.tag1 = [rs stringForColumn:@"tag1"];
        customKT.tag2 = [rs stringForColumn:@"tag2"];
        customKT.groupImageId = [rs stringForColumn:@"image_group_id"];
        customKT.thumbnailImageId = [rs stringForColumn:@"thumbnail_file_id"];
        customKT.image = [[FTImageManager shareInstance] fetchImageWithId:customKT.thumbnailImageId];
        [list addObject:customKT];
    }
    [db close];
    return [list copy];
}
+ (FTCustomKTDetail *)fetchCustomDetailWithId:(NSString *)identifer{
    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    BOOL isOpen = [db goodConnection];
    if (!isOpen) {
        [db open];
    }
    NSString *sql = [NSString stringWithFormat:@"select * from t_virtual_kitchen where id= '%@'",identifer];
    FMResultSet *rs = [db executeQuery:sql];
    FTCustomKitchen *customKT = [[FTCustomKitchen alloc]init];

    while ([rs next]) {
        customKT.identifier =  [rs stringForColumn:@"id"];
        customKT.createTime = [rs stringForColumn:@"create_time"];
        customKT.updateTime = [rs stringForColumn:@"update_time"];
        customKT.name = [rs stringForColumn:@"name"];
        customKT.tag1 = [rs stringForColumn:@"tag1"];
        customKT.tag2 = [rs stringForColumn:@"tag2"];
        customKT.groupImageId = [rs stringForColumn:@"image_group_id"];
        customKT.thumbnailImageId = [rs stringForColumn:@"thumbnail_file_id"];
    }
    if (!isOpen) {
        [db close];
    }
    customKT.image = [[FTImageManager shareInstance] fetchImageWithId:customKT.thumbnailImageId];
    return [self fetchCustomDetail:customKT];

}
+ (FTCustomKTDetail *)fetchCustomDetail:(FTCustomKitchen *)custom{
    FTCustomKTDetail *detail = [[FTCustomKTDetail alloc]init];
    FTImageManager *manager = [FTImageManager shareInstance];
    FMDatabase *db = [[FTDataOperation shareInstance] dataBase];
    BOOL isOpen = [db goodConnection];
    if (!isOpen) {
        [db open];
    }
    NSMutableArray <FTMaterial *>*materials = [NSMutableArray array];
    NSString *materialSql = [NSString stringWithFormat:@"select * from t_virtual_kitchen_material where kitchen_id= '%@'",custom.identifier];

    FMResultSet *material = [db executeQuery:materialSql];
    while ([material next]) {
        FTMaterial *materialObj = [[FTMaterial alloc]init];
        materialObj.identifier =  [material stringForColumn:@"id"];
        materialObj.createTime =  [material stringForColumn:@"create_time"];
        materialObj.updateTime =  [material stringForColumn:@"update_time"];
        materialObj.name =  [material stringForColumn:@"name"];
        materialObj.groupImage = [manager fetchGroupImageWithId:[material stringForColumn:@"image_group_id"]];
        materialObj.thumbnailImage= [manager fetchImageWithId:[material stringForColumn:@"thumbnail_file_id"]];
        [materials addObject:materialObj];
    }
    NSMutableArray <FTProduct *>*products = [NSMutableArray array];
    NSString *productSql = [NSString stringWithFormat:@"select * from t_virtual_kitchen_product where kitchen_id= '%@'",custom.identifier];
    FMResultSet *productRs = [db executeQuery:productSql];
    while ([productRs next]) {
        FTProduct *product = [[FTProduct alloc]init];
        product.identifier = [productRs stringForColumn:@"product_id"];
        NSString *productDetailSql = [NSString stringWithFormat:@"select * from t_product where id= '%@'",product.identifier];
        FMResultSet *productDetail = [db executeQuery:productDetailSql];
        while ([productDetail next]) {
            product.identifier =  [productDetail stringForColumn:@"id"];
            product.createTime =  [productDetail stringForColumn:@"create_time"];
            product.updateTime =  [productDetail stringForColumn:@"update_time"];
            product.name =  [productDetail stringForColumn:@"name"];
            product.modelNumber =  [productDetail stringForColumn:@"model_no"];
            product.slogan =  [productDetail stringForColumn:@"slogan"];
            product.catalogType =  [productDetail intForColumn:@"catalog_id"];
            product.groupImage = [manager fetchGroupImageWithId:[productDetail stringForColumn:@"image_group_id"]];

        }
        [products addObject:product];
    }
    
    detail.materials = [materials copy];
    detail.products = [products copy];
    detail.groupImage = [manager fetchGroupImageWithId:custom.groupImageId];
    if (!isOpen) {
        [db close];
    }
    return detail;
}
@end
