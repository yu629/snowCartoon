//
//  cartooonViewController.m
//  cartoon
//
//  Created by tton on 15/12/3.
//  Copyright © 2015年 tton. All rights reserved.
//

#import "cartooonViewController.h"
#import <math.h>

@interface cartooonViewController ()
- (IBAction)button:(id)sender;
@property (nonatomic, strong)UIImage *pic;

@end

@implementation cartooonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pic = [UIImage imageNamed:@"5ff5803cd46445cbdd2821aed2eb4007"];
    self.view.backgroundColor = [UIColor colorWithRed:0.292 green:0.513 blue:1.000 alpha:1.000];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)button:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    button.hidden = YES;
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(click) userInfo:nil repeats:YES];
    
}
- (void)click{

    UIImageView *view = [[UIImageView alloc] initWithImage:self.pic];//声明一个UIImageView对象，用来添加图片
    view.layer.masksToBounds = YES;
    view.alpha = 0.5;//设置该view的alpha为0.5，半透明的
    int x = round(random()%320);//随机得到该图片的x坐标
    int y = round(random()%320);//这个是该图片移动的最后坐标x轴的
    int s = round(random()%15)+10;//这个是定义雪花图片的大小
    int sp = 1/round(random()%100)+1;//这个是速度
    view.frame = CGRectMake(x, -50, s, s);//雪花开始的大小和位置
    view.layer.cornerRadius = s/3;
    [self.view addSubview:view];//添加该view
    [UIView beginAnimations:nil context:(__bridge void * _Nullable)(view)];//开始动画
    [UIView setAnimationDuration:10*sp];//设定速度
    view.frame = CGRectMake(y, 500, s, s);//设定该雪花最后的消失坐标
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];

}



@end
