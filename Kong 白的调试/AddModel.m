//
//  AddModel.m
//  Kong 白的调试
//
//  Created by apple on 2022/6/15.
//  Copyright © 2022 wangxiansheng. All rights reserved.
//

#import "AddModel.h"

@implementation AddModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"content": [ChildModel class]};
}

MJCodingImplementation
@end
