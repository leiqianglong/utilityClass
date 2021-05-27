//
//  QLProgressView.m
//  绘图
//
//  Created by 公智能 on 2021/5/25.
//

#import "QLProgressView.h"
///进度条背景色
#define kPVBackgroundColor [UIColor colorWithRed:237/255.0 green:244/255.0 blue:254/255.0 alpha:1]
//默认半径就是上层渐变层头部圆的半径
//半径偏差量就是上层渐变层头部圆与底层进度条圆角的差值
#define kPVRadiusOffSet 2.5

@interface QLProgressView()
///渐变层
@property (strong, nonatomic) CAShapeLayer *gradientLayer;
///底部层
@property (strong, nonatomic) CAShapeLayer *backLayer;
///最上面小圆层
@property (strong, nonatomic) CAShapeLayer *circleLayer;
@end


@implementation QLProgressView
{
    ///view的宽度
    CGFloat _frameW;
    ///view的高度
    CGFloat _frameH;
    ///大圆的半径
    CGFloat _bigRadius;
    ///小圆的半径
    CGFloat _smallRadius;
}
-(instancetype)init{
    if (self = [super init]) {
        [self setupLayers];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupLayers];
    }
    return self;
}
-(void)layoutSublayersOfLayer:(CALayer *)layer{
    _frameW = layer.frame.size.width;
    _frameH = layer.frame.size.height;
    _bigRadius = _frameH * 0.5;
    _smallRadius = _bigRadius - kPVRadiusOffSet;
    
    [self setupLayers];
    self.progress = _progress;
}
- (void)setupLayers {
    self.backLayer = [CAShapeLayer layer];
    self.backLayer.fillColor = kPVBackgroundColor.CGColor;
    UIBezierPath *backPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, kPVRadiusOffSet, _frameW, _smallRadius*2) cornerRadius:_smallRadius];
    self.backLayer.path = backPath.CGPath;
    [self.layer addSublayer:self.backLayer];
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    CGFloat currentX = _frameW * progress / 100.0; //当前进度x坐标
    self.gradientLayer = [CAShapeLayer layer];
    self.gradientLayer.fillColor = [UIColor redColor].CGColor;
    UIBezierPath *colorPath = [UIBezierPath bezierPath];
    [colorPath moveToPoint:CGPointMake(0, _bigRadius)];
    [colorPath addArcWithCenter:CGPointMake(_smallRadius, _bigRadius) radius:_smallRadius startAngle:M_PI endAngle:3*M_PI_2 clockwise:YES];
    [colorPath addLineToPoint:CGPointMake(currentX-20-2, kPVRadiusOffSet)];
    
    //三阶曲线
    [colorPath addCurveToPoint:CGPointMake(currentX, 0) controlPoint1:CGPointMake(currentX-15, kPVRadiusOffSet) controlPoint2:CGPointMake(currentX-5, 0)];
    [colorPath addArcWithCenter:CGPointMake(currentX, _bigRadius) radius:_bigRadius startAngle:3*M_PI_2 endAngle:5*M_PI_2 clockwise:YES];
    [colorPath addCurveToPoint:CGPointMake(currentX - 20, _frameH - kPVRadiusOffSet) controlPoint1:CGPointMake(currentX - 5, _frameH) controlPoint2:CGPointMake(currentX - 15, _frameH - kPVRadiusOffSet)];
    [colorPath addLineToPoint:CGPointMake(_smallRadius, _frameH-kPVRadiusOffSet)];
    [colorPath addArcWithCenter:CGPointMake(_smallRadius, _bigRadius) radius:_smallRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    
    colorPath.flatness = 0.6;
    [colorPath closePath];
    self.gradientLayer.path = colorPath.CGPath;
    
    //渐变色
    CAGradientLayer *glayer = [CAGradientLayer layer];
    glayer.colors = @[(__bridge id)[UIColor colorWithRed:76/255.0 green:194/255.0 blue:255/255.0 alpha:1].CGColor,
                      (__bridge id)[UIColor colorWithRed:75/255.0 green:137/255.0 blue:230/255.0 alpha:1].CGColor];
    glayer.locations = @[@0.3,@1.0];
    glayer.startPoint = CGPointMake(0, 0);
    glayer.endPoint = CGPointMake(1.0, 0);
    glayer.frame = CGRectMake(0, 0, currentX+_bigRadius, _frameH);
    glayer.mask = self.gradientLayer;
    [self.layer addSublayer:glayer];
    
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"strokeEnd";
//    anim.fromValue = [NSNumber numberWithFloat:0];
//    anim.toValue = [NSNumber numberWithFloat:1];
//    anim.duration = 5;
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim.autoreverses = NO;
//    [self.gradientLayer addAnimation:anim forKey:@"stroke"];
    
    //进度条头部圆形layer
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.fillColor = kPVBackgroundColor.CGColor;
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    [circlePath moveToPoint:CGPointMake(currentX-_smallRadius, _bigRadius)];
    [circlePath addArcWithCenter:CGPointMake(_frameW*progress/100-1, _bigRadius) radius:_smallRadius startAngle:M_PI endAngle:M_PI*3 clockwise:YES];
    self.circleLayer.path = circlePath.CGPath;
    [self.layer addSublayer:self.circleLayer];
    
    
}
@end
