//
//  DeallocBlockObject.h
//  XZThemeManagerDemo
//
//  Created by dreamer on 2018/2/6.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeallocBlockObject : NSObject

+ (instancetype)objectWithDeallocBlock:(void(^)())deallocBlock;

@property (nonatomic, copy) void (^deallocBlock)();

@end
