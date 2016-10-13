//
//  MLBOmniButton.h
//  MLBOmniButtonDemo
//
//  Created by meilbn on 11/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MLBOmniButtonImageViewPosition) {
	MLBOmniButtonImageViewPositionTop,    // ImageView 在 titleLabel 上方 // The ImageView is above of the titleLabel
	MLBOmniButtonImageViewPositionLeft,   // ImageView 在 titleLabel 左侧 // The ImageView is left of the titleLabel
	MLBOmniButtonImageViewPositionBottom, // ImageView 在 titleLabel 下方 // The ImageView is bottom of the titleLabel
	MLBOmniButtonImageViewPositionRight,  // ImageView 在 titleLabel 右方 // The ImageView is right of the titleLabel
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