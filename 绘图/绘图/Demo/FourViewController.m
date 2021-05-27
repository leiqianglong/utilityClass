//
//  FourViewController.m
//  绘图
//
//  Created by 公智能 on 2021/5/25.
//

#import "FourViewController.h"
#import "QLProgressView.h"
#import "NoDataView.h"

@interface FourViewController ()
@property (strong, nonatomic) QLProgressView *progressView;
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    

    [self creatProsses];
    [self creatLoading];
}

-(void)creatProsses{

    self.progressView = [[QLProgressView alloc]init];
    self.progressView.progress = 50.f;
    [self.view addSubview:self.progressView];
    self.progressView.frame = CGRectMake(50, 100, 300, 20);
    self.progressView.backgroundColor = [UIColor whiteColor];
 
    
}

-(void)creatLoading{  
    NoDataView *noDataView = [[NoDataView alloc]init];
    [self.view addSubview:noDataView];
    noDataView.backgroundColor = [UIColor whiteColor];
    noDataView.frame = CGRectMake(50, 160, self.view.frame.size.width-100, self.view.frame.size.width-100);
}
@end
