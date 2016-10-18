//
//  MLBOmniButton.h
//  MLBOmniButtonDemo
//
//  Created by meilbn on 11/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//
//  Version: 0.0.1

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MLBOmniButtonImageViewPosition) {
	MLBOmniButtonImageViewPositionTop,    // ImageView 在 titleLabel 上方 // The ImageView is above of the titleLabel
	MLBOmniButtonImageViewPositionLeft,   // ImageView 在 titleLabel 左侧 // The ImageView is left of the titleLabel
	MLBOmniButtonImageViewPositionBottom, // ImageView 在 titleLabel 下方 // The ImageView is bottom of the titleLabel
	MLBOmniButtonImageViewPositionRight,  // ImageView 在 titleLabel 右方 // The ImageView is right of the titleLabel
};

typedef NS_ENUM(NSUInteger, MLBOmniButtonBadgePosition) {
	// sticky with Label
	MLBOmniButtonBadgePositionLabelTopLeft,
	MLBOmniButtonBadgePositionLabelTopRight,
	MLBOmniButtonBadgePositionLabelBottomLeft,
	MLBOmniButtonBadgePositionLabelBottomRight,
	
	// sticky with ImageView
	MLBOmniButtonBadgePositionImageTopLeft,
	MLBOmniButtonBadgePositionImageTopRight,
	MLBOmniButtonBadgePositionImageBottomLeft,
	MLBOmniButtonBadgePositionImageBottomRight,
	
	// sticky with Content, ingore button's contentEdgeInsets
	MLBOmniButtonBadgePositionContentTopLeft,
	MLBOmniButtonBadgePositionContentTopRight,
	MLBOmniButtonBadgePositionContentBottomLeft,
	MLBOmniButtonBadgePositionContentBottomRight,
};

//IB_DESIGNABLE
@interface MLBOmniButton : UIButton

/**
 *  限制图片视图的大小，默认为 CGSizeZero，也就是不限制。
 *
 *  Limit the size of imageView, default is CGSizeZero, i.e. no limit.
 */
@property (nonatomic) CGSize mlb_imageViewSize;

/**
 *  图片视图的位置，默认为 MLBOmniButtonImageViewPositionLeft。
 *
 *  imageView's position, default is MLBOmniButtonImageViewPositionLeft.
 *
 *
 *  MLBOmniButtonImageViewPositionTop:
 *
 *  -----------------
 *  |				|
 *  |	ImageView	|
 *  |				|
 *  |	titleLabel	|
 *  |				|
 *  -----------------
 *
 *  MLBOmniButtonImageViewPositionLeft：
 *
 *  -----------------------------
 *  |							|
 *  |	ImageView titleLabel	|
 *  |							|
 *  -----------------------------
 *
 *  MLBOmniButtonImageViewPositionBottom:
 *
 *  -----------------
 *  |				|
 *  |	titleLabel	|
 *  |				|
 *  |	ImageView	|
 *  |				|
 *  -----------------
 *
 *  MLBOmniButtonImageViewPositionRight：
 *
 *  -----------------------------
 *  |							|
 *  |	titleLabel ImageView	|
 *  |							|
 *  -----------------------------
 *
 */
@property (nonatomic) MLBOmniButtonImageViewPosition mlb_imageViewPosition;// IBInspectable

// Badge

@property (nullable, nonatomic, copy) NSString *mlb_badgeValue; // default is nil

@property (nonatomic) MLBOmniButtonBadgePosition mlb_badgePosition; // default is MLBOmniButtonBadgePositionContentTopRight

@property (nonnull, nonatomic) UIColor *mlb_badgeBorderColor; // default is white

@property (nonatomic) CGFloat mlb_badgeBorderWidth; // default is 0

@property (nonnull, nonatomic) UIColor *mlb_badgeBackgroundColor; // default is kMLBBadgeDefaultBackgroundColor

@property (nonatomic) CGFloat mlb_badgeMaxWidth; // default is 0, no limit

// Web image

/**
 *  显示网络图片
 *
 *  Show image from internet
 *
 *  @param url              图片 URL 地址
 *  @param placeholderImage 占位图
 *  @param state            按钮状态
 *  @param storeImageToDisk 是否保存到硬盘
 */
- (void)mlb_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage forState:(UIControlState)state storeImageToDisk:(BOOL)storeImageToDisk;

@end


/* --------------- Edge Insets --------------- */
//
//		---------------------------------
//		|								|
//		|		Content Edge Insets		|
//		|								|
//		|	-------------------------	|
//		|	|	Image Edge Insets	|	|
//		|	|						|	|
//		|	|	-----------------	|	|
//		|	|	|				|	|	|
//		|	|	|				|	|	|
//		|	|	|				|	|	|
//		|	|	|	ImageView	|	|	|
//		|	|	|				|	|	|
//		|	|	|				|	|	|
//		|	|	|				|	|	|
//		|	|	-----------------	|	|
//		|	|						|	|
//		|	-------------------------	|
//		|								|
//		|								|
//		|	-------------------------	|
//		|	|	Title Edge Insets	|	|
//		|	|						|	|
//		|	|	-----------------	|	|
//		|	|	|				|	|	|
//		|	|	|	titleLabel	|	|	|
//		|	|	|				|	|	|
//		|	|	-----------------	|	|
//		|	|						|	|
//		|	-------------------------	|
//		|								|
//		---------------------------------