//
//  MECategoryTapItemCell.h
//  JDMEForIphone
//
//  Created by 王方帅 on 16/9/30.
//  Copyright © 2016年 jd.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MECategoryModel.h"

@interface MECategoryTapItemCell : UICollectionViewCell
{
    __weak IBOutlet UILabel *_nameLabel;
    __weak IBOutlet UIImageView *_arrowImageView;
}

@property (nonatomic,strong) NSString   *name;
@property (nonatomic) BOOL   isDownward;

-(void)setName:(NSString *)name withLimitWidth:(CGFloat)limitWidth;

@end
