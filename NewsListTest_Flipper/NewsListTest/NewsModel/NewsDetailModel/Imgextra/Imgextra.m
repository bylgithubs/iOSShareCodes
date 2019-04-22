//
//  Imgextra.m
//  NewsListTest
//
//  Created by Civet on 2019/3/28.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "Imgextra.h"

@implementation Imgextra
//新闻图片地址  Dictionary转Model
-(instancetype)initWithContentDetailDict:(NSDictionary *)dict{
    // NSLog(@"imgextra initWithContentDetailDict");
    if (self = [super init]) {
        
        self.imgsrc = dict[@"imgsrc"];
    }
    return self;
}

@end
