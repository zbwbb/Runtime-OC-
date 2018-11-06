//
//  SubRuntimeViewController.m
//  Runtime
//
//  Created by TsouMac2016 on 2018/11/6.
//  Copyright © 2018 TsouMac2016. All rights reserved.
//

#import "SubRuntimeViewController.h"
#import <objc/runtime.h>

@interface SubRuntimeViewController ()
{
    NSArray *subArray;
}
@property (nonatomic, strong) NSString *subString;

@end

@implementation SubRuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"self is : %@", self);
    
    // 类名
    NSLog(@"current class name: %s", class_getName([self class]));
    NSLog(@"------------------------------------------");
    
    // 父类
    NSLog(@"super class name: %s", class_getName(class_getSuperclass(self.class)));
    NSLog(@"super class name: %s", class_getName(self.superclass));
    // 获取父类方法有两种方式 self.superclass 或者 class_getsuperclass(self.class)
    NSLog(@"------------------------------------------");
    
    // 是否是元类
    NSLog(@"self.class is %@ a meta-class", class_isMetaClass(self.class)? @"": @"not");
    NSLog(@"------------------------------------------");
    
    // 获取当前类的元类
    Class meta_class = objc_getMetaClass(object_getClassName(self.class));
    NSLog(@"%s's meta-class is %@", object_getClassName(self.class), meta_class);
    NSLog(@"------------------------------------------");
    
    // 实例变量大小
    NSLog(@"instance size: %zu", class_getInstanceSize(self.class));
    NSLog(@"------------------------------------------");
    
    // 成员变量
    unsigned int outCount = 0;
    // 通过传递地址的方式给变量赋值
    Ivar *ivars = class_copyIvarList(self.class, &outCount);
    for (NSInteger i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"instance variable's name: %s at index: %ld", ivar_getName(ivar), (long)i);
    }
    free(ivars);
    
    Ivar string = class_getInstanceVariable(self.class, "_subString");
    if (string != NULL) {
        NSLog(@"instace variable %s", ivar_getName(string));
    }
    // 数组都要释放
    // 并不会查询父类
    NSLog(@"------------------------------------------");
    
    //属性操作
    objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
    for (NSInteger k = 0; k < outCount; k ++) {
        objc_property_t property = properties[k];
        NSLog(@"property's name: %s", property_getName(property));
    }
    free(properties);
    // 数组都要释放
    // 并不会查询父类
    NSLog(@"------------------------------------------");
    
    // 方法操作
    Method *methods = class_copyMethodList(self.superclass, &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methods[i];
        // 此处会报错  咱没找到原因
//        NSLog(@"method's signature: %@", method_getName(method));
    }
    free(methods);
    
    Method method1 = class_getInstanceMethod(self.class, @selector(method1));
    if (method1 != NULL) {
        NSLog(@"method %s", method_getName(method1));
    }
    Method classMethod = class_getClassMethod(self.class, @selector(classMethod1));
    if (classMethod != NULL) {
        NSLog(@"class method : %s", method_getName(classMethod));
    }
    NSLog(@"MyClass is%@ responsd to selector: method3WithArg1:arg2:", class_respondsToSelector(self.class, @selector(method3WithArg1:arg2:)) ? @"" : @" not");
    IMP imp = class_getMethodImplementation(self.class, @selector(method1));
    imp();
    NSLog(@"------------------------------------------");
    
    
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
