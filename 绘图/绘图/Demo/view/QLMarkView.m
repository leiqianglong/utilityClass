//
//  QLMarkView.m
//  绘图
//
//  Created by 公智能 on 2021/5/25.
//

#import "QLMarkView.h"

@implementation QLMarkView

//重写父类方法：增加内容
-(void)mark_createView{
    UILabel *norLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 180, 20)];
    norLabel.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    norLabel.text = @"测试一下45678";
    [self addSubview:norLabel];
}

@end
