//
//  MEDownwardCell.m
//  JDMEForIphone
//
//  Created by 王方帅 on 16/9/30.
//  Copyright © 2016年 jd.com. All rights reserved.
//

#import "MEDownwardCell.h"

@implementation MEDownwardCell

-(UIView *)lineViewWithY:(CGFloat)y withIsDeepColor:(BOOL)isDeepColor
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, 1)];
    if (isDeepColor)
    {
        view.backgroundColor = UIColorFromRGB(0xe1e1e1);
    }
    else
    {
        view.backgroundColor = UIColorFromRGB(0xeeeeee);
    }
    
    return view;
}

- (void)setRightL:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self addSubview:[self lineViewWithY:49 withIsDeepColor:NO]];
    CGRect frame = _selectImageView.frame;
    frame.size.width = SCREENWIDTH - 20;
    _selectImageView.frame = frame;
}

-(void)setTitle:(NSString *)title withIsSelected:(BOOL)isSelected
{
    _titleLabel.text = title;
    if (isSelected)
    {
        _titleLabel.textColor = UIColorFromRGB(0xf23030);
        _selectImageView.hidden = NO;
    }
    else
    {
        _titleLabel.textColor = UIColorFromRGB(0x2e2e2e);
        _selectImageView.hidden = YES;
    }
}

@end
