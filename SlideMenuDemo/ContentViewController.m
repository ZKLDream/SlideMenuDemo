//
//  ContentViewController.m
//  SlideMenuDemo
//
//  Created by 千锋 on 16/3/25.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "ContentViewController.h"
#import "LeftViewController.h"
#import "CenterViewController.h"
#import "RightViewController.h"

//屏幕尺寸
#define ScreenSize [UIScreen mainScreen].bounds.size
@interface ContentViewController ()
- (IBAction)leftSideMenuAction:(UIButton *)sender;

- (IBAction)rightSideAction:(UIButton *)sender;



@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addViewControllers];
}

//添加子视图控制器
-(void)addViewControllers{
    
    //获取视图控制器
    //获取UIStoryboard对象
    
    UIStoryboard * sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //实例化视图控制器
    //通过指定ID去实例化对象
    LeftViewController *leftVC=[sb instantiateViewControllerWithIdentifier:@"LeftViewController"];
    CenterViewController *centerVC=[sb instantiateViewControllerWithIdentifier:@"CenterViewController"];
    RightViewController *rightVC=[sb instantiateViewControllerWithIdentifier:@"RightViewController"];
    //添加子视图控制器
    [self addChildViewController:leftVC];
     [self addChildViewController:centerVC];
    [self addChildViewController:rightVC];
   
    
    
    //添加子视图控制器的视图到当前视图控制器的视图上作为子视图使用
    [self.view addSubview:leftVC.view];
    [self.view addSubview:centerVC.view];
    [self.view addSubview:rightVC.view];
    
    [self.view sendSubviewToBack:centerVC.view];
    //修改左侧视图的frame
    leftVC.view.frame=CGRectMake(-ScreenSize.width, 0, ScreenSize.width, ScreenSize.height);
    //修改右侧视图的frame
    rightVC.view.frame=CGRectMake(ScreenSize.width, 0, ScreenSize.width, ScreenSize.height);
    
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

- (IBAction)leftSideMenuAction:(UIButton *)sender {
    
    NSArray *childVCs=self.childViewControllers;
    UIViewController *leftVC=childVCs[0];
    UIViewController *centerVC=childVCs[1];
    
    [UIView animateWithDuration:2 animations:^{
        
        leftVC.view.frame=CGRectMake(0, 0, ScreenSize.width, ScreenSize.height);
        
        centerVC.view.frame=CGRectMake(ScreenSize.width/2, 0, ScreenSize.width, ScreenSize.height);
        [self.view bringSubviewToFront:centerVC.view];
    }];
}

- (IBAction)rightSideAction:(UIButton *)sender {
}
@end
