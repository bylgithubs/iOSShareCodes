//
//  ViewController.m
//  NewsListTest
//
//  Created by Civet on 2019/3/26.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

#import "NewsModel/NewsSort.h"
#import "NewsModel/NewsDetailModel/NewsModel.h"
#import "NewsModel/NewsDetailModel/Imgextra/Imgextra.h"
#import "NewsController/NewsDetailViewController.h"

@interface ViewController ()<NSURLSessionDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property(nonatomic,strong) __block NSMutableArray *newsArray;  //存储所有新闻
@property(nonatomic) NSInteger itemLocation;    //加载cell定位
@property(nonatomic) NSInteger clickLocation;   //点击新闻定位
@property(nonatomic) NSInteger sectionNumber;   //tabview分区数量
@property(nonatomic) NSInteger firstSectionCellNumbler; //第一分区cell数量
@property(nonatomic) NSInteger secondSectionCellNumber; //第二分区cell数量
@property(nonatomic) NSString *url; //新闻内容地址
@property(nonatomic) NewsSort *newsSortObject;
@property(nonatomic) UITableView *tableView;
@property(nonatomic) UISearchBar *newsSearchBar;
//- (IBAction)cellOnClick:(id)sender indexNumber:(nonnull NSIndexPath *)indexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置seachBar位于Navigation下方
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //创建tableview并将当前类设置为tableview的代理类
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    //self.tableView.backgroundColor =[UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //将tableview设为根视图
    //self.view = _tableView;

    
    [self.view addSubview:_tableView];
    //创建searchBar，定义当前类为searchBar的代理类，并将searchBar设为tableview的headerview;
    _newsSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    _newsSearchBar.placeholder = @"请输入新闻地址。。。。";
    _newsSearchBar.showsBookmarkButton = YES;
    _newsSearchBar.delegate = self;
//    _tableView.tableHeaderView = _newsSearchBar;
//    [self.view addSubview:_tableView.tableHeaderView];
    
    [self.view addSubview:_newsSearchBar];
    
    // 最顶端状态栏高度
    CGRect statusbarHeight = [[UIApplication sharedApplication] statusBarFrame];
    //NSLog(@"statusbar height: %f", statusbarHeight.size.height);   // 高度
    
//    //导航栏高度
//    CGRect rectOfNavigationbar = self.navigationController.navigationBar.frame;
//    NSLog(@"navigationbar height: %f", rectOfNavigationbar.size.height);   // 高度
  
    
    
    //表格高度 = 屏幕高度 - 最顶端状态栏高度 - 搜索栏高度 - 导航栏高度 - 标签栏高度
     _tableView.frame = CGRectMake(0, _newsSearchBar.bounds.size.height,[UIScreen mainScreen].bounds.size.width,
                                   [UIScreen mainScreen].bounds.size.height - statusbarHeight.size.height - _newsNCHeignt - _newsSearchBar.bounds.size.height- _tabBarCHeight);
    
    //数据初始化
    //self.newsArray = [[NSMutableArray alloc]init];
    self.itemLocation = 0;
    self.clickLocation = 0;
    
    [self dataFetch];

}

//获取新闻数据
- (void) dataFetch{
    //初始化可变数组
    self.newsArray = [[NSMutableArray alloc]init];
    if(_url == nil)
        _url = @"https://3g.163.com/touch/reconstruct/article/list/BA10TA81wangning/0-20.html";
    //将网址显示在UISearchBar上
    _newsSearchBar.text = _url;
    
    //创建单例session对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    //通过NSURLSession,block从网上获取数据
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:
                                                               _url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //处理数据NSData转NSString
        NSString *dataStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSCharacterSet *charSet =[NSCharacterSet characterSetWithCharactersInString:@" \"artiList()"];
        
        //处理数据成标准json格式
        NSString *jsonDataStr = [dataStr stringByTrimmingCharactersInSet:charSet];
        //NSLog(@"jsonDataStr================%@",jsonDataStr);
        //NSLog(@"jsonDataStr===============%@",jsonDataStr);
        NSData *jsonData = [jsonDataStr dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *err;
        __block NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                     options:NSJSONReadingMutableContainers
                                                                       error:&err];
        //切换到主线程，将子线程数据加载到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //新闻类型
            self.newsSortObject = [[NewsSort alloc]initWithSortDict:dict];
            
            for (id newsSortDetail in self.newsSortObject.newsSort){
                
                NewsModel *newsDetail = [[NewsModel alloc]initWithContentDict:newsSortDetail];
                [self.newsArray addObject:newsDetail];
            }
            //NSLog(@"_newsArray================%@",self.newsArray);
            
            //根据新闻数量对TableView进行分区，默认第一分区cell为3；
            if(self.newsArray.count <= 3){
                self.sectionNumber = 0;
                self.secondSectionCellNumber = 0;
                self.firstSectionCellNumbler = self.newsArray.count;
            }
            else{
                self.sectionNumber = 1;
                self.firstSectionCellNumbler = 3;
                self.secondSectionCellNumber = self.newsArray.count - self.firstSectionCellNumbler;
            }
            
            
            [self.tableView reloadData];
        });
    }];
     [dataTask resume];
    
}

//设置分区的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sectionNumber + 1;
    //return 2;
}

//返回每个分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return _firstSectionCellNumbler;
    }else{
        return _secondSectionCellNumber;
    }
}


//点击事件，选中数据调用方法；
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    _clickLocation = 0;

    NewsDetailViewController *newsDetailVC = [[NewsDetailViewController alloc] init];
    
    for (int section = 0; section <= indexPath.section; section++){

        for (int row = 0;(row < [_tableView numberOfRowsInSection:section] && section < indexPath.section)
             ||(section==indexPath.section && row <=indexPath.row); row++){
       
            _clickLocation++;
           
        }
    }
    
    //根据indexPath获取点击新闻位置，从数组取出点击的新闻
    NewsModel *newsModelSelect = [_newsArray objectAtIndex:_clickLocation-1];
    
    //将点击的新闻已对象的形式打包，通过接口传输到NewsDetailViewController中
    newsDetailVC.newsModelObject = newsModelSelect;
    
    //将当前ViewController压人栈中
    [self.navigationController pushViewController:newsDetailVC animated:YES];

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"currentThread6============%@",[NSThread currentThread]);
    //NSLog(@"======================5");
    //从复用池取出cell
    UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    //复用池不存在指定ID的cell，则重新创建一个新的cell;
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    
    //定位当前显示的cell位置
    _itemLocation = 0;
    for (int section = 0; section <= indexPath.section; section++){
        for (int row = 0;(row < [_tableView numberOfRowsInSection:section] && section < indexPath.section)
             ||(section==indexPath.section && row <=indexPath.row); row++){
            
            _itemLocation++;
            
        }
    }
    
    //通过数组下标取出新闻数据并显示
    if (_newsArray != nil && _newsArray.count > 0){
        NewsModel *newsM = [_newsArray objectAtIndex:_itemLocation - 1];

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSDictionary *imgextra = newsM.imgextra[0];
            //显示新闻图片
            Imgextra *imgsrc = [[Imgextra alloc]initWithContentDetailDict:imgextra];
            
            if (newsM.imgsrc != nil){
                NSURL *imageUrl = [NSURL URLWithString:newsM.imgsrc];
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.imageView.image = image;
                    //传入空数组，对当前cell进行刷新
                    [self.tableView reloadRowsAtIndexPaths:@[] withRowAnimation:UITableViewRowAnimationFade];
                });
            }else{
                NSURL *imageUrl1 = [NSURL URLWithString:imgsrc.imgsrc];
                UIImage *image1 = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl1]];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.imageView.image = image1;
                    //传入空数组，对当前cell进行刷新
                    [self.tableView reloadRowsAtIndexPaths:@[] withRowAnimation:UITableViewRowAnimationAutomatic];
                });
            }
        });
        
        //显示新闻标题
        cell.textLabel.text = [NSString stringWithFormat:@"%@",newsM.title];
        //显示新闻副标题
        cell.detailTextLabel.text = [NSString stringWithFormat:@"第%ld分区第%ld行",indexPath.section,indexPath.row];

        cell.accessoryType = UITableViewCellAccessoryNone; //附加视图样式
        //正常模式和编辑模式切换开关
        //tableView.editing = YES;

  
    }

    return cell;
}

//设置cell高度；
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    //自定义searchBar的url
    _url = searchBar.text;
   
    //更新TableView数据
    [self dataFetch];
}

@end
