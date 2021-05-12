//
//  ViewController.m
//  FlowLayoutDemo
//
//  Created by 公智能 on 2021/5/11.
//

#import "ViewController.h"
#import "FirstCollectionViewController.h"
#import "SecCollectionViewController.h"
#import "TreCollectionViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
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
    if (indexPath.row == 0) {
        FirstCollectionViewController *vc = [FirstCollectionViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        SecCollectionViewController *vc = [SecCollectionViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        TreCollectionViewController *vc = [TreCollectionViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(NSArray *)array{
    if (!_array) {
        _array = @[@"2列，没有头部视图和底部视图",@"不同组不同列数",@"自定首页样式"];
    }
    return _array;
}
@end
