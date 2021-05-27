//
//  QLChart2Controller.m
//  绘图
//
//  Created by 公智能 on 2021/5/26.
//

#import "QLChart2Controller.h"
#import "LHYChartView.h"
@interface QLChart2Controller ()

@end

@implementation QLChart2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseView.frame = CGRectMake(0, 0, self.view.frame.size.width, 1500);
    self.baseView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    [self addFirstChartView];
    [self addSecChartView];
    [self addTreChartView];
    [self heartChart];
    [self addFourChartView];
    
    
}

-(void)addFirstChartView{
    LHYChartView *chartView = [[LHYChartView alloc]initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-20, 300)];
    [self.baseView addSubview:chartView];
    //是否默认选中第一个
//    incomeChartLineView.isShowFirstPaoPao = YES;
    chartView.showPaoPaoForIndex = 6;
    //是否有网格
    chartView.isGrid = YES;
    //是否显示所有点
    chartView.isShow = YES;
    //是否可以浮动
    chartView.isFloating = NO;
    //显示多少行
    chartView.row = 8;
    //显示多少列
    chartView.xRow = 10;
    //设置X轴坐标字体大小
    chartView.x_Font = [UIFont systemFontOfSize:10];
    //设置X轴坐标字体颜色
    chartView.x_Color = [UIColor colorWithHexString:@"#999999"];
    //设置Y轴坐标字体大小
    chartView.y_Font = [UIFont systemFontOfSize:10];
    //设置Y轴坐标字体颜色
    chartView.y_Color = [UIColor colorWithHexString:@"#999999"];
    //设置背景颜色
    chartView.backgroundColor = [UIColor whiteColor];
    //边框标线颜色
    chartView.borderLineColor = [UIColor colorWithHexString:@"#999999"];
    //中间标线颜色
    chartView.middleLineColor = [UIColor colorWithHexString:@"#cbcbcb" andAlpha:0.5];
    //边框三角颜色
    chartView.borderTriangleColor = [UIColor colorWithHexString:@"#999999"];
    //设置泡泡背景颜色
    chartView.paopaoBackGroundColor = [UIColor colorWithHexString:@"#000000" andAlpha:0.85];
    chartView.markColor = [UIColor colorWithHexString:@"#333333"];
    //设置泡泡的标题颜色
    chartView.paopaoTitleColor = [UIColor whiteColor];
    //设置折线样式
    chartView.chartViewStyle = LHYChartViewMoreClickLine;
    //设置图层效果
    chartView.chartLayerStyle = LHYChartGradient;
    //设置折现效果
    chartView.lineLayerStyle = LHYLineLayerNone;
    
    chartView.lineWidth = 3;
    
    chartView.paopaoBackGroundColor = [UIColor colorWithHexString:@"#111111" andAlpha:0.5];
    //渐变开始比例
    chartView.proportion = 0.4;
    // 折线是否显示为贝塞尔曲线，yes为贝塞尔曲线，no为直线。默认为yes
    chartView.isShowBezier = NO;
    //折线图是否从零点开始画
    chartView.hiddenZreo = YES;
    //设置颜色
    chartView.leftColorStrArr = @[@"#6dd89c",@"#00a1eb",@"#bc69e0",@"#385af0"];
    //是否显示Y轴零位
    chartView.isShowZero = YES;
    //泡泡是否跟随屏幕滑动而滑动
    chartView.paopaoFollowSliding = NO;
    //折线图数据
    chartView.leftDataArr = @[@[@"-9999.4",@"30907",@"32010",@"33450",@"30069",@"31574",@"30692",@"33156",@"29808",@"31846",@"29772",@"29630"]];
    //底部日期
    chartView.dataArrOfX = @[@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月",@"1月",@"2月",@"3月"];
    //泡泡标题
//    chartView.paopaoTitleArray = @[@"2018-04",@"2018-05",@"2018-06",@"2018-07",@"2018-08",@"2018-09",@"2018-10",@"2018-11",@"2018-12",@"2019-01",@"2019-02",@"2019-03"];
    //返回泡泡选中值
    chartView.returnPaoPaoDataBlock = ^(NSArray *array, NSString *title) {
        NSLog(@"%@-----%@",array,title);
    };
    chartView.paopaoDataColors = @[[UIColor colorWithHexString:@"#6dd89c"],[UIColor colorWithHexString:@"#00a1eb"],[UIColor colorWithHexString:@"#bc69e0"],[UIColor colorWithHexString:@"#385af0"]];
    //泡泡数据
    chartView.paopaoDataArray = @[@[@"-10,000元m²",@"30,907元m²",@"32,010元m²",@"33,450元m²",@"30,069元m²",@"31,574元m²",@"30,692元m²",@"33,156元m²",@"29,808元m²",@"31,846元m²",@"29,772元m²",@"29,630元m²"],@[@"46,175元m²",@"44,915元m²",@"36,228元m²",@"50,473元m²",@"28,811元m²",@"11,876元m²",@"23,213元m²",@"26,847元m²",@"27,905元m²",@"9,562元m²",@"34,263元m²",@"25,459元m²"],@[@"20,549元m²",@"15,981元m²",@"23,375元m²",@"20,516元m²",@"19,208元m²",@"15,121元m²",@"13,776元m²",@"16,282元m²",@"30,748元m²",@"26,531元m²",@"31,298元m²",@"33,183元m²"],@[@"11,053元m²",@"25,811元m²"]];
    //开始画图
    [chartView show];
}



-(void)addSecChartView{
    LHYChartView *chartView = [[LHYChartView alloc]initWithFrame:
                               CGRectMake(10, 320,
                                          self.view.frame.size.width-20, 300)];
    [self.baseView addSubview:chartView];
    chartView.isSelect = NO; //关闭弹出泡泡
    //是否有网格
    chartView.isGrid = YES;
    //是否显示所有点
    chartView.isShow = NO;
    //是否可以浮动
//    chartView.isFloating = NO;
    //显示多少行
    chartView.row = 6;
    //显示多少列
    chartView.xRow = 7;
    //设置X轴坐标字体大小
    chartView.x_Font = [UIFont systemFontOfSize:10];
    //设置X轴坐标字体颜色
    chartView.x_Color = [UIColor colorWithHexString:@"#49cca0"];
    //设置Y轴坐标字体大小
    chartView.y_Font = [UIFont systemFontOfSize:10];
    //设置Y轴坐标字体颜色
    chartView.y_Color = [UIColor colorWithHexString:@"#49cca0"];
    //设置背景颜色
    chartView.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.8];
    //边框标线颜色 （X轴 Y轴）
    chartView.borderLineColor = [UIColor colorWithHexString:@"#ff0099"];
    //中间标线颜色（网格线的颜色）
    chartView.middleLineColor = [UIColor colorWithHexString:@"#00ffcb" andAlpha:0.3];
    //边框三角颜色（X轴 Y轴 箭头颜色）
    chartView.borderTriangleColor = [UIColor redColor];

    //设置折线样式
    chartView.chartViewStyle = LHYChartViewMoreClickLine;
    //设置图层效果
    chartView.chartLayerStyle = LHYChartGradient; //渐变
    //设置折现效果
    chartView.lineLayerStyle = LHYLineLayerGradient;
    
    chartView.lineWidth = 4;
    //渐变开始比例
    chartView.proportion = 0.1;
    // 折线是否显示为贝塞尔曲线，yes为贝塞尔曲线，no为直线。默认为yes
    chartView.isShowBezier = YES;
    //折线图是否从零点开始画
    chartView.hiddenZreo = NO; //从0点开始画
    //设置颜色(渐变填充部分)
    chartView.leftColorStrArr = @[[UIColor redColor]];
    //折线渐变颜色数组
    chartView.colors = @[@[[UIColor colorWithHexString:@"#53d2f8"],[UIColor blueColor]]];
    chartView.isShow = YES; //是否显示关键点
    //是否显示Y轴零位
    chartView.isShowZero = YES;
    //泡泡是否跟随屏幕滑动而滑动
    chartView.paopaoFollowSliding = NO;
    //折线图数据
    chartView.leftDataArr = @[@[@"167",@"344",@"645",@"233",@"823",@"455",@"157",@"89",@"356",@"534",@"823",@"377"]];
    //底部日期
    chartView.dataArrOfX = @[@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月",@"1月",@"2月",@"3月"];

    //开始画图
    [chartView show];
}



-(void)addTreChartView{
    LHYChartView *chartView = [[LHYChartView alloc]initWithFrame:
                               CGRectMake(10, 630,
                                          self.view.frame.size.width-20, 300)];
    [self.baseView addSubview:chartView];
    //是否默认选中第一个
    chartView.isShowFirstPaoPao = NO;
    chartView.isSelect = YES; //打开弹出泡泡
    //泡泡是否跟随手势移动
    chartView.paopaoFollowSliding = YES;
    //是否有网格
    chartView.isGrid = YES;
    //是否显示所有点
    chartView.isShow = YES;
    //显示多少行
    chartView.row = 6;
    //显示多少列
    chartView.xRow = 8;
    //设置X轴坐标字体大小
    chartView.x_Font = [UIFont systemFontOfSize:12];
    //设置X轴坐标字体颜色
    chartView.x_Color = [UIColor colorWithHexString:@"#ff9900"];
    //设置Y轴坐标字体大小
    chartView.y_Font = [UIFont systemFontOfSize:10];
    //设置Y轴坐标字体颜色
    chartView.y_Color = [UIColor colorWithHexString:@"#00a1eb"];
    //设置右侧Y轴字体颜色
    chartView.r_y_Color = [UIColor colorWithHexString:@"#fe3a2c"];
    //设置背景颜色
    chartView.backgroundColor = [UIColor whiteColor];
    //边框标线颜色 （X轴 Y轴）
    chartView.borderLineColor = [UIColor colorWithHexString:@"#000000"];
    //中间标线颜色（网格线的颜色）
    chartView.middleLineColor = [UIColor colorWithHexString:@"#000000" andAlpha:0.1];
    //边框三角颜色（X轴 Y轴 箭头颜色）
    chartView.borderTriangleColor = [UIColor blackColor];
    //设置泡泡背景颜色
    chartView.paopaoBackGroundColor = [UIColor colorWithHexString:@"#000000" andAlpha:0.85];
    //设置标线颜色 (泡泡的标注线)
    chartView.markColor = [UIColor greenColor];
    //设置泡泡的标题颜色
    chartView.paopaoTitleColor = [UIColor whiteColor];
    //设置折线样式
    chartView.chartViewStyle = LHYChartViewLeftRightLine;
    //设置图层效果
    chartView.chartLayerStyle = LHYChartGradient;
    //设置折现效果
    chartView.lineLayerStyle = LHYLineLayerNone;
    chartView.paopaoBackGroundColor = [UIColor colorWithHexString:@"#111111" andAlpha:0.8];
    //渐变效果的颜色组
    //渐变开始比例
    chartView.proportion = 0.3;
    //折线图是否从零点开始画
    chartView.hiddenZreo = NO;
    //折线为0的时候，不偏移
    chartView.showChartOffset = NO;
    
    chartView.lineWidth = 4;

    // 折线是否显示为贝塞尔曲线，yes为贝塞尔曲线，no为直线。默认为yes
    chartView.isShowBezier = YES;
    //折线图是否从零点开始画
    chartView.hiddenZreo = NO; //从0点开始画
    //设置颜色(渐变填充部分)
    //设置颜色
    chartView.leftColorStrArr = @[@"#00a1eb"];
    chartView.rightColorStrArr = @[@"#fe3a2c"];
    //折线图数据
    chartView.leftDataArr = @[@[@"2500",@"3090",@"3201",@"3345",@"3006",@"3157",@"3069"]]; // 步数
    chartView.rightDataArr = @[@[@"89",@"70",@"92",@"88",@"100",@"60",@"77"]]; //心率
    //底部日期
    chartView.dataArrOfX = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    //泡泡标题
    chartView.paopaoTitleArray = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    //泡泡数据
    chartView.paopaoDataArray = @[
                                   @[@"2500步",@"3090步",@"3201步",@"3345步",@"3006步",@"3157步",@"3069步"],
                                   @[@"89次/分钟",@"70次/分钟",@"92次/分钟",@"88次/分钟",@"100次/分钟",@"60次/分钟",@"77次/分钟"]
                                   ];
    
    //开始画图
    [chartView show];
}

//心电图展示
-(void)heartChart{
    LHYChartView *incomeChartLineView = [[LHYChartView alloc]initWithFrame:
                                         CGRectMake(10, 940,
                                                    self.view.frame.size.width-20, 173)];
    [self.baseView addSubview:incomeChartLineView];
    //是否默认选中第一个
    incomeChartLineView.isShowFirstPaoPao = NO;
    //是否有网格
    incomeChartLineView.isGrid = YES;
    //是否可以浮动
    incomeChartLineView.isFloating = YES;
    incomeChartLineView.isShowYtext = YES;
    //显示多少行
    incomeChartLineView.row = 5;
    //显示多少列
    incomeChartLineView.xRow = 32;
    //设置X轴坐标字体大小
    incomeChartLineView.x_Font = [UIFont systemFontOfSize:10];
    //设置X轴坐标字体颜色
    incomeChartLineView.x_Color = [UIColor colorWithHexString:@"#999999"];
    //设置Y轴坐标字体大小
    incomeChartLineView.y_Font = [UIFont systemFontOfSize:10];
    //设置Y轴坐标字体颜色
    incomeChartLineView.y_Color = [UIColor colorWithHexString:@"#999999"];
    //设置背景颜色
    incomeChartLineView.backgroundColor = [UIColor whiteColor];
    //边框标线颜色
    incomeChartLineView.borderLineColor = [UIColor colorWithHexString:@"#999999"];
    //中间标线颜色
    incomeChartLineView.middleLineColor = [UIColor colorWithHexString:@"#cbcbcb" andAlpha:0.5];
    //边框三角颜色
    incomeChartLineView.borderTriangleColor = [UIColor colorWithHexString:@"#999999"];
    //设置泡泡背景颜色
    incomeChartLineView.paopaoBackGroundColor = [UIColor colorWithHexString:@"#000000" andAlpha:0.85];
    incomeChartLineView.markColor = [UIColor colorWithHexString:@"#333333"];
    //设置泡泡的标题颜色
    incomeChartLineView.paopaoTitleColor = [UIColor whiteColor];
    //设置折线样式
    incomeChartLineView.chartViewStyle = LHYChartViewMoreClickLine;
    //设置图层效果
    incomeChartLineView.chartLayerStyle = LHYChartGradient;
    //设置折现效果
    incomeChartLineView.lineLayerStyle = LHYLineLayerNone;
    incomeChartLineView.paopaoBackGroundColor = [UIColor colorWithHexString:@"#111111" andAlpha:0.8];
    //渐变效果的颜色组
    //渐变开始比例
    incomeChartLineView.proportion = 0.5;
    //折线图是否从零点开始画
    incomeChartLineView.hiddenZreo = YES;

//    incomeChartLineView.colors = @[@"f91100",@"ff9900"];

    //折线为0的时候，不偏移
    incomeChartLineView.showChartOffset = NO;
    //设置颜色
    incomeChartLineView.leftColorStrArr = @[[[UIColor redColor]colorWithAlphaComponent:0.4]];
    //显示折线为直线
    incomeChartLineView.isShowBezier = NO;
    incomeChartLineView.lineWidth = 3;
    incomeChartLineView.hiddenZreo = NO;
    incomeChartLineView.paopaoFollowSliding = YES;
    NSMutableArray *arr = [NSMutableArray array];
    //    for (NSInteger i = 0; i<31; i++) {
    ////        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //        if(i%2 == 0){
    //            [arr addObject:[NSString stringWithFormat:@"%ld",i+4]];
    //
    //            //[dict setObject:[NSString stringWithFormat:@"%ld",i] forKey:@"data"];
    //        }else{
    //            //[dict setObject:[NSString stringWithFormat:@"%ld",i+1] forKey:@"data"];
    //            [arr addObject:[NSString stringWithFormat:@"%ld",i+3]];
    //
    //        }
    ////
    ////        [dict setObject:@"咨询人数" forKey:@"detail"];
    //        //[arr addObject:[NSString stringWithFormat:@"%ld",i]];
    //
    //    }
    arr = [NSMutableArray arrayWithObjects:@"0",@"0",@"5",@"1",@"6",@"0",@"7",@"0",@"0",@"1",@"1",@"6",@"0",@"7",@"0",@"0",@"1",@"6",@"0",@"7",@"0",@"0",@"1",@"6",@"0",@"7",@"0",@"0",@"5", nil];
    NSMutableArray * arr1 = [NSMutableArray array];
    [arr1 addObject:arr];
    incomeChartLineView.leftDataArr = arr1;
    //折线图数据
    // incomeChartLineView.leftDataArr = @[@[@"25000",@"30907",@"32010",@"33450",@"30069",@"31574",@"30692",@"33156",@"29808",@"31846",@"29772",@"29630",@"25000",@"30907",@"32010",@"33450",@"30069",@"31574",@"30692",@"33156",@"29808",@"31846",@"29772",@"29630",@"25000",@"30907",@"32010",@"33450",@"30069",@"31574",@"30692",@"33156"]];
    //底部日期
    incomeChartLineView.dataArrOfX = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"1",@"2",@"3",@"4",@"5",@"6"];
    //泡泡标题
    incomeChartLineView.paopaoTitleArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"1",@"2",@"3",@"4",@"5",@"6"];
    //泡泡数据
    incomeChartLineView.paopaoDataArray = @[@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"1",@"2",@"3",@"4",@"5",@"6"]];
    //开始画图
    [incomeChartLineView show];

}

//多个数据展示哈哈哈

-(void)addFourChartView{
    LHYChartView *chartView = [[LHYChartView alloc]initWithFrame:
                               CGRectMake(10, 1130,
                                          self.view.frame.size.width-20, 300)];
    [self.baseView addSubview:chartView];
    
    chartView.isSelect = NO; //关闭弹出泡泡
    //是否有网格
    chartView.isGrid = YES;
    //是否显示所有点
    chartView.isShow = YES;
    //显示多少行
    chartView.row = 6;
    //显示多少列
    chartView.xRow = 6;
    //设置X轴坐标字体大小
    chartView.x_Font = [UIFont systemFontOfSize:12];
    //设置X轴坐标字体颜色
    chartView.x_Color = [UIColor colorWithHexString:@"#000000"];
    //设置Y轴坐标字体大小
    chartView.y_Font = [UIFont systemFontOfSize:10];
    //设置Y轴坐标字体颜色
    chartView.y_Color = [UIColor colorWithHexString:@"#000000"];
    //设置背景颜色
    chartView.backgroundColor = [UIColor whiteColor];
    //边框标线颜色 （X轴 Y轴）
    chartView.borderLineColor = [UIColor colorWithHexString:@"#000000"];
    //中间标线颜色（网格线的颜色）
    chartView.middleLineColor = [UIColor colorWithHexString:@"#000000" andAlpha:0.1];
    //边框三角颜色（X轴 Y轴 箭头颜色）
    chartView.borderTriangleColor = [UIColor blackColor];

    //设置折线样式
    chartView.chartViewStyle = LHYChartViewMoreNoClickLine;
    //设置图层效果
    chartView.chartLayerStyle = LHYChartProjection;
    //设置折现效果
    chartView.lineLayerStyle = LHYLineLayerNone;
    
    chartView.lineWidth = 3;

    // 折线是否显示为贝塞尔曲线，yes为贝塞尔曲线，no为直线。默认为yes
    chartView.isShowBezier = YES;
    //折线图是否从零点开始画
    chartView.hiddenZreo = NO; //从0点开始画
    //设置颜色(渐变填充部分)
    chartView.leftColorStrArr = @[@"#6dd89c",@"#00a1eb",@"#bc69e0",@"#385af0"];

    //是否显示Y轴零位
    chartView.isShowZero = YES;
    //泡泡是否跟随屏幕滑动而滑动
    chartView.paopaoFollowSliding = NO;
    //折线图数据
    chartView.leftDataArr = @[@[@"12",@"1234",@"3200",@"7874",@"2345",@"6758",@"1234",@"8477",@"9088",@"7864",@"6547",@"2630"],
          @[@"5612",@"3434",@"5677",@"8979",@"2345",@"3455",@"1234",@"4577",@"355",@"2344",@"6547",@"9630"],
          @[@"9876",@"3422",@"4562",@"7874",@"3665",@"5633",@"5775",@"2567",@"8665",@"7855",@"8966",@"2343"],
          @[@"1322",@"4566",@"5000",@"4556",@"8787",@"3442",@"6445",@"7754",@"2234",@"5657",@"8665",@"5433"]];
    //底部日期
    chartView.dataArrOfX = @[@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月",@"1月",@"2月",@"3月"];
    //开始画图
    [chartView show];
}
@end
