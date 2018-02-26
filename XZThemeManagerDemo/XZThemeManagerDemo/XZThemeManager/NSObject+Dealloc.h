//
//  NSObject+Dealloc.h
//  XZThemeManagerDemo
//
//  Created by dreamer on 2018/2/6.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Dealloc)

// 死亡回调
- (instancetype)addDeallocBlock:(void (^)(void))deallocBlock;

@end
