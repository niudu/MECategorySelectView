//
//  MECategorySelectView.h
//  JDMEForIphone
//
//  Created by 王方帅 on 16/9/30.
//  Copyright © 2016年 jd.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MECategoryModel.h"

#define kColor_RedFont              UIColorFromRGB(0xf23030)
#define kColor_TitleFont            UIColorFromRGB(0x2e2e2e)

@interface UILabel (Add1111)

-(void)reloadSingleRowWidthForContent;

@end

@interface NSArray (CheckCrossAndNotNSNull11111222)
/*!
 @method objectAtIndexCheck:
 @abstract 检查是否越界 如果是返回nil
 @result 返回对象
 */
- (id)objectAtIndexCheckCross:(NSUInteger)index;


/*!
 @method objectAtIndexCheck:
 @abstract 检查是否越界和NSNull 如果是返回nil
 @result 返回对象
 */
- (id)objectAtIndexCheckCrossAndNotNSNull:(NSUInteger)index;
@end

@interface UIView (Adddddd)

@property(nonatomic) CGFloat leftL;
@property(nonatomic) CGFloat topL;
@property(nonatomic) CGFloat rightL;
@property(nonatomic) CGFloat bottomL;

@property(nonatomic) CGFloat widthL;
@property(nonatomic) CGFloat heightL;

@end

typedef void(^MECategorySelectCallbackBlock)(NSArray *nameArray,NSArray *idArray);

@interface MECategorySelectView : UIView<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView    *_categoryCollectionView;
    UITableView         *_downwardTableView;
    UIView              *_bgView;
}

@property (nonatomic,strong) NSArray *categoryArray;
@property (nonatomic) NSInteger  currentDownwardIndex;
@property (nonatomic,strong) NSMutableArray *currentSelectTitleArray;
@property (nonatomic,strong) NSMutableArray *currentSelectIDArray;
@property (nonatomic,copy) MECategorySelectCallbackBlock callback;

//categoryArray中的是MECategoryModel类型
+(MECategorySelectView *)selectViewWithCategoryArray:(NSArray *)categoryArray withCallback:(MECategorySelectCallbackBlock)callback;

@end
