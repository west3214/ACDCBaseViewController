//
//  LLKeyChainManager.h
//  SSKeyChain
//
//  Created by west3214 on 2019/11/25.
//  Copyright © 2019 west3214. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLKeyChainManager : NSObject
/*!
 保存数据

 @data  要存储的数据
 @identifier 存储数据的标示
 */
+(BOOL) ll_keyChainSaveData:(id)data withIdentifier:(NSString*)identifier ;


/*!
 读取数据

 @identifier 存储数据的标示
 */
+(id) ll_keyChainReadData:(NSString*)identifier ;


/*!
 更新数据

 @data  要更新的数据
 @identifier 数据存储时的标示
 */
+(BOOL) ll_keyChainUpdata:(id)data withIdentifier:(NSString*)identifier ;

/*!
 删除数据

 @identifier 数据存储时的标示
 */
+(void) ll_keyChainDelete:(NSString*)identifier ;


@end

NS_ASSUME_NONNULL_END
