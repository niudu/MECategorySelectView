//
//  ViewController.m
//  MECategorySelectView
//
//  Created by 王方帅 on 16/10/27.
//  Copyright © 2016年 王方帅. All rights reserved.
//

#import "ViewController.h"
#import "MECategorySelectView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array = @[@[@"全部状态",@"状态1",@"状态2",@"状态3"],@[@"全部分类",@"分类1",@"分类2",@"分类3"]];
    MECategorySelectView *selectView = [MECategorySelectView selectViewWithCategoryArray:[MECategoryModel categoryModelArrayWithNameArray:array withIDArray:nil] withCallback:^(NSArray *nameArray, NSArray *idArray) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }];
    [self.view addSubview:selectView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
