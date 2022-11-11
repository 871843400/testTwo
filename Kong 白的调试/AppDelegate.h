//
//  AppDelegate.h
//  Kong 白的调试
//
//  Created by 蓝星 on 2019/8/5.
//  Copyright © 2019 wangxiansheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

