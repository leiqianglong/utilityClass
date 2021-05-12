//
//  FirstCollectionViewController.m
//  FlowLayoutDemo
//
//  Created by 公智能 on 2021/5/11.
//

#import "FirstCollectionViewController.h"
#import "MyCollectionViewCell.h"

@interface FirstCollectionViewController ()
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber *> *> *datas;
@end

@implementation FirstCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"无表头无表尾的流水布局";
    
    [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    _datas = [NSMutableArray array];
    for (int i=0; i<3; i++) {
        NSMutableArray<NSNumber *> *section = [NSMutableArray array];
        for (int j=0; j<20; j++) {
            CGFloat height = arc4random_uniform(100) + 30.0;
            [section addObject:@(height)];
        }
        [_datas addObject:section];
    }
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.datas.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.datas objectAtIndex:section].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"{%ld,%ld}", indexPath.section, indexPath.item];
    return cell;
}


#pragma mark <XPCollectionViewWaterfallFlowLayoutDelegate>

// 返回第 section 组对应的列数，必须大于0
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(XPCollectionViewWaterfallFlowLayout *)layout numberOfColumnInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else if (section == 1){
        return 2;
    }
    return 4;
}
//返回 indexPath 对应的 item 的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(XPCollectionViewWaterfallFlowLayout *)layout itemWidth:(CGFloat)width heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    //取出每组中 每个item的高度值
    NSNumber *number = self.datas[indexPath.section][indexPath.item];
    return [number floatValue];
}

@end
