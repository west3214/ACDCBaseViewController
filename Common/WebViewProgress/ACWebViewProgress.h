//
//  ACWebViewProgress.h
//  ACPNew
//
//  Created by west3214 on 2020/3/17.
//  Copyright © 2020 west3214. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACWebViewProgress : CAShapeLayer
- (void)speedLoad;
- (void)startLoad;
- (void)closeTimer;
@end

NS_ASSUME_NONNULL_END
