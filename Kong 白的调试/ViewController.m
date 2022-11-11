//
//  ViewController.m
//  Kong 白的调试
//
//  Created by 蓝星 on 2019/8/5.
//  Copyright © 2019 wangxiansheng. All rights reserved.
//

#import "ViewController.h"
#import "AddCell.h"
#import "AddModel.h"
#import "ChildModel.h"
#import <MJExtension.h>
#define LYFont_PingFangSC_Semibold(s) [UIFont fontWithName:@"PingFangSC-Semibold" size:s]

@interface ViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *totalArray;
@property (nonatomic, copy) NSArray<AddModel *> *dataArray;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
//    NSDictionary *dic = @{@"aa": nil};
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 150)];
    imgView.image = [UIImage imageNamed:@""];
    [self.view addSubview:imgView];

}

/** runtime实际上是一个库，让我们可以在程序运行时动态的创建对象、检查对象、修改类和对象的方法
 
   OC中对象方法调用都是类似[receiver selector];的形式,本质就是让对象在运行时发送消息
1）、编译阶段[receiver selector];方法被编译器转换为
       1、objc_msgSend(receiver，selector) （不带参数）
       2、objc_msgSend(recevier，selector，org1，org2，…)（带参数）
2）、运行时阶段 消息接受者receiver寻找对应的selector
    1、通过receiver的isa指针找到receiver的class
    2、在class的cache（方法缓存）的散列表中找对应的IMP（方法实现）
    3 、如果未找到，就在method list（方法列表）中找对应的selector，如果找到，填充到cache，并返回selector
    4、如果在class中没有找到，就继续在他的父类中寻找
    5、找到的话，直接执行recevier的selector方法实现的IMP（方法实现）
    6、如找不到对应的selector，消息被转发或者临时向receiver添加这个歌selector对应的实现方法，否则会发生崩溃
 
2、runtime中的概念解析
   1）、objc_msgSend
 OC方法在编译时会转化为C函数objc_msgSend
   2）、Class
 在objc/runtime中 Class被定义为指向objc_class结构体的指针； objc_class 结构体 的第一个成员变量是 isa 指针，isa 指针 保存的是所属类的结构体的实例的指针，这里保存的就是 objc_class 结构体的实例指针，而实例换个名字就是 对象。换句话说，Class（类） 的本质其实就是一个对象，我们称之为 类对象。
   3）、Object（对象）
 objc/objc.h 中关于 Object（对象） 的定义。
 Object（对象）被定义为 objc_object 结构体，一个Object（对象）唯一保存的就是它所属Class的地址。当我们对一个对象进行方法调用时。他会通过objc_object结构体的isa指针去找对应的object_class结构体，然后在object_class结构体的方法列表中找到调用 的方法 ，然后执行
     4）、Meta Class （元类
 对象（objc_object结构体）的isa指针指向对应的类对象（objc_class结构体）。类对象的isa指针指向类对象自身的元类（Meta Class）； 元类就是类对象所属的类，一个对象所属的类叫做类对象，类对象所属的类就叫做元类；
   对象方法的调用过程是通过对象的isa指针找到对应的类，然后在类的方法列表中找到对应的selector
 
 类方法的 调用过程喝对象方法的调用过程差不多：
 通过类对象的isa指针找到所属的元类，在元类的方法列表中找到对应的selector，执行selector
 
     5）、实例对象、类、元类之间的关系
     6）、method（方法）
 object_class结构体的方法列表存放的就是方法
 包含 method_name（方法名），method_types（方法类型） 和 method_imp（方法实现）
       6-1、SEL method_name; // 方法名
 SEL 是一个指向 objc_selector 结构体 的指针，
       6-2、 IMP method_imp; // 方法实现
 IMP 的实质是一个函数指针，所指向的就是方法的实现。IMP用来找到函数地址，然后执行函数。
   6-3、char * method_types; // 方法类型
 方法类型 method_types 是个字符串，用来存储方法的参数类型和返回值类型。

 到这里， Method 的结构就已经很清楚了，Method 将 SEL（方法名） 和 IMP（函数指针） 关联起来，当对一个对象发送消息时，会通过给出的 SEL（方法名） 去找到 IMP（函数指针） ，然后执行。
    3、消息转发
OC运行时会调用 +resolveInstanceMethod: 或者 +resolveClassMethod:，分别在对象方法未找到或者类方法未找到是喝止
 
       4、xinde funhanshu
 
是个字符串 你是谁 来到我身边 resolveclassmethod
 
 runtime在实际开发中的使用
 */

+ (BOOL)resolveClassMethod:(SEL)sel{
    if (sel == @selector(fun)) {
        class_addMethod([self class], sel, (IMP)funMethod, "v@1:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

void funMethod(id obj, SEL _cmd) {
    NSLog(@"funMethod"); //新的 fun 函数
}


- (void)method {



}
//- (void)funMethod {
//
//}


- (void)test {
    // runtime是OC的一个核心，用C语言和汇编语言编写 OC代码最终会转换成Runtime库中对应的函数结构体。
    // OC是动态运行时语言，任何语言最终会被编译为汇编语言，在汇编为汇编语言
    //  ）OC -Runtime - C - 汇编 - 可执行文件
 
    /** 使用场景 */
    
    
}


@end
