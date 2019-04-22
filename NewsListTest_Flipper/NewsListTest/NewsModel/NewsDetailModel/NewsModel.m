//
//  NewsModel.m
//  NewsListTest
//
//  Created by Civet on 2019/3/28.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
//新闻具体内容 Dictionary转Model
-(instancetype)initWithContentDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.commentCount = dict[@"commentCount"];
        self.digest = dict[@"digest"];
        self.docid = dict[@"pid"];
        self.imgextra = dict[@"imgextra"];
        self.imgsrc = dict[@"imgsrc"];
        self.imgsrc3gtype = dict[@"imgsrc3gtype"];
        self.liveInfo = dict[@"liveInfo"];
        self.modelmode = dict[@"modelmode"];
        self.photosetID = dict[@"photosetID"];
        self.priority = dict[@"priority"];
        self.ptime = dict[@"ptime"];
        self.skipType = dict[@"skipType"];
        self.skipURL = dict[@"skipURL"];
        self.source = dict[@"source"];
        self.stitle = dict[@"stitle"];
        self.title = dict[@"title"];
        self.url = dict[@"url"];
            
        //self.author = [[author alloc] initWithDict:dict[@"author"]];
    }
    return self;
}

@end
