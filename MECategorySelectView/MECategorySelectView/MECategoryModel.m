//
//  MECategoryModel.m
//  JDMEForIphone
//
//  Created by 王方帅 on 16/9/30.
//  Copyright © 2016年 jd.com. All rights reserved.
//

#import "MECategoryModel.h"

@implementation MECategoryModel

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

+(NSArray *)categoryModelArrayWithNameArray:(NSArray *)nameArray withIDArray:(NSArray *)idArray
{
    NSMutableArray *modelArray = [NSMutableArray array];
    for (int i = 0; i < nameArray.count; i++)
    {
        MECategoryModel *model = [[MECategoryModel alloc] init];
        model.currentSelectedIndex = 0;
        model.itemStrArray = nameArray[i];
        model.itemIDArray = idArray[i];
        [modelArray addObject:model];
    }
    return modelArray;
}

@end
