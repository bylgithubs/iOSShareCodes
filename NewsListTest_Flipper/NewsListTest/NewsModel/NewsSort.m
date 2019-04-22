//
//  NewsSort.m
//  NewsListTest
//
//  Created by Civet on 2019/3/28.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "NewsSort.h"

@implementation NewsSort
//新闻类型
-(instancetype)initWithSortDict:(NSDictionary *)dict{
     //NSLog(@"NewsSort initWithSortDict");
    if (self = [super init]) {
        
        self.newsSort = dict[@"BA10TA81wangning"];
 
    }
    return self;
}

@end
