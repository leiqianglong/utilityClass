//
//  MyCollectionViewCell.m
//  FlowLayoutDemo
//
//  Created by 公智能 on 2021/5/11.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell




-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0
                                               green:arc4random_uniform(256)/255.0
                                                blue:arc4random_uniform(256)/255.0
                                               alpha:1.0];
        
        _textLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_textLabel];
        _textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_textLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
        [_textLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    }
    return self;
}

@end
