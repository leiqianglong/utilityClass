//
//  ViewController.m
//  绘图
//
//  Created by 公智能 on 2021/5/17.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondController.h"
#import "TreViewController.h"
#import "FourViewController.h"
#import "WaterViewController.h"
#import "QLLineChartCtr.h"
#import "QLChart2Controller.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绘图示例";
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.array = @[@"CAShapeLayer简介",@"CABasicAnimation",@"随意绘制",@"随意绘制2",@"果冻弹弹效果",@"优惠券背景图",@"折线图",@"折线图2"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            FirstViewController *vc = [[FirstViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            SecondController *vc = [[SecondController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            TreViewController *vc = [[TreViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            FourViewController *vc = [[FourViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        case 5:
        {
            WaterViewController *vc = [[WaterViewController alloc]init];
            vc.title = self.array[indexPath.row];
            vc.type = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            QLLineChartCtr *vc = [[QLLineChartCtr alloc]init];
            vc.title = self.array[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            QLChart2Controller *vc = [[QLChart2Controller alloc]init];
            vc.title = self.array[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
