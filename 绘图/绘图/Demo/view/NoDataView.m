//
//  NoDataView.m
//  绘图
//
//  Created by 公智能 on 2021/5/25.
//

#import "NoDataView.h"

@implementation NoDataView


- (void)drawRect:(CGRect)rect {
    CGAffineTransform transform = CGAffineTransformMakeTranslation((self.bounds.size.width-50*5)/2, 10);
    transform = CGAffineTransformScale(transform, 5, 5);

    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:10];
    [path1 applyTransform:transform];
    [kColor setStroke];
    [path1 stroke];

    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
    [path2 applyTransform:transform];
    [kColor setFill];
    [path2 fill];

    UIBezierPath *path3 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
    [path3 applyTransform:transform];
    [kColor setStroke];
    [path3 stroke];

    UIBezierPath *path11 = [UIBezierPath bezierPath];
    [path11 moveToPoint:CGPointMake(28, 10)];
    [path11 addLineToPoint:CGPointMake(43, 10)];
    [path11 applyTransform:transform];
    [kColor setStroke];
    [path11 stroke];

    UIBezierPath *path12 = [UIBezierPath bezierPath];
    [path12 moveToPoint:CGPointMake(28, 16)];
    [path12 addLineToPoint:CGPointMake(43, 16)];
    [path12 applyTransform:transform];
    [path12 stroke];

    UIBezierPath *path13 = [UIBezierPath bezierPath];
    [path13 moveToPoint:CGPointMake(28, 22)];
    [path13 addLineToPoint:CGPointMake(43, 22)];
    [path13 applyTransform:transform];
    [path13 stroke];

    UIBezierPath *path21 = [UIBezierPath bezierPath];
    [path21 moveToPoint:CGPointMake(7, 28)];
    [path21 addLineToPoint:CGPointMake(43, 28)];
    [path21 applyTransform:transform];
    [path21 stroke];

    UIBezierPath *path22 = [UIBezierPath bezierPath];
    [path22 moveToPoint:CGPointMake(7, 34)];
    [path22 addLineToPoint:CGPointMake(43, 34)];
    [path22 applyTransform:transform];
    [path22 stroke];

    UIBezierPath *path23 = [UIBezierPath bezierPath];
    [path23 moveToPoint:CGPointMake(7, 40)];
    [path23 addLineToPoint:CGPointMake(43, 40)];
    [path23 applyTransform:transform];
    [path23 stroke];
}


@end
