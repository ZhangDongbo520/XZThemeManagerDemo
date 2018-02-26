//
//  NSObject+Dealloc.m
//  XZThemeManagerDemo
//
//  Created by dreamer on 2018/2/6.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "NSObject+Dealloc.h"

#import <objc/runtime.h>

#import "DeallocBlockObject.h"

static void *kDeallocBlocks;

@implementation NSObject (Dealloc)

- (instancetype)addDeallocBlock:(void (^)(void))deallocBlock {
    if (deallocBlock == nil) {
        return nil;
    }
    
    NSMutableArray *deallocBlocks = objc_getAssociatedObject(self, &kDeallocBlocks);
    if (deallocBlocks == nil) {
        deallocBlocks = [NSMutableArray array];
        objc_setAssociatedObject(self, &kDeallocBlocks, deallocBlocks, OBJC_ASSOCIATION_RETAIN);
    }
    
    for (DeallocBlockObject *deallocBlockObject in deallocBlocks) {
        if (deallocBlockObject.deallocBlock == deallocBlock) {
            return nil;
        }
    }
    
    DeallocBlockObject *deallocBlockObject = [DeallocBlockObject objectWithDeallocBlock:deallocBlock];
    [deallocBlocks addObject:deallocBlockObject];
    
    return deallocBlockObject;
}

@end
