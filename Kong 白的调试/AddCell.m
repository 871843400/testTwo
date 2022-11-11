//
//  AddCell.m
//  Kong 白的调试
//
//  Created by apple on 2022/6/15.
//  Copyright © 2022 wangxiansheng. All rights reserved.
//

#import "AddCell.h"
#import "UILabel+Extension.h"

#define kScreenW [[UIScreen mainScreen] bounds].size.width

@implementation AddCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    
    self.contentView.backgroundColor = UIColor.whiteColor;

    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW - 30, 40)];
    [self.contentView addSubview:backView];

    UILabel *titLB = [UILabel labelWithFrame:CGRectMake(45, 13, 100, 14) text:@"员工列表" textColor:[UIColor colorWithRed:112/255.0 green:112/255.0 blue:112/255.0 alpha:1] textAlignment:(NSTextAlignmentLeft) font:[UIFont systemFontOfSize:14]];
    [backView addSubview:titLB];
    self.titLB = titLB;

    UIButton *rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"recy_nor"] forState:(UIControlStateNormal)];
    [backView addSubview:rightBtn];

}


@end
