//
//  FirstViewController.m
//  绘图
//
//  Created by 公智能 on 2021/5/17.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CAShapeLayer属性介绍";
    self.view.backgroundColor = [UIColor whiteColor];

    self.baseView.frame = CGRectMake(0, 0, self.view.frame.size.width, 1800);

    [self initUI2];
    [self initUI3];
    [self initRect];
    [self initCircle];
    [self initRoundRect];
    [self initsin];
    [self initLine];
    [self initCurve];
    [self initAnimaiCirlc];
    [self initMaskView];
    [self initMaskView2];
    [self initShape];
    [self initShape2];

}


-(void)initUI2{
    CAShapeLayer *layer = [CAShapeLayer layer];
    //设置layer的尺寸
    layer.frame = CGRectMake(20, 100, 100, 100);
    //设置背景色
    layer.backgroundColor = [UIColor cyanColor].CGColor;
    //设置描边颜色
    layer.strokeColor = [UIColor blackColor].CGColor;
    //设置填充颜色
    layer.fillColor = [UIColor redColor].CGColor;
    
    [self.baseView.layer addSublayer:layer];
    
    /*
     郁闷点：
       为啥设置的 描边色  和 填充色 没有作用.
       这是因为这两种颜色需要UIBezierPath 来绘制路径，然后使用CAShapeLayer进行渲染。
     **/
    
}
-(void)initUI3{
    CAShapeLayer *layer = [CAShapeLayer layer];
    //设置layer的尺寸
    layer.frame = CGRectMake(150, 100, 100, 100);
    //设置背景色
    layer.backgroundColor = [UIColor redColor].CGColor;
    //设置描边颜色
    layer.strokeColor = [UIColor greenColor].CGColor;
    //设置填充颜色
    layer.fillColor = [UIColor orangeColor].CGColor;
    
    [self.baseView.layer addSublayer:layer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 80,60)];
    layer.path = path.CGPath;
    
}
//绘制矩形
-(void)initRect{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(50, 230, 100, 100);
    //设置描边色
    layer.strokeColor = [UIColor brownColor].CGColor;
    //设置填充色
    layer.fillColor = [UIColor clearColor].CGColor;
    [self.baseView.layer addSublayer:layer];
    layer.path = path.CGPath;
}
//绘制圆形
-(void)initCircle{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(200, 230, 100, 100);
    //设置描边色
    layer.strokeColor = [UIColor brownColor].CGColor;
    //设置填充色
    layer.fillColor = [UIColor clearColor].CGColor;
    [self.baseView.layer addSublayer:layer];
    layer.path = path.CGPath;
}
//绘制圆角矩形
-(void)initRoundRect{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:30];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(50, 350, 100, 100);
    //设置描边色
    layer.strokeColor = [UIColor brownColor].CGColor;
    //设置填充色
    layer.fillColor = [UIColor clearColor].CGColor;
    [self.baseView.layer addSublayer:layer];
    layer.path = path.CGPath;
    
    
    //例2
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(50, 50)];
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.frame = CGRectMake(200, 350, 100, 100);
    //设置描边色
    layer2.strokeColor = [UIColor brownColor].CGColor;
    //设置填充色
    layer2.fillColor = [UIColor clearColor].CGColor;
    [self.baseView.layer addSublayer:layer2];
    layer2.path = path2.CGPath;
}

//绘制正弦曲线
-(void)initsin{
    UIBezierPath *path = [self startPoint:CGPointMake(50, 560) endPoint:CGPointMake(200, 560) controlPoint:CGPointMake(125, 400)];
    CAShapeLayer *layer = [self createShapeLayer:[UIColor orangeColor]];
    layer.path = path.CGPath;
    
    UIBezierPath *path2 = [self startPoint:CGPointMake(200, 560) endPoint:CGPointMake(350, 560) controlPoint:CGPointMake(275, 720)];
    CAShapeLayer *layer2 = [self createShapeLayer:[UIColor orangeColor]];
    layer2.path = path2.CGPath;

}
/**
 配置贝塞尔曲线
 @param startPoint 起始点
 @param endPoint 结束点
 @param controlPoint 控制点
 @return UIBezierPath对象
 */
- (UIBezierPath *)startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    return path;
}
- (CAShapeLayer *)createShapeLayer:(UIColor *)color
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    //    layer.frame = CGRectMake(0, 0, 50, 50);
    //设置背景色
    //    layer.backgroundColor = [UIColor cyanColor].CGColor;
    //设置描边色
    layer.strokeColor = [UIColor blackColor].CGColor;
    //设置填充色
    layer.fillColor = color.CGColor;
    [self.baseView.layer addSublayer:layer];
    
    return layer;
}

-(void)initLine{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 650)];
    [path addLineToPoint:CGPointMake(200, 650)];
    [path addLineToPoint:CGPointMake(300, 650)];
    
    CABasicAnimation *aniam = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //每次动画的持续时间
    aniam.duration = 8;
    //动画的起始位置
    aniam.fromValue = @(0);
    //动画的结束位置
    aniam.toValue = @(1);
    //动画的重复次数
    aniam.repeatCount = 100;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.frame = CGRectMake(50, 650, 300, 30);
    layer.backgroundColor = [UIColor cyanColor].CGColor;
    layer.fillColor = [UIColor redColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    
    layer.path = path.CGPath;
    layer.lineWidth = 2.0;
    [layer addAnimation:aniam forKey:@"strokeEndAnimation"];
    
    [self.baseView.layer addSublayer:layer];
}

-(void)initCurve{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 750)];
    //结束点 两个控制点
    [path addCurveToPoint:CGPointMake(330, 750) controlPoint1:CGPointMake(125, 500) controlPoint2:CGPointMake(185, 900)];
    
    CABasicAnimation *animi = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animi.duration = 8;
    animi.fromValue = @(0);
    animi.toValue = @(1);
    animi.repeatCount = 100;
    
    
    CAShapeLayer *layer = [self createShapeLayer:[UIColor clearColor]];
    layer.path = path.CGPath;
    layer.lineWidth = 2;
    [layer addAnimation:animi forKey:@"strokeEndAnimation"];
    
}

-(void)initAnimaiCirlc{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(150, 800, 150, 150)];
    
    CABasicAnimation *animai = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animai.duration = 8.;
    animai.fromValue = @(0);
    animai.toValue = @(1);
    animai.repeatCount = 100;
    
    CAShapeLayer *layer = [self createShapeLayer:[UIColor clearColor]];
    layer.path = path.CGPath;
    layer.lineWidth = 10;
    //圆的起始位置，默认0
    layer.strokeStart = 0;
    //圆的结束为止，默认1，如果为0.75，则显示3/4的圆
    layer.strokeEnd = 1;
    [layer addAnimation:animai forKey:@"lql"];
    
}


-(void)initMaskView{
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.frame = CGRectMake(20, 970, 200, 200);
    backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    [self.baseView addSubview:backgroundView];
    
    //创建一个全屏大的path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:backgroundView.bounds];
    //创建一个圆形path
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:20 startAngle:0 endAngle:2*M_PI clockwise:NO];
    
    [path appendPath:circlePath];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    backgroundView.layer.mask = shapeLayer;
}

-(void)initMaskView2{
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.frame = CGRectMake(20, 1200, 200, 200);
    backgroundView.backgroundColor = [UIColor clearColor];
    [self.baseView addSubview:backgroundView];
    
    //创建一个全屏大的path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:backgroundView.bounds];
    //创建一个圆形path
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:20 startAngle:0 endAngle:2*M_PI clockwise:NO];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    shapeLayer.fillColor = [UIColor greenColor].CGColor;
    shapeLayer.opacity = 0.5;
    
    [backgroundView.layer addSublayer:shapeLayer];
}

-(void)initShape{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 1400, self.view.frame.size.width, 200)];
    view.backgroundColor = [UIColor whiteColor];
    [self.baseView addSubview:view];

    CGFloat left = 20;
    CGFloat top = 90;
    CGFloat width = self.view.frame.size.width;
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [[UIBezierPath alloc]init];
    //起始点
    [path moveToPoint:CGPointMake(left, top)];
    [path addLineToPoint:CGPointMake(left, 199)];
    [path addLineToPoint:CGPointMake(width-left, 199)];
    [path addLineToPoint:CGPointMake(width-left, top)];

    //突出点
    [path addQuadCurveToPoint:CGPointMake(left, top) controlPoint:CGPointMake(width * 0.5,top - 50)];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor greenColor].CGColor;
    [view.layer addSublayer:layer];
  
}

-(void)initShape2{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 1600, self.view.frame.size.width, 200)];
    view.backgroundColor = [UIColor whiteColor];
    [self.baseView addSubview:view];
    
    CGFloat left = 20;
    CGFloat top = 140;
    CGFloat width = self.view.frame.size.width;
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [[UIBezierPath alloc]init];
    //起始点
    [path moveToPoint:CGPointMake(left, top)];
    [path addLineToPoint:CGPointMake(left, 199)];
    [path addLineToPoint:CGPointMake(width-left, 199)];
    [path addLineToPoint:CGPointMake(width-left, top)];

    //突出点
    [path addQuadCurveToPoint:CGPointMake(left, top) controlPoint:CGPointMake(width * 0.5,250)];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor yellowColor].CGColor;
    layer.strokeColor = [UIColor greenColor].CGColor;
    [view.layer addSublayer:layer];
    
}
@end
         
