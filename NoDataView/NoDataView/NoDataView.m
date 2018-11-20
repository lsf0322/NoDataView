//
//  NoDataView.m
//  ChMedicineProject
//  无网，无数据页面
//  Created by 李少锋 on 2018/11/1.
//  Copyright © 2018年 zh. All rights reserved.
//

#import "NoDataView.h"
#import <Masonry.h>

@interface NoDataView ()

/** 父试图 */
@property (nonatomic,weak) UIView *superView;
/** 试图显示状态 */
@property (nonatomic, unsafe_unretained) NoFoundDirection viewDirection;
/** 刷新按钮是否显示 */
@property (nonatomic,assign)BOOL isRefesh;

@end

@implementation NoDataView

/**
 无数据页面（无刷新按钮）
 
 @param superView 所要放的父试图
 @param viewDirection 需要创建的类型
 @return NoDataView对象
 */
+(id)initAddSubView:(UIView *)superView WithNoDirection:(NoFoundDirection )viewDirection
{
    return [NoDataView setView:superView WithNoDirection:viewDirection isRefesh:NO];
}

/**
 无数据页面（有刷新按钮）
 
 @param superView 所要放的父试图
 @param viewDirection 需要创建的类型
 @param block block
 @return NoDataView对象
 */
+(id)initAddSubView:(UIView *)superView WithNoDirection:(NoFoundDirection )viewDirection andBlock:(refClickBlock)block{
    NoDataView *noDataView=[NoDataView setView:superView WithNoDirection:viewDirection isRefesh:YES];
    noDataView.block = block;
    return noDataView;
}

+(NoDataView *)setView:(UIView *)superView WithNoDirection:(NoFoundDirection )viewDirection isRefesh:(BOOL)ref
{
    NoDataView *noDataView;
    if(!noDataView)
    {
        noDataView = [[NoDataView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(superView.bounds), CGRectGetHeight(superView.bounds))];
    }
    noDataView.backgroundColor = [UIColor whiteColor];
    noDataView.superView = superView;
    noDataView.viewDirection = viewDirection;
    noDataView.isRefesh=ref;
    [superView addSubview:noDataView];
    [superView bringSubviewToFront:noDataView];
    [noDataView setupChildViews];
    return noDataView;
}

-(void)setupChildViews
{
    [self addSubview:self.noDataDesLabel];
    [_noDataDesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.superView.mas_centerX);
        make.top.equalTo(self.superView).offset(50);
    }];
    
    if(_isRefesh){
        [self addSubview:self.refBtn];
        [_refBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.superView.mas_centerX);
            make.top.equalTo(self.noDataDesLabel.mas_bottom).offset(10);
        }];
    }
}

#pragma mark - get

-(UILabel *)noDataDesLabel
{
    if(!_noDataDesLabel)
    {
        _noDataDesLabel=[[UILabel alloc]init];
        _noDataDesLabel.textColor=[UIColor blackColor];
        _noDataDesLabel.textAlignment=NSTextAlignmentCenter;
        _noDataDesLabel.font=[UIFont systemFontOfSize:15.0f];
    }
    return _noDataDesLabel;
}

-(UIButton *)refBtn{
    if(!_refBtn){
        _refBtn=[[UIButton alloc]init];
        [_refBtn setTitle:@"点击刷新" forState:UIControlStateNormal];
        [_refBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _refBtn.backgroundColor=[UIColor grayColor];
        [_refBtn addTarget:self action:@selector(refBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _refBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    }
    return _refBtn;
}

-(void)layoutSubviews{
    switch (self.viewDirection) {
        case NoNetworkView://无网络
        {
            self.noDataDesLabel.text = @"网络不给力，请检查网络设置";
        }
            break;
        case NoDatasView://暂无数据
        {
            self.noDataDesLabel.text = @"暂无数据";
        }
            break;
        default:
            break;
    }
}

-(void)refBtnClick{
    if(_block){
        _block();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
