//
//  OCClass.m
//  SwiftStudy
//
//  Created by guoliting on 2020/4/26.
//  Copyright © 2020 guoliting. All rights reserved.
//

#import "OCClass.h"
//#import "SwiftStudy-Bridging-Header.h"
#import "SwiftClass.swift"

@implementation OCClass

- (void)OCInstanceMethod {
    //调用swift实例方法
//    SwiftClass *swiftc = [[SwiftClass alloc] init];
//    [swiftc SwiftInstanceMethod];
    NSLog(@"oc instance method!");
}

+ (void)OCClassMethod {
    //调用swift类方法
//    [SwiftClass SwiftClassMethod];
    NSLog(@"oc class method!");
}

@end
