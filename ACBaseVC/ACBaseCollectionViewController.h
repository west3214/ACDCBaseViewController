//
//  BaseCollectionVC.h
//  JTProject
//
//  Created by 张西方 on 2018/11/17.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "ACBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ACBaseCollectionViewController : ACBaseViewController<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
/**<#Description#>*/
@property (nonatomic, strong) UICollectionView *collectionView;
/**<#Description#>*/
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
/**<#Description#>*/
@property (nonatomic, strong) NSMutableArray *dataList;
#pragma mark ----- <#markMessage#>
-(void)loadDataRefresh;
-(void)loadDataMore;
@end

NS_ASSUME_NONNULL_END
