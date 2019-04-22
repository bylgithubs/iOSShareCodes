//
//  ViewController.m
//  UITableViewTest1
//
//  Created by Civet on 2019/3/22.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self->sNum1=[[NSMutableString alloc]init];//初始化可变字符串，分配内存1111111111111
    self->sNum2=[[NSMutableString alloc]init];//初始化可变字符串，分配内存
    self->sOpt=[[NSString alloc]init];//初始化可变字符串，分配内存
    
    _calcResult.borderStyle = UITextBorderStyleRoundedRect;
    _calcResult.placeholder = @"请输入数字";
    
    UIImageView * calcImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 30, 30)];
    calcImage.image = [UIImage imageNamed:@"卡通.jpg"];
    _calcResult.backgroundColor = [UIColor orangeColor];
    
    _calcResult.leftView = calcImage; //设置输入框的左挂件视图；
    _calcResult.leftViewMode = UITextFieldViewModeAlways; //设置挂件显示模式；
    
    //设置按钮属性
    _dec.backgroundColor = [UIColor whiteColor];
    [_dec addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_dec setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _num0.backgroundColor = [UIColor whiteColor];
    [_num0 addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_num0 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _num1.backgroundColor = [UIColor whiteColor];
    [_num1 addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_num1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _num2.backgroundColor = [UIColor whiteColor];
     [_num2 addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_num2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _num3.backgroundColor = [UIColor whiteColor];
    [_num3 addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_num3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _num4.backgroundColor = [UIColor whiteColor];
    [_num4 addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_num4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _num5.backgroundColor = [UIColor whiteColor];
    [_num5 addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_num5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _num6.backgroundColor = [UIColor whiteColor];
    [_num6 addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_num6 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _num7.backgroundColor = [UIColor whiteColor];
    [_num7 addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_num7 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _num8.backgroundColor = [UIColor whiteColor];
    [_num8 addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_num8 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _num9.backgroundColor = [UIColor whiteColor];
    [_num9 addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_num9 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _add.backgroundColor = [UIColor lightGrayColor];
    [_add setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _sub.backgroundColor = [UIColor lightGrayColor];
    [_sub setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _mul.backgroundColor = [UIColor lightGrayColor];
    [_mul setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _div.backgroundColor = [UIColor lightGrayColor];
    [_div setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _eql.backgroundColor = [UIColor lightGrayColor];
    [_eql setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _CE.backgroundColor = [UIColor lightGrayColor];
    [_CE setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _back.backgroundColor = [UIColor lightGrayColor];
    [_back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
  
    self.view.backgroundColor = [UIColor whiteColor];
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 50, 280, 40)];
    [slider addTarget:self action:@selector(changeBG:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    

    //添加提示性文字
    /*   UIAlertView *alex=[[UIAlertView alloc]initWithTitle:@"使用说明" message:@"该计算器支持连算，但是不支持浮点运算！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
     [alex show];
     //[alex release];
     */
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (void) changeColor:(UIButton *)btn{
     btn.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
   // self.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0
    // blue:arc4random()%255/255.0 alpha:1];
}

- (void)changeBG:(UISlider *)slider{
    self.view.backgroundColor = [UIColor colorWithRed:1 - slider.value green:1 - slider.value blue:1 - slider.value alpha:1 - slider.value];
}

- (void) divZero:(UIButton *)btn{
    UIAlertController * alertCon = [UIAlertController alertControllerWithTitle:@"被除数不能为0" message:@"除零了,请重新输入数字" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"click");
    }];
    [alertCon addAction:action];
    [self presentViewController:alertCon animated:YES completion:nil];
}

int num = 1; //警告框弹出次数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (num <= 1){
        //NSLog(@"num=%i",num);
        num = 2;
        UIAlertController * alertCon = [UIAlertController alertControllerWithTitle:@"使用说明" message:@"该计算器支持连算，浮点运算，最多精确到小数点后6位，暂时不支持负数运算！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
            NSLog(@"click");
        }];
        [alertCon addAction:action];
        [self presentViewController:alertCon animated:YES completion:nil];
    }
    
}
 int dpn = 0; //小数点数目
long dl = 0; //小数点位置；


//触发点击事件
- (IBAction)BtnClick:(id)sender
{

    //NSLog(@"OK");
    NSString* strInput = [sender currentTitle];
    
    //NSLog(@"NowOpt=(%@)",strInput);
    
    if([strInput isEqualToString:@"="])
    {
        dpn = 0; //小数点标志置0；
        NSLog(@"62 sNum1=%@  ,sOpt=%@, sNum2=%@",sNum1,sOpt,sNum2);
        if ([sNum1 length] != 0 && [sNum2 length] !=0 && [sNum1 isEqualToString:@"0"])
        {
            NSLog(@"170sNum2=%@",sNum2);
            [self divZero:_eql];
            [sNum1 setString:@""];
            _calcResult.text = [self removeFloatAllZeroByString:sNum2];
            return;
        }
        
        if([sOpt isEqualToString:@"+"])
        {
            iSum = [sNum2 floatValue] + [sNum1 floatValue];
        }
        else if ([sOpt isEqualToString:@"-"])
        {
            iSum = [sNum2 floatValue] - [sNum1 floatValue];
        }
        else if ([sOpt isEqualToString:@"*"])
        {
            iSum = [sNum2 floatValue] * [sNum1 floatValue];
        }
        else if ([sOpt isEqualToString:@"/"])
        {
            iSum = [sNum2 floatValue] /[sNum1 floatValue];
        }
        else if ([sOpt isEqualToString:@"="])
        {
            if ([sNum1 length] != 0)
            {
                [sNum2 setString:sNum1];
                iSum = [sNum2 floatValue];
                [sNum1 setString:@""];
                return;
            }
            
           
        }
        sOpt = @"=";
        [sNum1 setString:@""];
        //NSLog(@"sNum2=%@",sNum2);
        sNum2 = [NSMutableString stringWithFormat:@"%.6f",iSum];
        NSLog(@"94 sNum1=%@  ,sOpt=%@, sNum2=%@",sNum1,sOpt,sNum2);
        _calcResult.text = [self removeFloatAllZeroByString:sNum2];
        //[sNum2 retain];
        // NSLog(@"wyz========result2=%@");
        return;
        
    }
    
    if([strInput isEqualToString:@"/"] || [strInput isEqualToString:@"*"] || [strInput isEqualToString:@"-"] || [strInput isEqualToString:@"+"])
    {
        dpn = 0;    //小数点标志置0；
        NSLog(@"sOpt=%@",strInput);
        if ([self->sNum1 length] != 0 && [self->sNum2 length] != 0)
        {
            if([sOpt isEqualToString:@"+"])
            {
                iSum = [sNum2 floatValue] + [sNum1 floatValue];
            }
            else if ([sOpt isEqualToString:@"-"])
            {
                iSum = [sNum2 floatValue] - [sNum1 floatValue];
            }
            else if ([sOpt isEqualToString:@"*"])
            {
                iSum = [sNum2 floatValue] * [sNum1 floatValue];
            }
            else if ([sOpt isEqualToString:@"/"])
            {
                if ([sNum1 isEqualToString:@"0"])
                {
                    [self divZero:_eql];
                    [sNum1 setString:@""];
                    _calcResult.text = [self removeFloatAllZeroByString:sNum2];
                    return;
                }
                iSum = [sNum2 floatValue] /[sNum1 floatValue];
            }
            sOpt = strInput;
            //NSLog(@"wyz====12(%@)",sOpt);
            [sNum1 setString:@""];
            sNum2 = [NSMutableString stringWithFormat:@"%.6f",iSum];
            NSLog(@"128 sNum1=%@  ,sOpt=%@, sNum2=%@",sNum1,sOpt,sNum2);
            _calcResult.text = [self removeFloatAllZeroByString:sNum2];
            //[sNum2 retain];
            // NSLog(@"wyz========result2=%@");
            return;
            
        }
        sOpt = strInput;
        NSLog(@"sOpt=%@",sOpt);
        if([self->sNum1 length] !=0)
        {
            [sNum2 setString:sNum1];  //内容赋值
            //self.sNum2 = self.sNum1;  //指针赋值
        }
        NSString *ss = [self removeFloatAllZeroByString:sNum2];
        
        _calcResult.text = ss;

        [sNum1 setString:@""];

        //NSLog(@"wyz===opt(%@)===num1=%@,num2=%@",sOpt,sNum1,sNum2);
        
        return;
        
    }
    
    
    if([strInput isEqualToString:@"CE"])
    {
        _calcResult.text = nil;
        iSum = 0;
        [sNum1 setString:@""];
        [sNum2 setString:@""];
        
        return;
    }
    
    if([strInput isEqualToString:@"back"])
    {
        //NSLog(@"sNum1=%@",sNum1);
        if([sNum1 isEqualToString:@""])
        {
            return;
        }
        if ([sNum1 length] == dl)
            dpn = 0;
        [sNum1 deleteCharactersInRange:NSMakeRange([sNum1 length]-1, 1)];
        if([sNum1 length] == 0)
        {
            
            _calcResult.text = @"0";
            return;
        }
        
        
        _calcResult.text = sNum1;
        return;
    }
    
 
    if([strInput isEqualToString:@"1"] || [strInput isEqualToString:@"2"] || [strInput isEqualToString:@"3"] || [strInput isEqualToString:@"4"] || [strInput isEqualToString:@"5"]||[strInput isEqualToString:@"6"] || [strInput isEqualToString:@"7"]||[strInput isEqualToString:@"8"] || [strInput isEqualToString:@"9"]||[strInput isEqualToString:@"0"] ||[strInput isEqualToString:@"."])
    {
        if([sOpt isEqualToString:@"="])
            [sNum2 setString:@""];
        NSLog(@"strInput=%@",strInput);
        if ([strInput isEqualToString:@"."] && dpn >0)
        {
            //NSLog(@"dpn=%i",dpn);
            return;
        }
        else if ([strInput isEqualToString:@"."] && dpn == 0)
        {
            //NSLog(@"dpn=%i",dpn);
            dl = [sNum1 length] + 1;
            dpn++;
        }
        
        
        if ([strInput isEqualToString:@"0"] && [sNum1 floatValue] == 0 && dpn == 0)
        {
            //NSLog(@"sssss=%@",sNum1);
             [sNum1 setString:@""];
        }
        
        [sNum1 appendString:strInput];
        _calcResult.text=[NSString stringWithString:sNum1];
        NSLog(@"%@",sNum1);
    }
    
    // _calcResult.text=strInput;
}

-(NSString *)removeFloatAllZeroByString:(NSString *)testNumber
{
    NSString * outNumber = [NSString stringWithFormat:@"%@",@(testNumber.floatValue)];
    return outNumber;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
