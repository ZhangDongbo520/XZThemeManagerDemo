//
//  DeallocBlockObject.m
//  XZThemeManagerDemo
//
//  Created by dreamer on 2018/2/6.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "DeallocBlockObject.h"

@implementation DeallocBlockObject

+ (instancetype)objectWithDeallocBlock:(void (^)())deallocBlock {
    DeallocBlockObject *deallocBlockObject = [DeallocBlockObject new];
    deallocBlockObject.deallocBlock = deallocBlock;
    return deallocBlockObject;
}

- (void)dealloc {
    if (self.deallocBlock) {
        self.deallocBlock();
        self.deallocBlock = nil;
    }
}

@end
