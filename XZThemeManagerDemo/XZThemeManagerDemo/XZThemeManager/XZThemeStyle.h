//
//  XZThemeStyle.h
//  XZThemeManagerDemo
//
//  Created by Zeasn on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZThemeStyle : NSObject

@property (nonatomic, assign) NSInteger themeID;//主题ID
@property (nonatomic, copy) NSString *themeName;//主题名称
@property (nonatomic, copy) NSString *themePath;//主题图片等资源路径
@property (nonatomic, copy) NSString *configPath;//主题配置文件路径(plist文件)

@property (nonatomic, copy) NSDictionary *configData;//主题配置信息

@end
