//
//  MLBBadgeBackgroud.h
//  MLBOmniButtonDemo
//
//  Created by meilbn on 13/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMLBBadgeDefaultBackgroundColor		[UIColor colorWithRed:255 / 255.0 green:56 / 255.0 blue:36 / 255.0 alpha:1]

@interface MLBBadgeBackgroud : UIView

/**
 *  Badge 背景色，默认为红色。
 *
 *  Badge background color, default is kMLBBadgeDefaultBackgroundColor.
 */
@property (nonatomic) UIColor *mlb_backgroundColor;

/**
 *  Badge 边框颜色，默认为白色。
 *
 *  Badge border color, default is white.
 */
@property (nonatomic) UIColor *mlb_borderColor;

/**
 *  Badge 边框宽度，默认为 0。
 *
 *  Badge border width, default is 0.
 */
@property (nonatomic) CGFloat mlb_borderWidth;

@end
