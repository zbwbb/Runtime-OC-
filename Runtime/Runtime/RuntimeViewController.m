//
//  RuntimeViewController.m
//  Runtime
//
//  Created by TsouMac2016 on 2018/11/6.
//  Copyright © 2018 TsouMac2016. All rights reserved.
//

#import "RuntimeViewController.h"

@interface RuntimeViewController (){
    NSInteger       _instance1;
    NSString    *   _instance2;
}

@property (nonatomic, assign) NSUInteger integer;

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2;

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
+ (void)classMethod1 {
    NSLog(@"类方法 call classMethod1");
}

- (void)method1 {
    NSLog(@"实例方法 call method1");
}

- (void)method2 {
    NSLog(@"实例方法 call method2");
}

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2 {
    NSLog(@"arg1 : %ld, arg2 : %@", arg1, arg2);
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
