//
//  NewsSort.h
//  NewsListTest
//
//  Created by Civet on 2019/3/28.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsSort : NSObject

@property(nonatomic, copy) NSMutableArray *newsSort;

-(instancetype)initWithSortDict:(NSDictionary*)dict;

@end
