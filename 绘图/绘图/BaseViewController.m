//
//  BaseViewController.m
//  绘图
//
//  Created by 公智能 on 2021/5/18.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.baseView = [[UIView alloc]init];
//    self.contentView.backgroundColor = [UIColor yellowColor];

    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
//    scrollView.backgroundColor = [UIColor greenColor];
   
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.baseView];
}

-(void)viewDidLayoutSubviews{
    self.scrollView.contentSize = CGSizeMake(0, CGRectGetHeight(self.baseView.frame));
}
@end
