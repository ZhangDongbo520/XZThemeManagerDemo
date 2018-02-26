//
//  UIView+XZTheme.m
//  XZThemeManagerDemo
//
//  Created by Zeasn on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "UIView+XZTheme.h"

#import <objc/runtime.h>
#import "NSObject+Dealloc.h"
#import "XZThemeManager.h"

static void *kDeallocHelper;

@implementation UIView (XZTheme)

#pragma mark - set
- (void)setThemeMap:(NSDictionary *)themeMap {
    objc_setAssociatedObject(self, @selector(themeMap), themeMap, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (themeMap) {
        if (objc_getAssociatedObject(self, &kDeallocHelper) == nil) {
            __unsafe_unretained typeof(self) weakSelf = self;
            id deallocHelper = [self addDeallocBlock:^{
                [[NSNotificationCenter defaultCenter] removeObserver:weakSelf];
            }];
            objc_setAssociatedObject(self, &kDeallocHelper, deallocHelper, OBJC_ASSOCIATION_ASSIGN);
        }
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChanged) name:kThemeDidChangeNotification object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
    }
}

- (void)setModule:(NSString *)module {
    objc_setAssociatedObject(self, @selector(module), module, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - get
- (NSDictionary *)themeMap {
    return objc_getAssociatedObject(self, _cmd);
}

- (NSString *)module {
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark - 配置
- (void)configThemeMapModule:(NSString *)module themeMap:(NSDictionary *)themeMap {
    self.module = module;
    self.themeMap = themeMap;
    [self themeChanged];
}

- (void)themeChanged{
    if (self.hidden) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self changeSkin];
        });
    } else {
        [self changeSkin];
    }
}

- (void)changeSkin {
    NSString *module = self.module;
    NSDictionary *map = self.themeMap;
    if ([self isKindOfClass:[UIButton class]]) {
        UIButton *obj = (UIButton *)self;
        // image
        if (map[kThemeKey_button_image]) {
            [obj setImage:SkinImage(module,map[kThemeKey_button_image]) forState:UIControlStateNormal];
        }
        if (map[kThemeKey_button_highlightedImage]) {
            [obj setImage:SkinImage(module,map[kThemeKey_button_highlightedImage]) forState:UIControlStateHighlighted];
        }
        if (map[kThemeKey_button_selectedImage]) {
            [obj setImage:SkinImage(module,map[kThemeKey_button_selectedImage]) forState:UIControlStateSelected];
        }
        if (map[kThemeKey_button_disabledImage]) {
            [obj setImage:SkinImage(module,map[kThemeKey_button_disabledImage]) forState:UIControlStateDisabled];
        }
        // backgroundImage
        if (map[kThemeKey_button_backgroundImage]) {
            [obj setBackgroundImage:SkinImage(module,map[kThemeKey_button_backgroundImage]) forState:UIControlStateNormal];
        }
        if (map[kThemeKey_button_highlightedBackgroundImage]) {
            [obj setBackgroundImage:SkinImage(module,map[kThemeKey_button_highlightedBackgroundImage]) forState:UIControlStateHighlighted];
        }
        if (map[kThemeKey_button_selectedBackgroundImage]) {
            [obj setBackgroundImage:SkinImage(module,map[kThemeKey_button_selectedBackgroundImage]) forState:UIControlStateSelected];
        }
        if (map[kThemeKey_button_disabledBackgroundImage]) {
            [obj setBackgroundImage:SkinImage(module,map[kThemeKey_button_disabledBackgroundImage]) forState:UIControlStateDisabled];
        }
        // titleColor
        if (map[kThemeKey_button_titleColor]) {
            [obj setTitleColor:SkinColor(module,map[kThemeKey_button_titleColor]) forState:UIControlStateNormal];
        }
        if (map[kThemeKey_button_titleHighlightedColor]) {
            [obj setTitleColor:SkinColor(module,map[kThemeKey_button_titleHighlightedColor]) forState:UIControlStateHighlighted];
        }
        if (map[kThemeKey_button_titleSelectedColor]) {
            [obj setTitleColor:SkinColor(module,map[kThemeKey_button_titleSelectedColor]) forState:UIControlStateSelected];
        }
        if (map[kThemeKey_button_titleDisabledColor]) {
            [obj setTitleColor:SkinColor(module,map[kThemeKey_button_titleDisabledColor]) forState:UIControlStateDisabled];
        }
    } else if ([self isKindOfClass:[UIImageView class]]) {
        UIImageView *obj = (UIImageView *)self;
        if (map[kThemeKey_imageView_image]) {
            [obj setImage:SkinImage(module, map[kThemeKey_imageView_image])];
        }
        if (map[kThemeKey_imageView_highlightedImage]) {
            [obj setHighlightedImage:SkinImage(module, map[kThemeKey_imageView_highlightedImage])];
        }
    } else if ([self isKindOfClass:[UILabel class]]) {
        UILabel *obj = (UILabel *)self;
        if (map[kThemeKey_label_textColor]) {
            obj.textColor = SkinColor(module, map[kThemeKey_label_textColor]);
        }
        if (map[kThemeKey_label_textHighlightedColor]) {
            obj.highlightedTextColor = SkinColor(module, map[kThemeKey_label_textHighlightedColor]);
        }
        if (map[kThemeKey_label_backgroundColor]) {
            obj.backgroundColor = SkinColor(module, map[kThemeKey_label_backgroundColor]);
        }
    } else if ([self isMemberOfClass:[UIView class]]) {
        UIView *obj = (UIView *)self;
        if (map[kThemeKey_view_backgroundColor]) {
            obj.backgroundColor = SkinColor(module, map[kThemeKey_view_backgroundColor]);
        }
    } else if ([self isKindOfClass:[UINavigationBar class]]){
        UINavigationBar *obj = (UINavigationBar *)self;
        if (map[kThemeKey_navigationBar_barTintColor]) {
            obj.barTintColor = SkinColor(module, map[kThemeKey_navigationBar_barTintColor]);
        }
        if (map[kThemeKey_navigationBar_foregroundColor]) {
            [obj setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:SkinColor(module, map[kThemeKey_navigationBar_foregroundColor]), NSForegroundColorAttributeName,nil]];
        }
    } else if ([self isKindOfClass:[UITableViewCell class]]){
        UITableViewCell *obj = (UITableViewCell *)self;
        if (map[kThemeKey_tableviewcell_backgroundColor]) {
            obj.backgroundColor = SkinColor(module, map[kThemeKey_tableviewcell_backgroundColor]);
        }
        if (map[kThemeKey_tableviewcell_textHighlightedColor]) {
            obj.textLabel.highlightedTextColor  = SkinColor(module, map[kThemeKey_tableviewcell_textHighlightedColor]);
        }
    }
}


@end
