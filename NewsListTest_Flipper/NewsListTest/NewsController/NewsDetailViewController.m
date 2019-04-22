//
//  NewsDetailViewController.m
//  NewsListTest
//
//  Created by Civet on 2019/4/2.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NewsModel.h"
#import "NewsSort.h"
#import "Imgextra.h"
@interface NewsDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic) UITableView *tableView;
@property(nonatomic) NSInteger cellNumber;          //单元格数量
@property(nonatomic,strong) __block NSMutableArray *newsDetailArray;    //用于存储新闻各个属性
@property(nonatomic) __block NSInteger elementLocation;

@end

@implementation NewsDetailViewController

- (instancetype)init {
    if (self = [super init]) {
        // 设置标题
        //self.tabBarItem.title = @"新闻详情";
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.view = _tableView;
    self.newsDetailArray = [[NSMutableArray alloc]init];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //将新闻内容各项数据以数组的形式存储
        if(self.newsModelObject.title!=nil)
            [self.newsDetailArray addObject:self.newsModelObject.title];
        else
            [self.newsDetailArray addObject:@""];
        
        if(self.newsModelObject.ptime!=nil)
            [self.newsDetailArray addObject:self.newsModelObject.ptime];
        else
            [self.newsDetailArray addObject:@""];
        
        if(self.newsModelObject.imgextra!=nil)
            [self.newsDetailArray addObject:self.newsModelObject.imgextra];
        else
            [self.newsDetailArray addObject:@""];
        
        if(self.newsModelObject.imgsrc!=nil)
            [self.newsDetailArray addObject:self.newsModelObject.imgsrc];
        else
            [self.newsDetailArray addObject:@""];
        
        if(self.newsModelObject.commentCount!=nil)
            [self.newsDetailArray addObject:self.newsModelObject.commentCount];
        else
            [self.newsDetailArray addObject:@""];
        
        self.cellNumber = self.newsDetailArray.count;
    });
    
    
    
//    if(self.newsModelObject.stitle!=nil)
//        [_newsDetailArray addObject:self.newsModelObject.stitle];
//    else
//        [_newsDetailArray addObject:@""];
//
    //    if(self.newsModelObject.digest!=nil)
//        [_newsDetailArray addObject:self.newsModelObject.digest];
//    else
//        [_newsDetailArray addObject:@""];
//
//
//
//
//    if(self.newsModelObject.imgsrc3gtype!=nil)
//        [_newsDetailArray addObject:self.newsModelObject.imgsrc3gtype];
//    else
//        [_newsDetailArray addObject:@""];
//
//    if(self.newsModelObject.liveInfo!=nil)
//        [_newsDetailArray addObject:self.newsModelObject.liveInfo];
//    else
//        [_newsDetailArray addObject:@""];
//
//    if(self.newsModelObject.modelmode!=nil)
//        [_newsDetailArray addObject:self.newsModelObject.modelmode];
//    else
//        [_newsDetailArray addObject:@""];
//
//    if(self.newsModelObject.photosetID!=nil)
//        [_newsDetailArray addObject:self.newsModelObject.photosetID];
//    else
//        [_newsDetailArray addObject:@""];
//
//    if(self.newsModelObject.priority!=nil)
//        [_newsDetailArray addObject:self.newsModelObject.priority];
//    else
//        [_newsDetailArray addObject:@""];
//
//
//
//    if(self.newsModelObject.skipType!=nil)
//        [_newsDetailArray addObject:self.newsModelObject.skipType];
//    else
//        [_newsDetailArray addObject:@""];
//
//    if(self.newsModelObject.skipURL!=nil)
//        [_newsDetailArray addObject:self.newsModelObject.skipURL];
//    else
//        [_newsDetailArray addObject:@""];
//
//    if(self.newsModelObject.source!=nil)
//        [_newsDetailArray addObject:self.newsModelObject.source];
//    else
//        [_newsDetailArray addObject:@""];

}

//设置分区的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//返回每个分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellNumber;
}

//设置单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    
    //显示第_elementLocation个cell
    _elementLocation = 0;
    
    for (int section = 0; section <= indexPath.section; section++){
        for (int row = 0;(row < [_tableView numberOfRowsInSection:section] && section < indexPath.section)
             ||(section==indexPath.section && row <=indexPath.row); row++){
            
            _elementLocation++;
            
        }
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *element = [self.newsDetailArray objectAtIndex:self.elementLocation - 1];
        
        //判断cell内容是否为空
        if (self.elementLocation -1 == 0)
        {
            if (element !=nil && ![element  isEqual:@""])
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.textLabel.text = [NSString stringWithFormat:@"%@",element];
                });
            else
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.textLabel.text = [NSString stringWithFormat:@"无主题"];
                });
            
        }else if (self.elementLocation -1 == 1){
            if (element !=nil && ![element  isEqual:@""])
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.textLabel.text = [NSString stringWithFormat:@"新闻日期：%@",element];
                });
            else
                dispatch_async(dispatch_get_main_queue(), ^{
                   cell.textLabel.text = [NSString stringWithFormat:@"无日期"];
                });
            
        }else if (self.elementLocation - 1== 2){
            if (element !=nil && ![element  isEqual:@""]){
                NewsModel *newsM = [[NewsModel alloc]init];
                newsM.imgextra = [self.newsDetailArray objectAtIndex:self.elementLocation - 1];
                NSDictionary *img = [[NSDictionary alloc]init];
                for (id image in newsM.imgextra){
                    if (image != nil){
                        img = image;
                        NSString *imgsrc = img[@"imgsrc"];
                        NSURL *imageUrl = [NSURL URLWithString:imgsrc];
                        
                        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            cell.imageView.image = image;
                            //传入空数组，对当前cell进行刷新
                            [self.tableView reloadRowsAtIndexPaths:@[] withRowAnimation:UITableViewRowAnimationFade];
                        });
                    }else{
                        dispatch_async(dispatch_get_main_queue(), ^{
                             cell.textLabel.text = [NSString stringWithFormat:@"无图"];
                        });
                       
                    }
                }
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.textLabel.text = [NSString stringWithFormat:@"无图"];
                });
                
            }
        }else if (self.elementLocation - 1== 3){
            if(element != nil && ![element  isEqual:@""]){
                NSURL *imageUrl = [NSURL URLWithString:element];
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.imageView.image = image;
                    //传入空数组，对当前cell进行刷新
                    [self.tableView reloadRowsAtIndexPaths:@[] withRowAnimation:UITableViewRowAnimationFade];
                });
            }else
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.textLabel.text = [NSString stringWithFormat:@"无图"];
                });
        }else if (self.elementLocation - 1 == 4){
            
            if (element != nil && ![element  isEqual:@""])
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.textLabel.text = [NSString stringWithFormat:@"评论人数：%@",element];
                });
            
            else
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.textLabel.text = [NSString stringWithFormat:@"无评论"];
                });
        }
        //_elementLocation++;
        
    });
    
    
     cell.detailTextLabel.text = [NSString stringWithFormat:
                                  @"第%ld分区第%ld行",indexPath.section,indexPath.row];

    return cell;
}

//设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
