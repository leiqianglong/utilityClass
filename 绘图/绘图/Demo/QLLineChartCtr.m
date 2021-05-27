//
//  QLLineChartCtr.m
//  绘图
//
//  Created by 公智能 on 2021/5/26.
//

#import "QLLineChartCtr.h"
#import "QLChartView.h"

@interface QLLineChartCtr ()
@property (nonatomic, strong) QLChartView *lineView;
@property (nonatomic, strong) QLChartView *lineView1;
@property (nonatomic, strong) QLChartView *lineView2;
@property (nonatomic, strong) QLChartView *lineView3;
@property (nonatomic, strong) QLChartView *lineView4;
@property (nonatomic, strong) QLChartView *lineView5;
@end

@implementation QLLineChartCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseView.frame = CGRectMake(0, 0, self.view.frame.size.width, 1100);
    self.baseView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
  
    //渲染折线图
    [self.lineView drawLineChart];
    [self.lineView1 drawLineChart];
    [self.lineView2 drawLineChart];
    [self.lineView3 drawLineChart];
    [self.lineView4 drawLineChart];
    [self.lineView5 drawLineChart];
    
    
    
}

-(QLChartView *)lineView{
    if (!_lineView) {
        _lineView = [[QLChartView alloc]initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 200)];
        _lineView.max = @600.1111;//纵轴最大值
        _lineView.min = @300;//纵轴最小值
        //底部横向显示文字
        _lineView.horizontalDataArr = @[@"2020-02", @"2020-03", @"2020-04", @"2020-05", @"2020-06", @"2020-07",@"2020-08",@"2020-09",@"2020-10",@"2020-11",@"2020-12"];
        //折线关键点
        _lineView.lineDataAry = @[@332, @523, @582, @455, @373, @346,@544,@443,@501,@400,@433];
        _lineView.splitCount = 3; //Y轴分割个数
        _lineView.toCenter = NO;//关键点居中显示，默认yes
        _lineView.edge = UIEdgeInsetsMake(25, 15, 50, 25);//边界距离
        [self.baseView addSubview:_lineView];
    }
    return _lineView;
}

-(QLChartView *)lineView1{
    if (!_lineView1) {
        _lineView1 = [[QLChartView alloc]initWithFrame:
                      CGRectMake(0,
                                 CGRectGetMaxY(self.lineView.frame)+10,
                                 self.view.frame.size.width,
                                 200)];
        _lineView1.max = @600;//纵轴最大值
        _lineView1.min = @300;//纵轴最小值
        //底部横向显示文字
        _lineView1.horizontalDataArr = @[@"2020-02", @"2020-03", @"2020-04", @"2020-05", @"2020-06", @"2020-07",@"2020-08",@"2020-09",@"2020-10",@"2020-11",@"2020-12"];
        //折线关键点
        _lineView1.lineDataAry = @[@432, @523, @482, @355, @473, @546,@344,@543,@501,@400,@433];
        _lineView1.splitCount = 3; //Y轴分割个数
        _lineView1.supplement = YES;//toCenter=YES时是否补充前后显示（默认NO）,即关键点在两个横坐标中间显示
        _lineView1.bottomOffset = 15;//底部文本上下偏移
        [self.baseView addSubview:_lineView1];
    }
    return _lineView1;
}

-(QLChartView *)lineView2{
    if (!_lineView2) {
        _lineView2 = [[QLChartView alloc]initWithFrame:
                      CGRectMake(0,
                                 CGRectGetMaxY(self.lineView1.frame)+10,
                                 self.view.frame.size.width,
                                 200)];
        _lineView2.max = @1000;//纵轴最大值
        _lineView2.min = @400;//纵轴最小值
        //底部横向显示文字
        _lineView2.horizontalDataArr = @[@"2020-02", @"2020-03", @"2020-04", @"2020-05", @"2020-06", @"2020-07", @"2020-08"];
        //折线关键点
        _lineView2.lineDataAry = @[@502, @723, @682, @955, @473, @546, @846];
        _lineView2.splitCount = 4; //Y轴分割个数
        _lineView2.angle = 0;//底部文本旋转角度
        _lineView2.bottomOffset = 10;
        _lineView2.addCurve = NO;//贝塞尔曲线绘制增加曲度控制，默认yes（设置为NO 即使直线连接）
        _lineView2.edge = UIEdgeInsetsMake(25, 15, 30, 25);
        _lineView2.lineColor = [UIColor redColor];//折线颜色
        //渐变颜色集合
        _lineView2.colorArr = [NSArray arrayWithObjects:(id)[[[UIColor redColor] colorWithAlphaComponent:0.4] CGColor],(id)[[[UIColor whiteColor] colorWithAlphaComponent:0.1] CGColor], nil];
        [self.baseView addSubview:_lineView2];
    }
    return _lineView2;
}

-(QLChartView *)lineView3{
    if (!_lineView3) {
        _lineView3 = [[QLChartView alloc]initWithFrame:
                      CGRectMake(0,
                                 CGRectGetMaxY(self.lineView2.frame)+10,
                                 self.view.frame.size.width,
                                 200)];
        _lineView3.max = @700;//纵轴最大值
        _lineView3.min = @300;//纵轴最小值
        //底部横向显示文字
        _lineView3.horizontalDataArr = @[@"2020-02", @"2020-03", @"2020-04", @"2020-05", @"2020-06", @"2020-07"];
        //折线关键点
        _lineView3.lineDataAry = @[@502, @623, @482, @355, @473, @546];
        _lineView3.splitCount = 2; //Y轴分割个数
        _lineView3.textColor = [UIColor orangeColor];
        _lineView3.circleStrokeColor = [UIColor orangeColor];//关键点边框颜色
        _lineView3.horizontalLineColor = [UIColor redColor];//横向分割线的颜色
        _lineView3.horizontalBottomLineColor = [UIColor redColor];//底部横向分割线颜色（X轴）
        _lineView3.dataTextColor = [UIColor orangeColor];
        _lineView3.lineColor = [UIColor orangeColor];
        _lineView3.lineWidth = 2;
        
        //渐变颜色集合
        _lineView3.colorArr = [NSArray arrayWithObjects:(id)[[[UIColor redColor] colorWithAlphaComponent:0.4] CGColor],(id)[[[UIColor whiteColor] colorWithAlphaComponent:0.1] CGColor], nil];
        [self.baseView addSubview:_lineView3];
    }
    return _lineView3;
}


-(QLChartView *)lineView4{
    if (!_lineView4) {
        _lineView4 = [[QLChartView alloc]initWithFrame:
                      CGRectMake(0,
                                 CGRectGetMaxY(self.lineView3.frame)+10,
                                 self.view.frame.size.width,
                                 200)];
        _lineView4.max = @700;//纵轴最大值
        _lineView4.min = @300;//纵轴最小值
        //底部横向显示文字
        _lineView4.horizontalDataArr = @[@"2020-02", @"2020-03", @"2020-04", @"2020-05", @"2020-06", @"2020-07"];
        //折线关键点
        _lineView4.lineDataAry = @[@502, @623, @482, @555, @473, @546];
        _lineView4.splitCount = 2; //Y轴分割个数
        _lineView4.showColorGradient = NO;//是否填充颜色渐变（默认yes）
        _lineView4.dataTextColor = [UIColor redColor];
        _lineView4.circleStrokeColor = [UIColor orangeColor];//关键点边框颜色
        _lineView4.horizontalBottomLineColor = [UIColor orangeColor];//底部横向分割线颜色（X轴）
        _lineView4.edge = UIEdgeInsetsMake(25, 5, 50, 15);
        [self.baseView addSubview:_lineView4];
    }
    return _lineView4;
}


-(QLChartView *)lineView5{
    if (!_lineView5) {
        _lineView5 = [[QLChartView alloc]initWithFrame:
                      CGRectMake(0,
                                 CGRectGetMaxY(self.lineView3.frame)+10,
                                 self.view.frame.size.width,
                                 200)];
        _lineView5.max = @600;//纵轴最大值
        _lineView5.min = @300;//纵轴最小值
        //底部横向显示文字
        _lineView5.horizontalDataArr = @[@"2020-02", @"2020-03", @"2020-04", @"2020-05", @"2020-06", @"2020-07"];
        //折线关键点
        _lineView5.lineDataAry = @[@422, @523, @482, @555, @373, @446];
        _lineView5.splitCount = 3; //Y轴分割个数
        //是否只显示X轴头尾,无需显示的文本赋空值可达到同样效果
        _lineView5.isShowHeadTail = YES;
        _lineView5.edge = UIEdgeInsetsMake(25, 15, 50, 25);
        [self.baseView addSubview:_lineView5];
    }
    return _lineView5;
}

@end
