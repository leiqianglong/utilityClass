//
//  TreViewController.m
//  绘图
//
//  Created by 公智能 on 2021/5/21.
//

#import "TreViewController.h"

@interface TreViewController ()
@property (nonatomic, assign) CGFloat endAngleFloat; // 每个扇形起点角度
@end

@implementation TreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.endAngleFloat = 0;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //画一个闭合路径，矩形
    UIBezierPath *path0 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 50, 50)];
    //创建一个 CAShapeLayer
    CAShapeLayer *shape0 = [CAShapeLayer layer];
    shape0.path = path0.CGPath;
    //线条宽度
    shape0.lineWidth = 2.0f;
    shape0.frame = CGRectMake(5, 100, 50, 50);
    //线条颜色
    shape0.strokeColor = [UIColor redColor].CGColor;
    shape0.fillColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:shape0];
    [self drawLineAnimation:shape0];
    
    //addLineToPoint 画一个闭合路径
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(0, 0)];//起始点
    [path1 addLineToPoint:CGPointMake(50, 0)];
    [path1 addLineToPoint:CGPointMake(50, 50)];
    [path1 addLineToPoint:CGPointMake(0, 50)];
    [path1 addLineToPoint:CGPointMake(0, 0)];
    //创建一个CAShapeLayer
    CAShapeLayer *shape1 = [CAShapeLayer layer];
    shape1.path = path1.CGPath;
    shape1.lineWidth = 2.f;
    shape1.frame = CGRectMake(60, 100, 50, 50);
    shape1.strokeColor = [UIColor redColor].CGColor;
    //填充色
    shape1.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:shape1];
    [self drawLineAnimation:shape1];
    
    //在所给的矩形中画一个椭圆
    UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 50, 50)];
    CAShapeLayer *shape2 = [CAShapeLayer layer];
    shape2.path = path2.CGPath;
    shape2.lineWidth = 2;
    shape2.frame = CGRectMake(115, 100, 50, 50);
    shape2.strokeColor = [UIColor redColor].CGColor;
    shape2.fillColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:shape2];
    [self drawLineAnimation:shape2];
    
    //在所给的矩形中画一个圆角矩形
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:5];
    CAShapeLayer *shape3 = [CAShapeLayer layer];
    shape3.path = path3.CGPath;
    shape3.lineWidth = 3;
    shape3.frame = CGRectMake(170, 100, 50, 50);
    shape3.strokeColor = [UIColor redColor].CGColor;
    shape3.fillColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:shape3];
    [self drawLineAnimation:shape3];
    
    //花圆角矩形
    UIBezierPath *path4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *shape4 = [CAShapeLayer layer];
    shape4.path = path4.CGPath;
    shape4.lineWidth = 4;
    shape4.frame = CGRectMake(225, 100, 50, 50);
    shape4.strokeColor = [UIColor redColor].CGColor;
    shape4.fillColor = [UIColor cyanColor].CGColor;
    [self.view.layer addSublayer:shape4];
    [self drawLineAnimation:shape4];
    
    //画半圆 center圆心  radius半径 startAngle开始角度 endAngle结束角度 clockwise是否正方向画
    UIBezierPath *path5 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(25, 25) radius:25 startAngle:M_PI endAngle:M_PI * 2 clockwise:YES];
    CAShapeLayer *shape5 = [CAShapeLayer layer];
    shape5.path = path5.CGPath;
    shape5.frame = CGRectMake(280, 100, 50, 50);
    shape5.lineWidth = 3;
    shape5.strokeColor = [UIColor redColor].CGColor;
    shape5.fillColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:shape5];
    [self drawLineAnimation:shape5];
    
    
    UIBezierPath *path6 = [UIBezierPath bezierPath];
    [path6 moveToPoint:CGPointMake(0, 0)];
    [path6 addLineToPoint:CGPointMake(50, 0)];
    [path6 addLineToPoint:CGPointMake(0, 25)];
    [path6 addLineToPoint:CGPointMake(50, 25)];
    [path6 addLineToPoint:CGPointMake(0, 50)];
    [path6 addLineToPoint:CGPointMake(50, 50)];
    CAShapeLayer *shape6 = [CAShapeLayer layer];
    shape6.path = path6.CGPath;
    shape6.lineWidth = 3;
    shape6.frame = CGRectMake(5, 235, 50, 50);
    shape6.strokeColor = [UIColor redColor].CGColor;
    shape6.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:shape6];
    [self drawLineAnimation:shape6];
    
    //三次贝塞尔曲线的弯曲由两个控制点来控制
    UIBezierPath *path7 = [UIBezierPath bezierPath];
    [path7 moveToPoint:CGPointMake(0, 0)];
    [path7 addCurveToPoint:CGPointMake(50, 50) controlPoint1:CGPointMake(0, 25) controlPoint2:CGPointMake(35, 10)];
    CAShapeLayer *shape7 = [CAShapeLayer layer];
    shape7.path = path7.CGPath;
    shape7.lineWidth = 3;
    shape7.frame = CGRectMake(70, 230, 50, 50);
    shape7.strokeColor = [UIColor redColor].CGColor;
    shape7.fillColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:shape7];
    [self drawLineAnimation:shape7];
    
    //closePath回到起始点
    //removeAllPoints删除所有点
    UIBezierPath *path8 = [UIBezierPath bezierPath];
    [path8 moveToPoint:CGPointMake(0, 0)];
    [path8 addQuadCurveToPoint:CGPointMake(50, 0) controlPoint:CGPointMake(25, 50)];
    CAShapeLayer *shape8 = [CAShapeLayer layer];
    shape8.path = path8.CGPath;
    shape8.frame = CGRectMake(115, 235, 50, 50);
    shape8.lineWidth = 3;
    shape8.strokeColor = [UIColor redColor].CGColor;
    shape8.fillColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:shape8];
    [self drawLineAnimation:shape8];
    
    
    UIBezierPath *path9 = [UIBezierPath bezierPath];
    [path9 moveToPoint:CGPointMake(0, 0)];
    [path9 addQuadCurveToPoint:CGPointMake(50, 0) controlPoint:CGPointMake(25, 50)];
    [path9 appendPath:path7];
    CAShapeLayer *shape9 = [CAShapeLayer layer];
    shape9.path = path9.CGPath;
    shape9.lineWidth = 2;
    shape9.frame = CGRectMake(175, 235, 50, 50);
    shape9.strokeColor = [UIColor redColor].CGColor;
    shape9.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:shape9];
    [self drawLineAnimation:shape9];
    
    UIBezierPath *path10 = [UIBezierPath bezierPath];
    [path10 moveToPoint:CGPointMake(10, 25)];
    [path10 addLineToPoint:CGPointMake(40, 25)];
    path10.lineCapStyle = kCGLineCapRound;
    
    CAShapeLayer *shape10 = [CAShapeLayer layer];
    shape10.path = path10.CGPath;
    shape10.lineWidth = 20.f;
    shape10.frame = CGRectMake(230, 235, 50, 50);
    shape10.strokeColor = [UIColor redColor].CGColor;
    shape10.fillColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:shape10];
    [self drawLineAnimation:shape10];
    
    UIBezierPath *path11 = [UIBezierPath bezierPath];
    [path11 moveToPoint:CGPointMake(0, 0)];
    [path11 addLineToPoint:CGPointMake(40, 25)];
    [path11 addLineToPoint:CGPointMake(0, 50)];
    path11.lineJoinStyle = kCGLineJoinMiter;//线条拐点的样式
    path11.miterLimit = 3;// Used when lineJoinStyle is kCGLineJoinMiter -- 描边时使用的斜接限制。默认为10。
    CAShapeLayer *shape11 = [CAShapeLayer layer];
    shape11.path = path11.CGPath;
    shape11.frame = CGRectMake(285, 235, 50, 50);
    shape11.strokeColor = [UIColor redColor].CGColor;
    shape11.fillColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:shape11];
    [self drawLineAnimation:shape11];
    
    //画虚线
    UIBezierPath *path22 = [UIBezierPath bezierPath];
    [path22 moveToPoint:CGPointMake(0, 0)];
    [path22 addLineToPoint:CGPointMake(200, 0)];
    CAShapeLayer *shape22 = [CAShapeLayer layer];
    shape22.path = path22.CGPath;
    shape22.lineWidth = 2;
    shape22.lineDashPattern = @[@4,@4];
    shape22.frame = CGRectMake(20, 320, 200, 50);
    shape22.strokeColor = [UIColor orangeColor].CGColor;
    shape22.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:shape22];
    [self drawLineAnimation:shape22];
    
  
    NSArray *arr = @[@"1",@"4",@"3",@"2",@"8",@"6",@"2",@"8",@"5",@"7",@"4",@"6"];
    [self drawLine:arr];
    
    [self creatCircle];
    [self creatHeart];
}

-(void)drawLineAnimation:(CALayer *)layer{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    ani.duration = 2;
//    ani.delegate = self;
    ani.fromValue = [NSNumber numberWithInteger:0];
    ani.toValue = [NSNumber numberWithInteger:1];
    ani.autoreverses = YES;
    ani.fillMode = kCAFillModeBackwards;
    [layer addAnimation:ani forKey:@"key"];
}


-(void)drawLine:(NSArray *)items{
    
    UIBezierPath *paxisPath = [UIBezierPath bezierPath];
    CGFloat margin = 50;
    CGFloat w = 30;
    CGFloat h = 20;
    
    for (int i = 0; i < items.count; i++) {
        NSString *str = items[i];
        CGFloat value = [str floatValue];
        CGPoint point = CGPointMake(margin + i*w, h * value+10);
        if (i == 0) {
            [paxisPath moveToPoint:point];
        }else{
            [paxisPath addLineToPoint:point];
        }
    }
    
    CAShapeLayer *paxisLayer = [CAShapeLayer layer];
    paxisLayer.frame = CGRectMake(0, 340, self.view.frame.size.width, 200);
    paxisLayer.lineWidth = 3;
    paxisLayer.strokeColor = [UIColor redColor].CGColor;
    paxisLayer.fillColor = [UIColor clearColor].CGColor;
    paxisLayer.path = paxisPath.CGPath;
    [self.view.layer addSublayer:paxisLayer];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"strokeEnd";
    anim.fromValue = [NSNumber numberWithFloat:0];
    anim.toValue = [NSNumber numberWithFloat:1];
    anim.duration = 5;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.autoreverses = NO;
    [paxisLayer addAnimation:anim forKey:@"stroke"];
}

-(void)creatCircle{
    NSArray *array = @[@10,@20,@30,@40];
    for (NSInteger i = 0; i < array.count; i++) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = CGRectMake(0, 600, 240, 240);
        shapeLayer.lineWidth = 1;
        CGFloat r = arc4random()%256/255.0f;
        CGFloat g = arc4random()%256/255.0f;
        CGFloat b = arc4random()%256/255.0f;
        shapeLayer.fillColor = [UIColor colorWithRed:r green:g blue:b alpha:1].CGColor;
        shapeLayer.strokeColor = shapeLayer.fillColor;
        
        CGFloat valueFloat = [[array objectAtIndex:i] floatValue];
        CGFloat angleFloat = valueFloat * 2 * M_PI / 100.0;
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGFloat width = 200;
        [path moveToPoint:CGPointMake(width * 0.5,width * 0.5)];
        [path addLineToPoint:CGPointMake(width *(1+cos(self.endAngleFloat)) / 2, width * (1+sin(self.endAngleFloat)) / 2)];
       [path addArcWithCenter:CGPointMake(width*0.5, width*0.5) radius:width*0.5 startAngle:self.endAngleFloat endAngle:angleFloat+self.endAngleFloat clockwise:YES];
        [path closePath];
        shapeLayer.path = path.CGPath;
        [self.view.layer addSublayer:shapeLayer];
        self.endAngleFloat += angleFloat;
    }
}
-(void)creatHeart{

    HeartView *hv = [[HeartView alloc]init];
    hv.frame = CGRectMake(200, 600, 200, 200);
    [self.view addSubview:hv];
    
    float bigSize = 1.1;
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim.duration = 0.5;
    anim.toValue = [NSNumber numberWithFloat:bigSize];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //倒转动画
    anim.autoreverses = YES;
    anim.repeatCount = FLT_MAX;
    [hv.layer addAnimation:anim forKey:@"transform"];
}
@end




@implementation HeartView : UIView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{

    CGFloat width = self.frame.size.width;
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置一个起始点
    CGPoint startPoint = CGPointMake(width*0.5, 60);
    //以起始点为路径的起点
    [path moveToPoint:startPoint];
    //设置一个终点
    CGPoint endPoint = CGPointMake(width*0.5, width-40);
    //设置一个控制点
    CGPoint controlPoint1 = CGPointMake(50, 10);
    //设置第二个控制点
    CGPoint controlPoint2 = CGPointMake(0, 90);
    //添加三次贝塞尔曲线
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    //设置另一个起始点
    [path moveToPoint:endPoint];
    //设置第三个控制点
    CGPoint controlPoint3 = CGPointMake(width-50, 10);
    //设置第四个控制点
    CGPoint controlPoint4 = CGPointMake(width, 90);
    //添加三次贝塞尔曲线
    [path addCurveToPoint:startPoint controlPoint1:controlPoint4 controlPoint2:controlPoint3];
    //设置线宽
    path.lineWidth = 3;
    //设置线断面类型
    path.lineCapStyle = kCGLineCapRound;
    //设置连接类型
    path.lineJoinStyle = kCGLineJoinRound;
    //设置画笔颜色
    [[UIColor redColor]setFill];
    [path fill];
    [[UIColor yellowColor] setStroke];
    [path stroke];
    
}

@end

