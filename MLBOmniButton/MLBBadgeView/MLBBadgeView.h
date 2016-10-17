//
//  MLBBadgeView.h
//  MLBOmniButtonDemo
//
//  Created by meilbn on 13/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLBBadgeBackgroud.h"

@interface MLBBadgeView : UIView

/***** for badgeView *****/

/**
 *  BadgeView 最大的宽度，默认为0，不做限制。
 *
 *  BadgeView max width, default is 0, no limit.
 */
@property (nonatomic) CGFloat mlb_maxWidth;


/***** badgeBackgroundView *****/

@property (nonatomic, readonly, strong) MLBBadgeBackgroud *mlb_badgeBackground;


/***** for badgeLabel *****/

/**
 *  Badge 文件颜色，默认为白色。
 *
 *  Badge text color, default is white.
 */
@property (nonatomic) UIColor *mlb_textColor;

/**
 *  Badge 字体，默认为系统字体，大小为 13。
 *
 *  Badge font, default is system font, size is 13.
 */
@property (nonatomic) UIFont *mlb_font;

/**
 *  Badge 文字
 *
 *  Badge text
 */
@property (nonatomic, copy) NSString *mlb_badgeValue;

@end
