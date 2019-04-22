//
//  NewsModel.h
//  NewsListTest
//
//  Created by Civet on 2019/3/28.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

//已使用属性
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *ptime;
@property(nonatomic, copy) NSMutableArray *imgextra;
@property(nonatomic, copy) NSString *imgsrc;
@property(nonatomic, copy) NSString *commentCount;
//未使用属性
@property(nonatomic, copy) NSString *stitle;
@property(nonatomic, copy) NSString *digest;
@property(nonatomic, copy) NSString *imgsrc3gtype;
@property(nonatomic, copy) NSString *liveInfo;
@property(nonatomic, copy) NSString *modelmode;
@property(nonatomic, copy) NSString *photosetID;
@property(nonatomic, copy) NSString *priority;
@property(nonatomic, copy) NSString *skipType;
@property(nonatomic, copy) NSString *skipURL;
@property(nonatomic, copy) NSString *source;
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *docid;

-(id)initWithContentDict:(NSDictionary*)dict;

@end
