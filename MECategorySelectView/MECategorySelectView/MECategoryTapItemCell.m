//
//  MECategoryTapItemCell.m
//  JDMEForIphone
//
//  Created by 王方帅 on 16/9/30.
//  Copyright © 2016年 jd.com. All rights reserved.
//

#import "MECategoryTapItemCell.h"
#import "MECategorySelectView.h"

@implementation MECategoryTapItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _nameLabel.leftL = (frame.size.width-_nameLabel.widthL-_arrowImageView.widthL)/2;
    
    _arrowImageView.leftL = _nameLabel.rightL+3;
}

-(void)setName:(NSString *)name withLimitWidth:(CGFloat)limitWidth
{
    limitWidth -= _arrowImageView.widthL;
    if (_name != name)
    {
        _name = name;
        _nameLabel.text = name;
        [_nameLabel reloadSingleRowWidthForContent];
        if (_nameLabel.widthL > limitWidth)
        {
            _nameLabel.widthL = limitWidth;
        }
    }
}

-(void)setIsDownward:(BOOL)isDownward
{
    if (_isDownward != isDownward)
    {
        _isDownward = isDownward;
        
        if (isDownward)
        {
            _nameLabel.textColor = kColor_RedFont;
            _arrowImageView.image = [UIImage imageNamed:@"myApply_upArrow"];
        }
        else
        {
            _nameLabel.textColor = kColor_TitleFont;
            _arrowImageView.image = [UIImage imageNamed:@"myApply_downArrow"];
        }
    }
}


@end
