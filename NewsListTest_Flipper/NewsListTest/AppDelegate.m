//
//  AppDelegate.m
//  NewsListTest
//
//  Created by Civet on 2019/3/26.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NewsController/View1.h"
#import "NewsController/View2.h"
#import "NewsController/View3.h"

#import <FlipperKit/FlipperClient.h>
#import <FlipperKitLayoutPlugin/FlipperKitLayoutPlugin.h>
#import <FlipperKitLayoutComponentKitSupport/FlipperKitLayoutComponentKitSupport.h>
#import <FlipperKitUserDefaultsPlugin/FKUserDefaultsPlugin.h>
#import <FlipperKitNetworkPlugin/FlipperKitNetworkPlugin.h>
#import <SKIOSNetworkPlugin/SKIOSNetworkAdapter.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    
    //集成Flipper
    FlipperClient *client = [FlipperClient sharedClient];
    SKDescriptorMapper *layoutDescriptorMapper = [[SKDescriptorMapper alloc] initWithDefaults];
    [FlipperKitLayoutComponentKitSupport setUpWithDescriptorMapper: layoutDescriptorMapper];
    
    //向Flipper添加Layout,UserDefault,NetWork插件
    [client addPlugin: [[FlipperKitLayoutPlugin alloc] initWithRootNode: application
                                                   withDescriptorMapper: layoutDescriptorMapper]];
    [client addPlugin:[[FKUserDefaultsPlugin alloc] initWithSuiteName:nil]];  [client start];
    [client addPlugin: [[FlipperKitNetworkPlugin alloc] initWithNetworkAdapter:[SKIOSNetworkAdapter new]]];
    [client start];
    
    // 1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //把导航控制器作为根页面展示
    //self.window.rootViewController = navigationController;
    
    //2.设置为主窗口并显示出来
    //[self.window makeKeyAndVisible];
    
    // 3.创建标签控制器的子控制器
    ViewController *newsVC = [[ViewController alloc] init];
    //newsVC.tabBarItem.title = @"新闻1";
    [newsVC setTitle:@"新闻"];
    //将ViewController加入NavigationController中
    UINavigationController *newsNC = [[UINavigationController alloc] initWithRootViewController:newsVC];
    //newsNC.view.backgroundColor = [UIColor purpleColor];
    //newsNC.view.fon
    newsVC.newsNCHeignt = newsNC.navigationBar.frame.size.height;
    
    
    //3.将图片视图加入到导航控制器
    View1 *picturesVC = [[View1 alloc] init];
    //picturesVC.tabBarItem.title = @"图片";
    [picturesVC setTitle:@"图片"];
 
    UINavigationController *picturesNC = [[UINavigationController alloc] initWithRootViewController:picturesVC];
    
    //3.将视频视图加入到导航控制器
    View2 *videosVC = [[View2 alloc] init];
    //videosVC.tabBarItem.title = @"视频";
    [videosVC setTitle:@"视频"];
    UINavigationController *videosNC = [[UINavigationController alloc] initWithRootViewController:videosVC];
    
    //3.将个人视图加入到导航控制器
    View3 *personalVC = [[View3 alloc] init];
    //personalVC.tabBarItem.title = @"我的";
    [personalVC setTitle:@"我的"];
    UINavigationController *personalNC = [[UINavigationController alloc] initWithRootViewController:personalVC];

    
    // 4.新建一个导航控制器实例的数组
    NSArray *controllersArray = @[newsNC, picturesNC,videosNC,personalNC];

    // 5.创建标签控制器
    UITabBarController *tabBarC = [[UITabBarController alloc] init];
    tabBarC.view.backgroundColor = [UIColor blueColor];
    newsVC.tabBarCHeight = tabBarC.tabBar.frame.size.height;

    // 6.把导航控制器的数组加入到标签控制器
    [tabBarC setViewControllers:controllersArray animated:YES];
    
    // 7.设置窗口的根控制器为标签控制器
    self.window.rootViewController = tabBarC;
    
    //NSLog(@"tabBarC=============%fld",tabBarC.)
    //8. 显示窗口
    [self.window makeKeyAndVisible];
  
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
