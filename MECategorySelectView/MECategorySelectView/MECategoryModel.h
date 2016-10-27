//
//  MECategoryModel.h
//  JDMEForIphone
//
//  Created by 王方帅 on 16/9/30.
//  Copyright © 2016年 jd.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width

#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface MECategoryModel : NSObject

@property (nonatomic) NSInteger currentSelectedIndex;
@property (nonatomic,strong) NSArray  *itemStrArray;
@property (nonatomic,strong) NSArray  *itemIDArray;

+(NSArray *)categoryModelArrayWithNameArray:(NSArray *)nameArray withIDArray:(NSArray *)idArray;

@end
