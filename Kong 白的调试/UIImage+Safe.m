//
//  UIImage+Safe.m
//  Kong 白的调试
//
//  Created by apple on 2022/9/29.
//  Copyright © 2022 wangxiansheng. All rights reserved.
//

#import "UIImage+Safe.h"
#import <objc/runtime.h>
@implementation UIImage (Safe)

+ (void)load {
    Method imageMethod = class_getClassMethod(self, @selector(imageNamed:));
    Method myImgMethod = class_getClassMethod(self, @selector(myImgMethod:));
    method_exchangeImplementations(imageMethod, myImgMethod);
}

+ (UIImage *)myImgMethod:(NSString *)str {
    
    if ([str isEqualToString:@""]) {
        NSLog(@"加载konkogn图片");
        return [self myImgMethod:@"12"];
    }
    UIImage *image = [self myImgMethod:str];
    if (image == nil) {
        NSLog(@"加载空图片");
        return nil;
    }

    
    return image;
}
@end
