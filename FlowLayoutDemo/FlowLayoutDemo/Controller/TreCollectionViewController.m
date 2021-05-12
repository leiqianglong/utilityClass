//
//  TreCollectionViewController.m
//  FlowLayoutDemo
//
//  Created by 公智能 on 2021/5/11.
//

#import "TreCollectionViewController.h"
#import "MyCollectionReusableView.h"
#import "MyCollectionViewCell.h"

@interface TreCollectionViewController ()
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber *> *> *datas;

@end

@implementation TreCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const headerReuseIdentifier = @"Header";
static NSString * const footerReuseIdentifier = @"Footer";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义首页";
    [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[MyCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerReuseIdentifier];
    [self.collectionView registerClass:[MyCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerReuseIdentifier];
    
    //模拟数据
    [self initData];
    
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

#pragma mark <UICollectionViewDelegate>
//设置 头部脚部 的 视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = (kind==UICollectionElementKindSectionHeader) ? headerReuseIdentifier : footerReuseIdentifier;
    MyCollectionReusableView *view = (MyCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:indexPath];
    view.textLabel.text = [NSString stringWithFormat:@"%@ == %ld", identifier, indexPath.section];
    return view;
}

#pragma mark <XPCollectionViewWaterfallFlowLayoutDelegate>
// 返回第 section 组对应的列数，必须大于0
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(XPCollectionViewWaterfallFlowLayout *)layout numberOfColumnInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 3;
    }else if (section == 2){
        return 2;
    }else if (section == 3){
        return 4;
    }
    return  2;
}
// 返回 indexPath 对应的 item 的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(XPCollectionViewWaterfallFlowLayout *)layout itemWidth:(CGFloat)width heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *number = self.datas[indexPath.section][indexPath.item];
    return [number floatValue];
}
//每个 section 的边缘边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(XPCollectionViewWaterfallFlowLayout *)layout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
}
//设置item 每行之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(XPCollectionViewWaterfallFlowLayout*)layout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0;
}
//设置item 每列之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(XPCollectionViewWaterfallFlowLayout*)layout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0;
}

/**返回header的高度*/
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(XPCollectionViewWaterfallFlowLayout *)layout referenceHeightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

/**返回footer的高度*/
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(XPCollectionViewWaterfallFlowLayout *)layout referenceHeightForFooterInSection:(NSInteger)section {
    return 40.0;
}



-(void)initData{
    _datas = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        NSMutableArray<NSNumber *> *section = [NSMutableArray array];
        if (i == 0) {
            [section addObject:@(100)];
        }else if (i == 1) {
            for (int j=0; j<5; j++) {
                CGFloat height = 0.0;
                if (j == 0) {
                    height = 110;
                }else{
                    height = 50;
                }
                [section addObject:@(height)];
            }
        }else if (i == 2){
            for (int j=0; j<4; j++) {
                CGFloat height = 0.0;
                if (j == 0 || j == 3) {
                    height = 70;
                }else{
                    height = 100;
                }
                [section addObject:@(height)];
            }
        }else if(i == 3){
            for (int j=0; j<8; j++) {
                CGFloat height = 50.0;
                [section addObject:@(height)];
            }
        }
        else{
            for (int j=0; j<3; j++) {
                CGFloat height = 0.0;
                if (j == 0 || j == 2) {
                    height = 80;
                }else{
                    height = 170;
                }
                [section addObject:@(height)];
            }
        }
        [_datas addObject:section];
    }
}
@end
