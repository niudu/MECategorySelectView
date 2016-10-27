//
//  MEDownwardCell.h
//  JDMEForIphone
//
//  Created by 王方帅 on 16/9/30.
//  Copyright © 2016年 jd.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MECategoryModel.h"

@interface MEDownwardCell : UITableViewCell
{
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UIImageView *_selectImageView;
}

-(void)setTitle:(NSString *)title withIsSelected:(BOOL)isSelected;

@end
