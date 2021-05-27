//
//  WaterViewController.m
//  绘图
//
//  Created by 公智能 on 2021/5/25.
//

#import "WaterViewController.h"
#import "WaterView.h"
#import "QLMarkView.h"

@interface WaterViewController ()

@end

@implementation WaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;

    if (self.type == 4) { //果冻效果
        [self waterBackGround];
    }else if (self.type == 5){ //优惠券背景
        [self discountCoupon];
    }
    
    
}

-(void)waterBackGround{
    WaterView *cuteView = [[WaterView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 568)];
    cuteView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    [self.view addSubview:cuteView];
}

-(void)discountCoupon{
    //横向的
    QLMarkView *markView1 = [self creatMarkView:YES
                                       andFrame:CGRectMake(50, 20, self.view.frame.size.width-100, 80)
                                       andColor:[UIColor cyanColor]];
    [self.view addSubview:markView1];
    
    QLMarkView *markView2 = [self creatMarkView:YES
                                       andFrame:CGRectMake(50, 120, self.view.frame.size.width-100, 80)
                                       andColor:[UIColor purpleColor]];
    [self.view addSubview:markView2];
    
    //纵向的
    QLMarkView *markView3 = [self creatMarkView:NO
                                       andFrame:CGRectMake(50, 250, self.view.frame.size.width-100, 400)
                                       andColor:[UIColor systemPinkColor]];
    [self.view addSubview:markView3];
}

-(QLMarkView *)creatMarkView:(BOOL)isVertical andFrame:(CGRect)rect andColor:(UIColor *)color{
    QLMarkView *markView = [[QLMarkView alloc]initWithFrame:rect];
    markView.isVertical = isVertical;//方向是垂直还是水平
    markView.speDistance = 50;
    markView.speRadius = 10;
    markView.borderRadius = 5;
    markView.shadowColor = color.CGColor;
    markView.shadowWidth = 5;
    markView.contentColor = [UIColor whiteColor].CGColor;
    markView.imaginaryLineColor = [UIColor orangeColor].CGColor;
    markView.imaginaryLineDistance = 10;
    return markView;
}

@end
