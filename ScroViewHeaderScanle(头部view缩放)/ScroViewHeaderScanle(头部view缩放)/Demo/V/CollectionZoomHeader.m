//
//  CollectionZoomHeader.m
//  ScroViewHeaderScanle(头部view缩放)
//
//  Created by 公智能 on 2021/5/12.
//

#import "CollectionZoomHeader.h"

@implementation CollectionZoomHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    
    CGFloat iconH = 80.0f;
    
    //设置背景图
    self.backgroundImage = [UIImage imageNamed:@"test_backGround"];
    //设置背景图缩进
    self.backgroundImageInsets = UIEdgeInsetsMake(0, 0, iconH/2.0f, 0);
    
    
    //自定义内容
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, iconH, iconH)];
    icon.image = [UIImage imageNamed:@"test_icon"];
    icon.center = CGPointMake(iconH/2.0f + 10, self.bounds.size.height - iconH/2.0f);
    icon.layer.cornerRadius = iconH/2.0f;
    icon.clipsToBounds = true;
    icon.layer.borderWidth = 2;
    icon.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:icon];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(icon.frame) + 10, self.bounds.size.height - iconH/2.0f, 200, iconH/2.0f)];
    nameLabel.text = @"Nick Wilde";
    nameLabel.font = [UIFont boldSystemFontOfSize:17];
    [self addSubview:nameLabel];
}
@end
