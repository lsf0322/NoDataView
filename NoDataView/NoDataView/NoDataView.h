//
//  NoDataView.h
//  ChMedicineProject
//  无网，无数据页面
//  Created by 李少锋 on 2018/11/1.
//  Copyright © 2018年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    NoNetworkView = 1,//没有网络
    NoDatasView = 2,//暂无信息
}NoFoundDirection;

typedef void(^refClickBlock)(void);

@interface NoDataView : UIView

@property(nonatomic,copy)refClickBlock block;

/** 描述 */
@property (nonatomic,strong) UILabel *noDataDesLabel;

/** 刷新按钮 */
@property (nonatomic,strong) UIButton *refBtn;


/**
 无数据页面（无刷新按钮）

 @param superView 所要放的父试图
 @param viewDirection 需要创建的类型
 @return NoDataView对象
 */
+(id)initAddSubView:(UIView *)superView WithNoDirection:(NoFoundDirection )viewDirection;


/**
 无数据页面（有刷新按钮）

 @param superView 所要放的父试图
 @param viewDirection 需要创建的类型
 @param block block
 @return NoDataView对象
 */
+(id)initAddSubView:(UIView *)superView WithNoDirection:(NoFoundDirection )viewDirection andBlock:(refClickBlock)block;

@end

