//
//  AddModel.h
//  Kong 白的调试
//
//  Created by apple on 2022/6/15.
//  Copyright © 2022 wangxiansheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChildModel.h"
#import <MJExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddModel : NSObject
/** 标题 */
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *name;
/** 内容 */
@property (nonatomic, copy) NSArray<ChildModel *> *content;

/** 是否展开 */
@property (nonatomic, assign) BOOL isExpand;

/** 已反馈*/
@property (nonatomic, copy) NSString *giveFeedback;
@end

NS_ASSUME_NONNULL_END
