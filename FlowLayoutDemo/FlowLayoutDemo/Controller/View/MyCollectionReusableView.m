//
//  MyCollectionReusableView.m
//  FlowLayoutDemo
//
//  Created by 公智能 on 2021/5/11.
//

#import "MyCollectionReusableView.h"

@implementation MyCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0
                                               green:arc4random_uniform(256)/255.0
                                                blue:arc4random_uniform(256)/255.0
                                               alpha:1.0];
        _textLabel = [[UILabel alloc] init];
        [self addSubview:_textLabel];
        _textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_textLabel.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [_textLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [_textLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor].active = YES;
        [_textLabel.heightAnchor constraintEqualToAnchor:self.heightAnchor].active = YES;
    }
    return self;
}
@end
