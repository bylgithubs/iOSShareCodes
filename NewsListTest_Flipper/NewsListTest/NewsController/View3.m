//
//  View3.m
//  NewsListTest
//
//  Created by Civet on 2019/4/2.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "View3.h"

@interface View3 ()

@end

@implementation View3

- (instancetype)init {
    if (self = [super init]) {
        
        
        
        // 设置标题
        self.tabBarItem.title = @"我的";
        
        //设置背景图片
        self.view.backgroundColor = [UIColor colorWithRed:
                                     arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:
                                 arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
