//
//  RuntimeViewController.h
//  Runtime
//
//  Created by TsouMac2016 on 2018/11/6.
//  Copyright © 2018 TsouMac2016. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RuntimeViewController : UIViewController

@property (nonatomic, copy) NSArray *array;
@property (nonatomic, copy) NSString *string;
- (void)method1;
- (void)method2;
+ (void)classMethod1;


@end

NS_ASSUME_NONNULL_END
