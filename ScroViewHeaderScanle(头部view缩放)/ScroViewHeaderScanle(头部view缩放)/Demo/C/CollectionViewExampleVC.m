//
//  CollectionViewExampleVC.m
//  ScroViewHeaderScanle(头部view缩放)
//
//  Created by 公智能 on 2021/5/12.
//

#import "CollectionViewExampleVC.h"
#import "CollectionZoomHeader.h"

@interface CollectionViewExampleVC ()<UICollectionViewDelegate,UICollectionViewDataSource> {
    UICollectionView *_collectionView;
    UISegmentedControl *_segment;
}

@end

@implementation CollectionViewExampleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

-(void)buildUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat margin = 5.0f;
    CGFloat itemW = (self.view.bounds.size.width - 4*margin)/3.0f;
    CGFloat itemH = itemW * 1.5;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    layout.sectionInset = UIEdgeInsetsMake(margin, margin, 0, margin);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:_collectionView];
    
    CollectionZoomHeader *header = [[CollectionZoomHeader alloc] initWithFrame:CGRectMake(0, 0, _collectionView.bounds.size.width, 180)];
    _collectionView.xl_zoomHeader = header;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"UICollectionViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.layer.borderWidth = 1.0f;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    return cell;
}
@end
