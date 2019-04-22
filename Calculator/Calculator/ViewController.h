//
//  ViewController.h
//  Calculator
//
//  Created by Civet on 2019/3/25.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
NSMutableString *sNum1; //操作数一
NSMutableString *sNum2; //操作数二
NSString *sOpt;    //操作符号记录
float iSum; //计算结果);
}
@property(nonatomic,assign) IBOutlet UITextField *calcResult; //计算结果输出框
@property(nonatomic,assign) IBOutlet UIButton *num0,*num1,*num2,*num3,*num4,*num5,*num6,*num7,*num8,*num9,*dec;
@property(nonatomic,assign) IBOutlet UIButton *add,*sub,*mul,*div,*eql,*CE,*back;

-(IBAction)BtnClick:(id)sender; //按钮触发事件

@end

