//
//  XZThemeConstants.h
//  XZThemeManagerDemo
//
//  Created by Zeasn on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#ifndef XZThemeConstants_h
#define XZThemeConstants_h

#define kThemeDidChangeNotification @"kThemeDidChangeNotification"
#define kCurrentTheme @"kCurrentTheme"
#define SkinImage(module,name)  [[XZThemeManager shareManager] pngResourceForModule:module picName:name]
#define SkinColor(module,name) [[XZThemeManager shareManager] colorResourceForModule:module colorName:name]

// UIButton
static NSString * const kThemeKey_button_image = @"kThemeKey_button_image";
static NSString * const kThemeKey_button_highlightedImage = @"kThemeKey_button_highlightedImage";
static NSString * const kThemeKey_button_selectedImage = @"kThemeKey_button_selectedImage";
static NSString * const kThemeKey_button_disabledImage = @"kThemeKey_button_disabledImage";

static NSString * const kThemeKey_button_backgroundImage = @"kThemeKey_button_backgroundImage";
static NSString * const kThemeKey_button_highlightedBackgroundImage = @"kThemeKey_button_highlightedBackgroundImage";
static NSString * const kThemeKey_button_selectedBackgroundImage = @"kThemeKey_button_selectedBackgroundImage";
static NSString * const kThemeKey_button_disabledBackgroundImage = @"kThemeKey_button_disabledBackgroundImage";

static NSString * const kThemeKey_button_titleColor = @"kThemeKey_button_titleColor";
static NSString * const kThemeKey_button_titleHighlightedColor = @"kThemeKey_button_titleHighlightedColor";
static NSString * const kThemeKey_button_titleSelectedColor = @"kThemeKey_button_titleSelectedColor";
static NSString * const kThemeKey_button_titleDisabledColor = @"kThemeKey_button_titleDisabledColor";

static NSString * const kThemeKey_button_title = @"kThemeKey_button_title";
static NSString * const kThemeKey_button_titleHighlighted = @"kThemeKey_button_titleHighlighted";
static NSString * const kThemeKey_button_titleSelected = @"kThemeKey_button_titleSelected";
static NSString * const kThemeKey_button_titleDisabled = @"kThemeKey_button_titleDisabled";

// UILabel
static NSString * const kThemeKey_label_text = @"kThemeKey_label_text";
static NSString * const kThemeKey_label_textColor = @"kThemeKey_label_textColor";
static NSString * const kThemeKey_label_textHighlightedColor = @"kThemeKey_label_textHighlightedColor";
static NSString * const kThemeKey_label_backgroundColor = @"kThemeKey_label_backgroundColor";

// UIImageView
static NSString * const kThemeKey_imageView_image = @"kThemeKey_imageView_image";
static NSString * const kThemeKey_imageView_highlightedImage = @"kThemeKey_imageView_highlightedImage";
static NSString * const kThemeKey_imageView_gif = @"kThemeKey_imageView_gif"; // gif动画
static NSString * const kThemeKey_imageView_backgroundColor = @"kThemeKey_imageView_backgroundColor";

// UIView
static NSString * const kThemeKey_view_backgroundColor = @"kThemeKey_view_backgroundColor";

// UINavigationBar
static NSString * const kThemeKey_navigationBar_barTintColor = @"kThemeKey_navigationBar_barTintColor";
static NSString * const kThemeKey_navigationBar_foregroundColor = @"kThemeKey_navigationBar_foregroundColor";

// UITableviewCell
static NSString * const kThemeKey_tableviewcell_backgroundColor = @"kThemeKey_tableviewcell_backgroundColor";
static NSString * const kThemeKey_tableviewcell_textHighlightedColor = @"kThemeKey_tableviewcell_textHighlightedColor";

#endif /* XZThemeConstants_h */
