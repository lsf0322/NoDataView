# NoDataView
# 以下是使用方法
/**
 * 无数据页面（无刷新按钮）

 * @param superView 所要放的父试图
 * @param viewDirection 需要创建的类型
 * @return NoDataView对象
 */
* +(id)initAddSubView:(UIView *)superView WithNoDirection:(NoFoundDirection )viewDirection;


/**
 * 无数据页面（有刷新按钮）

 * @param superView 所要放的父试图
 * @param viewDirection 需要创建的类型
 * @param block block
 * @return NoDataView对象
 */
* +(id)initAddSubView:(UIView *)superView WithNoDirection:(NoFoundDirection )viewDirection andBlock:(refClickBlock)block;

## 以下是调用

    * //添加无网空白页
    * [NoDataView initAddSubView:self.view WithNoDirection:NoNetworkView];
    
    * //添加无网空白页，有点击刷新的
    * [NoDataView initAddSubView:self.view WithNoDirection:NoNetworkView andBlock:^{
        NSLog(@"刷新");
    }];
