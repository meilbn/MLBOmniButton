//
//  MLBOmniButton.m
//  MLBOmniButtonDemo
//
//  Created by meilbn on 11/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//
//  Version: 0.1

#import "MLBOmniButton.h"
#import "MLBBadgeView.h"

/*** Definitions of inline functions. ***/

CG_INLINE CGSize
CGSizeAddEdgeInsets(CGSize size, UIEdgeInsets insets) {
	CGSize rtnSize;
	rtnSize.width = insets.left + size.width + insets.right;
	rtnSize.height = insets.top + size.height + insets.bottom;
	return rtnSize;
}

CG_INLINE CGSize
CGSizeSubtractEdgeInsets(CGSize size, UIEdgeInsets insets) {
	CGSize rtnSize;
	rtnSize.width = size.width - insets.left - insets.right;
	rtnSize.height = size.height - insets.top - insets.bottom;
	return rtnSize;
}

CG_INLINE CGSize
CGSizeRounded(CGSize size) {
	return CGSizeMake(ceil(size.width), ceil(size.height));
}

@interface MLBOmniButton ()

@property (strong, nonatomic) MLBBadgeView *badgeView;

@end

@implementation MLBOmniButton {
	bool _userSetSize;
}

#pragma mark - Lifecycle

- (void)dealloc {
	NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (instancetype)init {
	if (self = [super init]) {
		[self mlb_config];
	}
	
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self mlb_config];
	}
	
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self mlb_config];
	}
	
	return self;
}

//- (void)prepareForInterfaceBuilder {
//	[super prepareForInterfaceBuilder];
//	
//	NSLog(@"%@", NSStringFromSelector(_cmd));
//#if TARGET_INTERFACE_BUILDER
//	[self mlb_render];
//#endif
//}

#pragma mark - Getter

- (MLBBadgeView *)badgeView {
	if (!_badgeView) {
		_badgeView = [[MLBBadgeView alloc] init];
		_badgeView.mlb_badgeBackground.mlb_borderColor = _mlb_badgeBorderColor;
		_badgeView.mlb_badgeBackground.mlb_borderWidth = _mlb_badgeBorderWidth;
		_badgeView.mlb_badgeBackground.mlb_backgroundColor = kMLBBadgeDefaultBackgroundColor;
		[self addSubview:_badgeView];
	}
	
	return _badgeView;
}

#pragma mark - Setter

- (void)setMlb_imageViewPosition:(MLBOmniButtonImageViewPosition)mlb_imageViewPosition {
	if (_mlb_imageViewPosition != mlb_imageViewPosition) {
		_mlb_imageViewPosition = mlb_imageViewPosition;
		
		[self setNeedsLayout];
	}
}

- (void)setMlb_badgeValue:(NSString *)mlb_badgeValue {
	if (![_mlb_badgeValue isEqualToString:mlb_badgeValue]) {
		_mlb_badgeValue = mlb_badgeValue.copy;
		
		self.badgeView.mlb_badgeValue = _mlb_badgeValue;
		
		if (_mlb_badgeValue && ![_mlb_badgeValue isEqualToString:@""]) {
			[self setNeedsLayout];
		} else {
			[self.badgeView removeFromSuperview];
			self.badgeView = nil;
		}
	}
}

- (void)setMlb_badgeBorderWidth:(CGFloat)mlb_badgeBorderWidth {
	if (_mlb_badgeBorderWidth != mlb_badgeBorderWidth) {
		_mlb_badgeBorderWidth = mlb_badgeBorderWidth;
		_badgeView.mlb_badgeBackground.mlb_borderWidth = _mlb_badgeBorderWidth;
	}
}

- (void)setMlb_badgeBorderColor:(UIColor *)mlb_badgeBorderColor {
	if (_mlb_badgeBorderColor != mlb_badgeBorderColor) {
		_mlb_badgeBorderColor = mlb_badgeBorderColor;
		_badgeView.mlb_badgeBackground.mlb_borderColor = _mlb_badgeBorderColor;
	}
}

- (void)setMlb_badgeBackgroundColor:(UIColor *)mlb_badgeBackgroundColor {
	if (_mlb_badgeBackgroundColor != mlb_badgeBackgroundColor) {
		_mlb_badgeBackgroundColor = mlb_badgeBackgroundColor;
		_badgeView.mlb_badgeBackground.mlb_backgroundColor = _mlb_badgeBackgroundColor;
	}
}

- (void)setMlb_badgeMaxWidth:(CGFloat)mlb_badgeMaxWidth {
	if (_mlb_badgeMaxWidth != mlb_badgeMaxWidth) {
		_mlb_badgeMaxWidth = mlb_badgeMaxWidth;
		_badgeView.mlb_maxWidth = _mlb_badgeMaxWidth;
	}
}

#pragma mark - Private Methods

- (void)mlb_config {
	_mlb_imageViewSize = CGSizeZero;
	_mlb_imageViewPosition = MLBOmniButtonImageViewPositionLeft;
	_userSetSize = !CGSizeEqualToSize(self.frame.size, CGSizeZero);
	_mlb_badgePosition = MLBOmniButtonBadgePositionContentTopRight;
	_mlb_badgeBorderColor = [UIColor whiteColor];
	_mlb_badgeBorderWidth = 0;
	_mlb_badgeBackgroundColor = kMLBBadgeDefaultBackgroundColor;
}

- (CGSize)mlb_buttonSizeNeedsLayout:(BOOL)needsLayout {
	// ImageView
	CGSize imageSize = CGSizeZero;
	CGSize imageViewSize = CGSizeZero;
	CGSize imageViewSizeWithEdgeInsets = CGSizeZero;
	
	// titleLabel
	CGSize titleSize = CGSizeZero;
	CGSize titleLabelSize = CGSizeZero;
	CGSize titleLabelSizeWithEdgeInsets = CGSizeZero;
	
	// content
	CGSize contentSize = CGSizeZero;
	CGSize contentSizeWithEdgeInsets = CGSizeZero;
	
	if (CGSizeEqualToSize(_mlb_imageViewSize, CGSizeZero)) { // imageView size is not set
		imageSize = self.currentImage.size;
	} else { // imageView size is set
		imageSize = _mlb_imageViewSize;
	}
	
	imageViewSize = imageSize;
	imageViewSizeWithEdgeInsets = CGSizeAddEdgeInsets(imageViewSize, self.imageEdgeInsets);
	
	titleSize = [self.currentTitle boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.titleLabel.font} context:nil].size;
	titleSize = CGSizeRounded(titleSize);
	titleLabelSize = titleSize;
	titleLabelSizeWithEdgeInsets = CGSizeAddEdgeInsets(titleSize, self.titleEdgeInsets);
	
	if (!_userSetSize || !needsLayout) { // not set size
		// calculate content size
		switch (_mlb_imageViewPosition) {
			case MLBOmniButtonImageViewPositionTop:
			case MLBOmniButtonImageViewPositionBottom: {
				contentSize = CGSizeMake(MAX(imageViewSizeWithEdgeInsets.width, titleLabelSizeWithEdgeInsets.width), imageViewSizeWithEdgeInsets.height + titleLabelSizeWithEdgeInsets.height);
				
				imageViewSizeWithEdgeInsets.width = contentSize.width;
				imageViewSize = CGSizeSubtractEdgeInsets(imageViewSizeWithEdgeInsets, self.imageEdgeInsets);
				
				titleLabelSizeWithEdgeInsets.width = contentSize.width;
				titleLabelSize = CGSizeSubtractEdgeInsets(titleLabelSizeWithEdgeInsets, self.titleEdgeInsets);
				
				break;
			}
			case MLBOmniButtonImageViewPositionLeft:
			case MLBOmniButtonImageViewPositionRight: {
				contentSize = CGSizeMake(imageViewSizeWithEdgeInsets.width + titleLabelSizeWithEdgeInsets.width, MAX(imageViewSizeWithEdgeInsets.height, titleLabelSizeWithEdgeInsets.height));
				
				imageViewSizeWithEdgeInsets.height = contentSize.height;
				imageViewSize = CGSizeSubtractEdgeInsets(imageViewSizeWithEdgeInsets, self.imageEdgeInsets);
				
				titleLabelSizeWithEdgeInsets.height = contentSize.height;
				titleLabelSize = CGSizeSubtractEdgeInsets(titleLabelSizeWithEdgeInsets, self.titleEdgeInsets);
				
				break;
			}
		}
		
		// calculate content bounds with contentEdgeInsets
		contentSizeWithEdgeInsets = CGSizeAddEdgeInsets(contentSize, self.contentEdgeInsets);
		contentSizeWithEdgeInsets = CGSizeRounded(contentSizeWithEdgeInsets);
		
		if (!needsLayout) {
			return contentSizeWithEdgeInsets;
		}
		
		// set frame
		self.frame = (CGRect){self.frame.origin, contentSizeWithEdgeInsets};
	} else { // set size
		contentSizeWithEdgeInsets = self.frame.size;
		contentSize = CGSizeSubtractEdgeInsets(contentSizeWithEdgeInsets, self.contentEdgeInsets);
		
		switch (_mlb_imageViewPosition) {
			case MLBOmniButtonImageViewPositionTop:
			case MLBOmniButtonImageViewPositionBottom: {
				imageViewSizeWithEdgeInsets = CGSizeMake(contentSize.width, imageSize.height + self.imageEdgeInsets.top + self.imageEdgeInsets.bottom);
				titleLabelSizeWithEdgeInsets = CGSizeMake(contentSize.width, titleSize.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom);
				break;
			}
			case MLBOmniButtonImageViewPositionLeft:
			case MLBOmniButtonImageViewPositionRight: {
				imageViewSizeWithEdgeInsets = CGSizeMake(imageSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right, contentSize.height);
				titleLabelSizeWithEdgeInsets = CGSizeMake(MIN(titleSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right, contentSize.width - imageViewSizeWithEdgeInsets.width), contentSize.height);
				
				if (imageViewSizeWithEdgeInsets.width + titleLabelSizeWithEdgeInsets.width > contentSize.width) {
					if (CGSizeEqualToSize(_mlb_imageViewSize, CGSizeZero)) {
						CGFloat halfDiff = (imageViewSizeWithEdgeInsets.width + titleLabelSizeWithEdgeInsets.width - contentSize.width) / 2.0;
						imageViewSizeWithEdgeInsets.width -= halfDiff;
						titleLabelSizeWithEdgeInsets.width -= halfDiff;
					} else {
						titleLabelSizeWithEdgeInsets.width -= imageViewSizeWithEdgeInsets.width + titleLabelSizeWithEdgeInsets.width - contentSize.width;
					}
				}
				
				break;
			}
		}
		
		imageViewSize = CGSizeSubtractEdgeInsets(imageViewSizeWithEdgeInsets, self.imageEdgeInsets);
		if ((imageSize.width > imageViewSize.width || imageSize.height > imageViewSize.height) && CGSizeEqualToSize(_mlb_imageViewSize, CGSizeZero)) {
			CGFloat ratio = MIN(imageViewSize.width / imageSize.width, imageViewSize.height / imageSize.height);
			imageSize = CGSizeMake(imageSize.width * ratio, imageSize.height * ratio);
		}
		
		titleLabelSize = CGSizeSubtractEdgeInsets(titleLabelSizeWithEdgeInsets, self.titleEdgeInsets);
		if (titleSize.width > titleLabelSize.width || titleSize.height > titleLabelSize.height) {
			titleSize = CGSizeMake(MIN(titleSize.width, titleLabelSize.width), MIN(titleSize.height, titleLabelSize.height));
		}
		
		if (self.titleLabel.numberOfLines != 1) {
			CGSize size = [self.titleLabel sizeThatFits:CGSizeMake(titleSize.width, CGFLOAT_MAX)];
			titleSize.height = size.height;
		}
	}
	
	/* layout ImageView and Label */
	switch (_mlb_imageViewPosition) {
		case MLBOmniButtonImageViewPositionTop:
		case MLBOmniButtonImageViewPositionBottom: {
			if (_mlb_imageViewPosition == MLBOmniButtonImageViewPositionTop) {
				self.imageView.frame = (CGRect){CGPointMake(self.contentEdgeInsets.left + self.imageEdgeInsets.left, self.contentEdgeInsets.top + self.imageEdgeInsets.top), imageSize};
				self.titleLabel.frame = (CGRect){CGPointMake(self.contentEdgeInsets.left + self.titleEdgeInsets.left, CGRectGetHeight(self.frame) - self.contentEdgeInsets.bottom - self.titleEdgeInsets.bottom - titleSize.height), titleSize};
			} else {
				self.imageView.frame = (CGRect){CGPointMake(self.contentEdgeInsets.left + self.imageEdgeInsets.left, CGRectGetHeight(self.frame) - self.contentEdgeInsets.bottom - self.imageEdgeInsets.bottom - imageSize.height), imageSize};
				self.titleLabel.frame = (CGRect){CGPointMake(self.contentEdgeInsets.left + self.titleEdgeInsets.left, self.contentEdgeInsets.top + self.titleEdgeInsets.top), titleSize};
			}
			
			CGPoint imageViewCenter = self.imageView.center;
			CGPoint titleLabelCenter = self.titleLabel.center;
			
			switch (self.contentHorizontalAlignment) {
				case UIControlContentHorizontalAlignmentCenter: {
					imageViewCenter.x = self.contentEdgeInsets.left + self.imageEdgeInsets.left + imageViewSize.width / 2.0;
					titleLabelCenter.x = self.contentEdgeInsets.left + self.titleEdgeInsets.left + titleLabelSize.width / 2.0;;
					break;
				}
				case UIControlContentHorizontalAlignmentLeft:
					imageViewCenter.x = self.contentEdgeInsets.left + self.imageEdgeInsets.left + imageSize.width / 2.0;
					titleLabelCenter.x = self.contentEdgeInsets.left + self.titleEdgeInsets.left + titleSize.width / 2.0;;
					break;
				case UIControlContentHorizontalAlignmentRight: {
					imageViewCenter.x = CGRectGetWidth(self.frame) - self.contentEdgeInsets.right - self.imageEdgeInsets.right - imageSize.width / 2.0;
					titleLabelCenter.x = CGRectGetWidth(self.frame) - self.contentEdgeInsets.right - self.titleEdgeInsets.right - titleSize.width / 2.0;;
					break;
				}
				case UIControlContentHorizontalAlignmentFill: {
					break;
				}
			}
			
			if (_mlb_imageViewPosition == MLBOmniButtonImageViewPositionTop) {
				switch (self.contentVerticalAlignment) {
					case UIControlContentVerticalAlignmentCenter: {
						CGFloat contentTopToBottomHeight = self.imageEdgeInsets.top + imageSize.height + self.imageEdgeInsets.bottom + self.titleEdgeInsets.top + titleSize.height + self.titleEdgeInsets.bottom;
						imageViewCenter.y = (CGRectGetHeight(self.frame) - contentTopToBottomHeight) / 2.0 + self.imageEdgeInsets.top + imageSize.height / 2.0;
						titleLabelCenter.y = (CGRectGetHeight(self.frame) + contentTopToBottomHeight) / 2.0 - self.titleEdgeInsets.bottom - titleSize.height / 2.0;
						break;
					}
					case UIControlContentVerticalAlignmentTop: {
						imageViewCenter.y = self.contentEdgeInsets.top + self.imageEdgeInsets.top + imageSize.height / 2.0;
						titleLabelCenter.y = imageViewCenter.y + imageSize.height / 2.0 + self.titleEdgeInsets.top + titleSize.height / 2.0;
						break;
					}
					case UIControlContentVerticalAlignmentBottom: {
						titleLabelCenter.y = CGRectGetHeight(self.frame) - self.contentEdgeInsets.bottom - self.titleEdgeInsets.bottom - titleSize.height / 2.0;
						imageViewCenter.y = titleLabelCenter.y - titleSize.height / 2.0 - self.titleEdgeInsets.top - imageSize.height / 2.0;
						break;
					}
					case UIControlContentVerticalAlignmentFill: {
						break;
					}
				}
			} else {
				switch (self.contentVerticalAlignment) {
					case UIControlContentVerticalAlignmentCenter: {
						CGFloat contentTopToBottomHeight = self.titleEdgeInsets.top + titleSize.height + self.titleEdgeInsets.bottom + self.imageEdgeInsets.top + imageSize.height + self.imageEdgeInsets.bottom;
						titleLabelCenter.y = (CGRectGetHeight(self.frame) - contentTopToBottomHeight) / 2.0 + self.titleEdgeInsets.top + titleSize.height / 2.0;
						imageViewCenter.y = (CGRectGetHeight(self.frame) + contentTopToBottomHeight) / 2.0 - self.imageEdgeInsets.bottom - imageSize.height / 2.0;
						break;
					}
					case UIControlContentVerticalAlignmentTop: {
						titleLabelCenter.y = self.contentEdgeInsets.top + self.titleEdgeInsets.top + titleSize.height / 2.0;
						imageViewCenter.y = titleLabelCenter.y + titleSize.height / 2.0 + self.titleEdgeInsets.bottom + self.imageEdgeInsets.top + imageSize.height / 2.0;
						break;
					}
					case UIControlContentVerticalAlignmentBottom: {
						imageViewCenter.y = CGRectGetHeight(self.frame) - self.contentEdgeInsets.bottom - self.imageEdgeInsets.bottom - imageSize.height / 2.0;
						titleLabelCenter.y = imageViewCenter.y - imageSize.height / 2.0 - self.imageEdgeInsets.top - self.titleEdgeInsets.bottom - titleSize.height / 2.0;
						break;
					}
					case UIControlContentVerticalAlignmentFill: {
						break;
					}
				}
			}
			
			self.imageView.center = imageViewCenter;
			self.titleLabel.center = titleLabelCenter;
			
			break;
		}
		case MLBOmniButtonImageViewPositionLeft:
		case MLBOmniButtonImageViewPositionRight: {
			if (_mlb_imageViewPosition == MLBOmniButtonImageViewPositionLeft) {
				self.imageView.frame = (CGRect){CGPointMake(self.contentEdgeInsets.left + self.imageEdgeInsets.left, self.contentEdgeInsets.top + self.imageEdgeInsets.top), imageSize};
				self.titleLabel.frame = (CGRect){CGPointMake(CGRectGetWidth(self.frame) - self.contentEdgeInsets.right - self.titleEdgeInsets.right - titleSize.width, self.contentEdgeInsets.top + self.titleEdgeInsets.top), titleSize};
			} else {
				self.imageView.frame = (CGRect){CGPointMake(CGRectGetWidth(self.frame) - self.contentEdgeInsets.right - self.imageEdgeInsets.right - imageSize.width, self.contentEdgeInsets.top + self.imageEdgeInsets.top), imageSize};
				self.titleLabel.frame = (CGRect){CGPointMake(self.contentEdgeInsets.left + self.titleEdgeInsets.left, self.contentEdgeInsets.top + self.titleEdgeInsets.top), titleSize};
			}
			
			CGPoint imageViewCenter = self.imageView.center;
			CGPoint titleLabelCenter = self.titleLabel.center;
			
			switch (self.contentVerticalAlignment) {
				case UIControlContentVerticalAlignmentCenter: {
					imageViewCenter.y = self.contentEdgeInsets.top + self.imageEdgeInsets.top + imageViewSize.height / 2.0;
					titleLabelCenter.y = self.contentEdgeInsets.top + self.titleEdgeInsets.top + titleLabelSize.height / 2.0;
					break;
				}
				case UIControlContentVerticalAlignmentTop: {
					imageViewCenter.y = self.contentEdgeInsets.top + self.imageEdgeInsets.top + imageSize.height / 2.0;
					titleLabelCenter.y = self.contentEdgeInsets.top + self.titleEdgeInsets.top + titleSize.height / 2.0;
					break;
				}
				case UIControlContentVerticalAlignmentBottom: {
					imageViewCenter.y = CGRectGetHeight(self.frame) - self.contentEdgeInsets.bottom - self.imageEdgeInsets.bottom - imageSize.height / 2.0;
					titleLabelCenter.y = CGRectGetHeight(self.frame) - self.contentEdgeInsets.bottom - self.titleEdgeInsets.bottom - titleSize.height / 2.0;
					break;
				}
				case UIControlContentVerticalAlignmentFill: {
					break;
				}
			}
			
			if (_mlb_imageViewPosition == MLBOmniButtonImageViewPositionLeft) {
				switch (self.contentHorizontalAlignment) {
					case UIControlContentHorizontalAlignmentCenter: {
						CGFloat contentLeftToRightWidth = self.imageEdgeInsets.left + imageSize.width + self.imageEdgeInsets.right + self.titleEdgeInsets.left + titleSize.width + self.titleEdgeInsets.right;
						imageViewCenter.x = (CGRectGetWidth(self.frame) - contentLeftToRightWidth) / 2.0 + self.imageEdgeInsets.left + imageSize.width / 2.0;
						titleLabelCenter.x = (CGRectGetWidth(self.frame) + contentLeftToRightWidth) / 2.0 - self.titleEdgeInsets.right - titleSize.width / 2.0;
						break;
					}
					case UIControlContentHorizontalAlignmentLeft:
						imageViewCenter.x = self.contentEdgeInsets.left + self.imageEdgeInsets.left + imageSize.width / 2.0;
						titleLabelCenter.x = imageViewCenter.x + imageSize.width / 2 + self.imageEdgeInsets.right + self.titleEdgeInsets.left + titleSize.width / 2.0;
						break;
					case UIControlContentHorizontalAlignmentRight: {
						titleLabelCenter.x = CGRectGetWidth(self.frame) - self.contentEdgeInsets.right - self.titleEdgeInsets.right - titleSize.width / 2.0;
						imageViewCenter.x = titleLabelCenter.x - titleSize.width / 2.0 - self.titleEdgeInsets.left - self.imageEdgeInsets.right - imageSize.width / 2.0;
						break;
					}
					case UIControlContentHorizontalAlignmentFill: {
						break;
					}
				}
			} else {
				switch (self.contentHorizontalAlignment) {
					case UIControlContentHorizontalAlignmentCenter: {
						CGFloat contentLeftToRightWidth = self.titleEdgeInsets.left + titleSize.width + self.titleEdgeInsets.right + self.imageEdgeInsets.left + imageSize.width + self.imageEdgeInsets.right;
						titleLabelCenter.x = (CGRectGetWidth(self.frame) - contentLeftToRightWidth) / 2.0 + self.titleEdgeInsets.left + titleSize.width / 2.0;
						imageViewCenter.x = (CGRectGetWidth(self.frame) + contentLeftToRightWidth) / 2.0 - self.imageEdgeInsets.right - imageSize.width / 2.0;
						break;
					}
					case UIControlContentHorizontalAlignmentLeft:
						titleLabelCenter.x = self.contentEdgeInsets.left + self.titleEdgeInsets.left + titleSize.width / 2.0;
						imageViewCenter.x = titleLabelCenter.x + titleSize.width / 2.0 + self.titleEdgeInsets.right + self.imageEdgeInsets.left + imageSize.width / 2.0;
						break;
					case UIControlContentHorizontalAlignmentRight: {
						imageViewCenter.x = CGRectGetWidth(self.frame) - self.contentEdgeInsets.right - self.imageEdgeInsets.right - imageSize.width / 2.0;
						titleLabelCenter.x = imageViewCenter.x - imageSize.width / 2.0 - self.imageEdgeInsets.left - self.titleEdgeInsets.right - titleSize.width / 2.0;
						break;
					}
					case UIControlContentHorizontalAlignmentFill: {
						break;
					}
				}
			}
			
			self.imageView.center = imageViewCenter;
			self.titleLabel.center = titleLabelCenter;
			
			break;
		}
	}
	
	// layout BadgeView
	if (_mlb_badgeValue && ![_mlb_badgeValue isEqualToString:@""]) {
		[self bringSubviewToFront:_badgeView];
		
		CGPoint badgeCenter = CGPointZero;
		
		switch (_mlb_badgePosition) {
			case MLBOmniButtonBadgePositionLabelTopLeft: {
				badgeCenter = self.titleLabel.frame.origin;
				break;
			}
			case MLBOmniButtonBadgePositionLabelTopRight: {
				badgeCenter = (CGPoint){CGRectGetMaxX(self.titleLabel.frame), CGRectGetMinY(self.titleLabel.frame)};
				break;
			}
			case MLBOmniButtonBadgePositionLabelBottomLeft: {
				badgeCenter = (CGPoint){CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame)};
				break;
			}
			case MLBOmniButtonBadgePositionLabelBottomRight: {
				badgeCenter = (CGPoint){CGRectGetMaxX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame)};
				break;
			}
			case MLBOmniButtonBadgePositionImageTopLeft: {
				badgeCenter = self.imageView.frame.origin;
				break;
			}
			case MLBOmniButtonBadgePositionImageTopRight: {
				badgeCenter = (CGPoint){CGRectGetMaxX(self.imageView.frame), CGRectGetMinY(self.imageView.frame)};
				break;
			}
			case MLBOmniButtonBadgePositionImageBottomLeft: {
				badgeCenter = (CGPoint){CGRectGetMinX(self.imageView.frame), CGRectGetMaxY(self.imageView.frame)};
				break;
			}
			case MLBOmniButtonBadgePositionImageBottomRight: {
				badgeCenter = (CGPoint){CGRectGetMaxX(self.imageView.frame), CGRectGetMaxY(self.imageView.frame)};
				break;
			}
			case MLBOmniButtonBadgePositionContentTopLeft: {
				badgeCenter = (CGPoint){CGRectGetWidth(_badgeView.frame) / 2.0, CGRectGetHeight(_badgeView.frame) / 2.0};
				break;
			}
			case MLBOmniButtonBadgePositionContentTopRight: {
				badgeCenter = (CGPoint){CGRectGetWidth(self.frame) - CGRectGetWidth(_badgeView.frame) / 2.0, CGRectGetHeight(_badgeView.frame) / 2.0};
				break;
			}
			case MLBOmniButtonBadgePositionContentBottomLeft: {
				badgeCenter = (CGPoint){CGRectGetWidth(_badgeView.frame) / 2.0, CGRectGetHeight(self.frame) - CGRectGetHeight(_badgeView.frame) / 2.0};
				break;
			}
			case MLBOmniButtonBadgePositionContentBottomRight: {
				badgeCenter = (CGPoint){CGRectGetWidth(self.frame) - CGRectGetWidth(_badgeView.frame) / 2.0, CGRectGetHeight(self.frame) - CGRectGetHeight(_badgeView.frame) / 2.0};
				break;
			}
		}
		
		// deal with edge cases
		switch (_mlb_badgePosition) {
			case MLBOmniButtonBadgePositionLabelTopLeft:
			case MLBOmniButtonBadgePositionLabelBottomLeft:
			case MLBOmniButtonBadgePositionImageTopLeft:
			case MLBOmniButtonBadgePositionImageBottomLeft: {
				CGFloat beyondX = badgeCenter.x - CGRectGetWidth(_badgeView.frame) / 2.0;
				if (beyondX < 0) {
					badgeCenter.x += fabs(beyondX);
				}
				break;
			}
			case MLBOmniButtonBadgePositionLabelTopRight:
			case MLBOmniButtonBadgePositionLabelBottomRight:
			case MLBOmniButtonBadgePositionImageTopRight:
			case MLBOmniButtonBadgePositionImageBottomRight: {
				CGFloat beyondX = badgeCenter.x + CGRectGetWidth(_badgeView.frame) / 2.0 - CGRectGetWidth(self.frame);
				if (beyondX > 0) {
					badgeCenter.x -= beyondX;
				}
				break;
			}
			default:
				break;
		}
		
		switch (_mlb_badgePosition) {
			case MLBOmniButtonBadgePositionLabelTopLeft:
			case MLBOmniButtonBadgePositionLabelTopRight:
			case MLBOmniButtonBadgePositionImageTopLeft:
			case MLBOmniButtonBadgePositionImageTopRight: {
				CGFloat beyondY = badgeCenter.y - CGRectGetHeight(_badgeView.frame) / 2.0;
				if (beyondY < 0) {
					badgeCenter.y += fabs(beyondY);
				}
				break;
			}
			case MLBOmniButtonBadgePositionLabelBottomLeft:
			case MLBOmniButtonBadgePositionLabelBottomRight:
			case MLBOmniButtonBadgePositionImageBottomLeft:
			case MLBOmniButtonBadgePositionImageBottomRight: {
				CGFloat beyondY = badgeCenter.y + CGRectGetHeight(_badgeView.frame) / 2.0 - CGRectGetHeight(self.frame);
				if (beyondY > 0) {
					badgeCenter.y -= beyondY;
				}
				break;
			}
			default:
				break;
		}
		
		_badgeView.center = badgeCenter;
	}
	
	return CGSizeZero;
}

#pragma mark - Parent Methods

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[self mlb_buttonSizeNeedsLayout:YES];
}

- (CGSize)intrinsicContentSize {
	CGSize contentSize = [self mlb_buttonSizeNeedsLayout:NO];
	if (!CGSizeEqualToSize(contentSize, CGSizeZero)) {
		return contentSize;
	}
	
	return [super intrinsicContentSize];
}

@end
