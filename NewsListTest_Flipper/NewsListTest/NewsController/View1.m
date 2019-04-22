//
//  View1.m
//  NewsListTest
//
//  Created by Civet on 2019/4/2.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "View1.h"

@interface View1 ()

@end

@implementation View1


- (instancetype)init {
    if (self = [super init]) {
       
        //设置背景图片
        self.view.backgroundColor = [UIColor colorWithRed:
                                     arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
     
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置根视图背景颜色
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(UIViewController *) topMostController {
    UIViewController*topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while(topController.presentedViewController){
        topController=topController.presentedViewController;
    }
    return topController;
}
@end

