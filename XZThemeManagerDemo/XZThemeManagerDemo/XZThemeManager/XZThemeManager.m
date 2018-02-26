//
//  XZThemeManager.m
//  XZThemeManagerDemo
//
//  Created by dreamer on 2018/1/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "XZThemeManager.h"
#import "XZThemeStyle.h"
#import "UIColor+XZTheme.h"

#define kUserDefaults [NSUserDefaults standardUserDefaults]

@interface XZThemeManager()

@property (nonatomic, strong) NSDictionary *configData;
@property (nonatomic, assign) XZThemeType currentThemeType;
@property (nonatomic, strong) XZThemeStyle *currentThemeStyle;
@property (nonatomic, strong) NSMutableArray *themeArray;

@end

@implementation XZThemeManager

+ (instancetype)shareManager {
    static XZThemeManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadThemeConfig];
    }
    return self;
}

#pragma mark - 加载所有主题配置信息
- (void)loadThemeConfig {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
    if (filePath == nil) {
        NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
        filePath = [resourcePath stringByAppendingPathComponent:@"/res/themes/theme.plist"];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            NSArray *tempArr = [[NSArray alloc] initWithContentsOfFile:filePath];
            
            for (NSDictionary *themeDic in tempArr) {
                XZThemeStyle *themeStyle = [[XZThemeStyle alloc] init];
                themeStyle.themeID = [themeDic[@"themeID"] integerValue];
                themeStyle.themeName = themeDic[@"themeName"];
                themeStyle.themePath = themeDic[@"themePath"];
                themeStyle.configPath = themeDic[@"configPath"];
                themeStyle.configData = [NSDictionary dictionaryWithContentsOfFile:[resourcePath stringByAppendingPathComponent:themeStyle.configPath]];
                
                [self.themeArray addObject:themeStyle];
            }
        }
    }
}

#pragma mark - 切换主题
- (void)switchToTheme:(XZThemeType)themeType {
    self.currentThemeType = themeType;
    [self loadCurrentThemeStyle];
    
    [[NSUserDefaults standardUserDefaults] setValue:@(themeType) forKey:kCurrentTheme];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNotification object:nil];
}

- (void)loadCurrentThemeStyle {
    for (XZThemeStyle *themeStyle in self.themeArray) {
        if (themeStyle.themeID == self.currentThemeType) {
            self.currentThemeStyle = themeStyle;
        }
    }
}

#pragma mark - 根据图片标识获取对应模块的图片
- (UIImage *)pngResourceForModule:(NSString *)module picName:(NSString *)picName {
    // 1. 获取对应模块的主题配置信息字典
    NSDictionary *moduleDic = self.currentThemeStyle.configData[module];
    
    // 2. 取出主题配置信息字典中的图片配置信息
    NSDictionary *imageDic = moduleDic[@"images"];
    
    // 3. 取出对应图片标识的图片名称
    NSString *value = imageDic[picName];
    
    // 4. 根据图片存放路径去加载图片
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *filePath = [resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@/%@.png",self.currentThemeStyle.themePath,value]];
    UIImage *image = [UIImage imageNamed:filePath];
    
    return image;
}

#pragma mark -根据颜色标识获取对应模块的颜色
- (UIColor *)colorResourceForModule:(NSString *)module colorName:(NSString *)colorName {
    // 1. 获取对应模块的主题配置信息字典
    NSDictionary *moduleDic = self.currentThemeStyle.configData[module];
    // 2. 取出主题配置信息字典中的颜色配置信息
    NSDictionary *colorDic = moduleDic[@"colors"];
    // 3. 取出对应颜色标识的颜色值
    NSString *value = colorDic[colorName];
    
    return [UIColor colorWithHexString:value];
}

#pragma mark - get
- (NSMutableArray *)themeArray {
    if (!_themeArray) {
        _themeArray = [NSMutableArray array];
    }
    return _themeArray;
}

@end
