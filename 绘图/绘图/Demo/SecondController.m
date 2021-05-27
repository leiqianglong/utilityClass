//
//  SecondController.m
//  绘图
//
//  Created by 公智能 on 2021/5/18.
//

#import "SecondController.h"

@interface SecondController ()
@property (strong, nonatomic) NSMutableArray<UIButton *> *arrM;
@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.baseView.frame = CGRectMake(0, 0, self.view.frame.size.width, 1000);
    NSArray *arr = @[@"位置",@"缩放",@"旋转",@"位移",@"圆角",@"边框",@"颜色渐变",@"淡入淡出"];
    for (int i = 0; i < arr.count; i++) {
        CGFloat y = (i * 100) + i*20;
        UIButton *v = [self creatView:y];
        [v setTitle:arr[i] forState:(UIControlStateNormal)];
        v.tag = i;
        [self.baseView addSubview:v];
        [self.arrM addObject:v];
    }
}
/*
 下面来讲各个fillMode的意义
 kCAFillModeRemoved 这个是默认值,也就是说当动画开始前和动画结束后,动画对layer都没有影响,动画结束后,layer会恢复到之前的状态
 kCAFillModeForwards 当动画结束后,layer会一直保持着动画最后的状态
 kCAFillModeBackwards 这个和kCAFillModeForwards是相对的,就是在动画开始前,你只要将动画加入了一个layer,layer便立即进入动画的初始状态并等待动画开始.你可以这样设定测试代码,将一个动画加入一个layer的时候延迟5秒执行.然后就会发现在动画没有开始的时候,只要动画被加入了layer,layer便处于动画初始状态
 kCAFillModeBoth 理解了上面两个,这个就很好理解了,这个其实就是上面两个的合成.动画加入后开始之前,layer便处于动画初始状态,动画结束后layer保持动画最后的状态.
 */
-(void)btnClick:(UIButton *)sender{
    UIButton *button = [self.arrM objectAtIndex:sender.tag];
    CABasicAnimation *ani = [CABasicAnimation animation];
    ani.duration = 2;
    ani.fillMode = kCAFillModeForwards;
    ani.removedOnCompletion = NO;
    
    switch (sender.tag) {
        case 0:
        {
            ani.keyPath = @"position";
            CGPoint point = CGPointMake(button.bounds.origin.x-10, button.bounds.origin.y+10);
            ani.toValue = [NSValue valueWithCGPoint:point];
            ani.fillMode = kCAFillModeBackwards;
        }
            break;
        case 1:
        {
            ani.keyPath = @"transform.scale.x";
            ani.fromValue = @(1.0);
            ani.toValue = @(0.8);
        }
            break;
        case 2:
        {
            ani.keyPath = @"transform.rotation";
            ani.fromValue = @(M_PI_2);
            ani.toValue = @(3.0);
        }
            break;
        case 3:
        {
            ani.keyPath = @"transform.translation.y";
            ani.toValue = @(100.0);
            ani.fillMode = kCAFillModeRemoved;
        }
            break;
        case 4:
        {
            ani.keyPath = @"cornerRadius";
            ani.toValue = @(50.0);
        }
            break;
        case 5:
        {
            ani.keyPath = @"borderWidth";
            ani.toValue = @(15.0);
        }
            break;
        case 6:
        {
            ani.keyPath = @"backgroundColor";
            ani.fromValue = (__bridge id _Nullable)([UIColor greenColor].CGColor);
            ani.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
        }
            break;
        case 7:
        {
            ani.keyPath = @"opacity";
            ani.fromValue = @(0);
            ani.toValue = @(1);
        }
            break;
        default:
            break;
    }
    [button.layer addAnimation:ani forKey:@"anim"]; 
}
-(UIButton *)creatView:(CGFloat)paddingTop{
    UIButton *view = [[UIButton alloc]init];
    view.frame = CGRectMake(50, paddingTop, 300, 100);
    view.backgroundColor = [self randomColor];
    [view addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    return view;
}
-(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
-(NSMutableArray *)arrM{
    if (!_arrM) {
        _arrM = [NSMutableArray array];
    }
    return _arrM;
}
@end
