//
//  TableViewExampleVC.m
//  ScroViewHeaderScanle(头部view缩放)
//
//  Created by 公智能 on 2021/5/12.
//

#import "TableViewExampleVC.h"
#import "TableZoomHeader.h"

@interface TableViewExampleVC ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView *_tableView;
}

@end

@implementation TableViewExampleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}
- (void)buildUI {
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    TableZoomHeader *header = [[TableZoomHeader alloc] initWithFrame:CGRectMake(0, 0, _tableView.bounds.size.width, 150)];
    _tableView.xl_zoomHeader = header;
}
#pragma mark TableViewDelegate&DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"index : %ld",(long)indexPath.row];
    return cell;
}


@end
