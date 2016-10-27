//
//  MECategorySelectView.m
//  JDMEForIphone
//
//  Created by 王方帅 on 16/9/30.
//  Copyright © 2016年 jd.com. All rights reserved.
//

#import "MECategorySelectView.h"
#import "MECategoryTapItemCell.h"
#import "MEDownwardCell.h"
#import "MECategoryModel.h"

@implementation UILabel (Add1111)

-(void)reloadSingleRowWidthForContent
{
    {
        NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil];
        CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.heightL)
                                              options:(NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading)
                                           attributes:tdic
                                              context:nil].size;
        self.widthL = size.width;
    }
}

@end

@implementation NSArray (CheckCrossAndNotNSNull11111222)
- (id)objectAtIndexCheckCross:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    
    id value = [self objectAtIndex:index];
    
    return value;
}
- (id)objectAtIndexCheckCrossAndNotNSNull:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}
@end

@implementation UIView (Adddddd)

-(CGFloat)widthL{
    return self.frame.size.width;;
}
-(void)setWidthL:(CGFloat)widthL{
    CGRect frame = self.frame;
    frame.size.width = widthL;
    self.frame = frame;
}

- (CGFloat)heightL {
    return self.frame.size.height;
}

- (void)setHeightL:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)leftL {
    return self.frame.origin.x;
}

- (void)setLeftL:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)topL {
    return self.frame.origin.y;
}

- (void)setTopL:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)rightL {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRightL:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottomL {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottomL:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

@end

@implementation MECategorySelectView

+(MECategorySelectView *)selectViewWithCategoryArray:(NSArray *)categoryArray withCallback:(MECategorySelectCallbackBlock)callback
{
    MECategorySelectView *selectView = [[MECategorySelectView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    selectView.categoryArray = categoryArray;
    selectView.callback = callback;
    return selectView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.33333];
        [self addSubview:_bgView];
        _bgView.alpha = 0;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgViewTap:)];
        [_bgView addGestureRecognizer:tap];
        
        _downwardTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 40) style:UITableViewStylePlain];
        _downwardTableView.delegate = self;
        _downwardTableView.dataSource = self;
        [self addSubview:_downwardTableView];
        [_downwardTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _categoryCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 40) collectionViewLayout:layout];
        _categoryCollectionView.delegate = self;
        _categoryCollectionView.dataSource = self;
        [self addSubview:_categoryCollectionView];
        _categoryCollectionView.backgroundColor = [UIColor whiteColor];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        [_categoryCollectionView registerNib:[UINib nibWithNibName:@"MECategoryTapItemCell" bundle:nil] forCellWithReuseIdentifier:@"MECategoryTapItemCell"];
        
        [self addSubview:[self lineViewWithY:39 withIsDeepColor:YES]];
        
        self.heightL = _categoryCollectionView.bottomL;
        
        _currentDownwardIndex = -1;
    }
    return self;
}

-(void)bgViewTap:(UITapGestureRecognizer *)tap
{
    MECategoryTapItemCell *tmpCell = (MECategoryTapItemCell *)[_categoryCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_currentDownwardIndex inSection:0]];
    tmpCell.isDownward = NO;
    self.currentDownwardIndex = -1;
}

-(void)setCategoryArray:(NSArray *)categoryArray
{
    if (_categoryArray != categoryArray)
    {
        _categoryArray = categoryArray;
        
        [_categoryCollectionView reloadData];
        [_downwardTableView reloadData];
        
        _currentSelectTitleArray = [NSMutableArray arrayWithCapacity:categoryArray.count];
        _currentSelectIDArray = [NSMutableArray arrayWithCapacity:categoryArray.count];
        for (MECategoryModel *model in categoryArray)
        {
            [_currentSelectTitleArray addObject:[model.itemStrArray firstObject]];
            if (model.itemIDArray)
            {
                [_currentSelectIDArray addObject:[model.itemIDArray firstObject]];
            }
        }
    }
}

#pragma mark -UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _categoryArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MECategoryTapItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MECategoryTapItemCell" forIndexPath:indexPath];
    MECategoryModel *model = _categoryArray[indexPath.item];
    NSString *itemStr = [model.itemStrArray objectAtIndexCheckCross:model.currentSelectedIndex];
    
    cell.isDownward = _currentDownwardIndex == indexPath.item;
    
    CGFloat width = SCREENWIDTH/_categoryArray.count - 22;
    if (width < 75)
    {
        width = 75;
    }
    [cell setName:itemStr withLimitWidth:width];
    [cell setWidthL:width];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = SCREENWIDTH/_categoryArray.count;
    if (width < 75)
    {
        width = 75;
    }
    return CGSizeMake(width, 40);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets set = UIEdgeInsetsMake(0, 0, 0, 0);
    return set;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.001;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.001;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (_currentDownwardIndex == indexPath.row)
    {
        MECategoryTapItemCell *tmpCell = (MECategoryTapItemCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_currentDownwardIndex inSection:0]];
        tmpCell.isDownward = NO;
        self.currentDownwardIndex = -1;
        return;
    }
    if (_currentDownwardIndex >= 0)
    {
        MECategoryTapItemCell *tmpCell = (MECategoryTapItemCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_currentDownwardIndex inSection:0]];
        tmpCell.isDownward = NO;
        MECategoryTapItemCell *cell = (MECategoryTapItemCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.isDownward = YES;
        _currentDownwardIndex = indexPath.row;
        [self showTableViewWithNeedResetBottom:NO];
        return;
    }
    
    MECategoryTapItemCell *cell = (MECategoryTapItemCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.isDownward = YES;
    
    self.currentDownwardIndex = indexPath.row;
    
}

-(void)setCurrentDownwardIndex:(NSInteger)currentDownwardIndex
{
    if (_currentDownwardIndex != currentDownwardIndex)
    {
        _currentDownwardIndex = currentDownwardIndex;
        
        if (_currentDownwardIndex >= 0)
        {
            [self showTableViewWithNeedResetBottom:YES];
        }
        else
        {
            _bgView.alpha = 1;
            [UIView animateWithDuration:0.2 animations:^{
                _downwardTableView.bottomL = _categoryCollectionView.bottomL;
                _bgView.alpha = 0;
                self.heightL = _categoryCollectionView.bottomL;
            }];
        }
    }
}

-(void)showTableViewWithNeedResetBottom:(BOOL)isNeedResetBottom
{
    MECategoryModel *model = _categoryArray[_currentDownwardIndex];
    CGFloat tableHeight = 0;
    if (model.itemStrArray.count > 7)
    {
        tableHeight = 50*7.5;
    }
    else
    {
        tableHeight = 50*model.itemStrArray.count;
    }
    CGFloat limitHeight = SCREENHEIGHT - 64 - 40;
    if (tableHeight > limitHeight)
    {
        tableHeight = limitHeight;
    }
    if (isNeedResetBottom)
    {
        _downwardTableView.heightL = tableHeight;
        _downwardTableView.bottomL = _categoryCollectionView.bottomL;
        self.heightL = _categoryCollectionView.bottomL;
        _bgView.alpha = 0;
    }
    
    [_downwardTableView reloadData];
    
    [UIView animateWithDuration:0.2 animations:^{
        if (isNeedResetBottom)
        {
            _downwardTableView.topL = _categoryCollectionView.bottomL;
        }
        else
        {
            _downwardTableView.heightL = tableHeight;
        }
        self.heightL = SCREENHEIGHT;
        _bgView.alpha = 1;
    }];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_currentDownwardIndex < 0)
    {
        return 0;
    }
    MECategoryModel *model = _categoryArray[_currentDownwardIndex];
    return model.itemStrArray.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (_currentDownwardIndex < 0)
    {
        return [[UITableViewCell alloc] init];
    }
    MEDownwardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MEDownwardCell"];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MEDownwardCell" owner:nil options:nil] firstObject];
    }
    
    MECategoryModel *model = _categoryArray[_currentDownwardIndex];
    NSString *selectedTitle = [model.itemStrArray objectAtIndexCheckCross:model.currentSelectedIndex];
    NSString *showTitle = [model.itemStrArray objectAtIndexCheckCross:indexPath.row];
    
    [cell setTitle:showTitle withIsSelected:[showTitle isEqualToString:selectedTitle]];
    
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_currentDownwardIndex < 0)
    {
        return ;
    }
    MECategoryModel *model = _categoryArray[_currentDownwardIndex];
    BOOL isNeedCallback = YES;
    if (model.currentSelectedIndex == indexPath.row)
    {
        isNeedCallback = NO;
    }
    model.currentSelectedIndex = indexPath.row;
    
    NSString *selectedTitle = [model.itemStrArray objectAtIndexCheckCross:indexPath.row];
    NSString *selectedID = [model.itemIDArray objectAtIndexCheckCross:indexPath.row];
    MECategoryTapItemCell *cell = (MECategoryTapItemCell *)[_categoryCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_currentDownwardIndex inSection:0]];
    CGFloat width = SCREENWIDTH/_categoryArray.count - 22;
    if (width < 75)
    {
        width = 75;
    }
    [cell setName:selectedTitle withLimitWidth:width];
    cell.widthL = SCREENWIDTH/_categoryArray.count;
    cell.name = selectedTitle;
    cell.isDownward = NO;
    [_currentSelectTitleArray replaceObjectAtIndex:_currentDownwardIndex withObject:selectedTitle];
    if (_currentSelectIDArray.count > 0)
    {
        [_currentSelectIDArray replaceObjectAtIndex:_currentDownwardIndex withObject:selectedID];
    }
    
    self.currentDownwardIndex = -1;
    if (isNeedCallback)
    {
        _callback(_currentSelectTitleArray,_currentSelectIDArray);
    }
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 50;
}

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

@end
