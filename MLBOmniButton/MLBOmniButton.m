//
//  MLBOmniButton.m
//  MLBOmniButtonDemo
//
//  Created by meilbn on 11/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "MLBOmniButton.h"

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

@interface MLBOmniButton ()

@end

@implementation MLBOmniButton {
	bool _userSetSize;
}

#pragma mark - Lifecycle

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

- (void)prepareForInterfaceBuilder {
	[super prepareForInterfaceBuilder];
	
#if TARGET_INTERFACE_BUILDER
	[self mlb_render];
#endif
}

#pragma mark - Setter

- (void)setMlb_imageViewPosition:(MLBOmniButtonImageViewPosition)mlb_imageViewPosition {
	if (_mlb_imageViewPosition != mlb_imageViewPosition) {
		_mlb_imageViewPosition = mlb_imageViewPosition;
		
		[self setNeedsLayout];
	}
}

#pragma mark - Private Methods

- (void)mlb_config {
	NSLog(@"%@", NSStringFromSelector(_cmd));
	_mlb_imageViewSize = CGSizeZero;
	_mlb_imageViewPosition = MLBOmniButtonImageViewPositionLeft;
	_userSetSize = !CGSizeEqualToSize(self.frame.size, CGSizeZero);
//	NSLog(@"_userSetsFrame = %@", _userSetSize == MLBBOOLTrue ? @"YES" : @"NO");
}

- (void)mlb_render {
	[self setImage:[self imageForState:UIControlStateNormal] forState:UIControlStateNormal];
	[self setImage:[self imageForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
	[self setImage:[self imageForState:UIControlStateSelected] forState:UIControlStateSelected];
	[self setImage:[self imageForState:UIControlStateDisabled] forState:UIControlStateDisabled];
	
	[self setTitle:[self titleForState:UIControlStateNormal] forState:UIControlStateNormal];
	[self setTitle:[self titleForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
	[self setTitle:[self titleForState:UIControlStateSelected] forState:UIControlStateSelected];
	[self setTitle:[self titleForState:UIControlStateDisabled] forState:UIControlStateDisabled];
	
	[self setTitleColor:[self titleColorForState:UIControlStateNormal] forState:UIControlStateNormal];
	[self setTitleColor:[self titleColorForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
	[self setTitleColor:[self titleColorForState:UIControlStateSelected] forState:UIControlStateSelected];
	[self setTitleColor:[self titleColorForState:UIControlStateDisabled] forState:UIControlStateDisabled];
}

//- (CGSize)contentSize {
//	// ImageView
//	CGSize imageSize = CGSizeZero;
//	CGSize imageViewSize = CGSizeZero;
//	CGSize imageViewSizeWithEdgeInsets = CGSizeZero;
//	
//	// titleLabel
//	CGSize titleSize = CGSizeZero;
//	CGSize titleLabelSize = CGSizeZero;
//	CGSize titleLabelSizeWithEdgeInsets = CGSizeZero;
//	
//	// content
//	CGSize contentSize = CGSizeZero;
//	CGSize contentSizeWithEdgeInsets = CGSizeZero;
//	
//	if (CGSizeEqualToSize(_mlb_imageViewSize, CGSizeZero)) { // imageView size is not set
//		imageSize = self.currentImage.size;
//	} else { // imageView size is set
//		imageSize = _mlb_imageViewSize;
//	}
//	
//	imageViewSize = imageSize;
//	imageViewSizeWithEdgeInsets = CGSizeAddEdgeInsets(imageViewSize, self.imageEdgeInsets);
//	
//	titleSize = [self.currentTitle boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.titleLabel.font} context:nil].size;
//	titleLabelSize = titleSize;
//	titleLabelSizeWithEdgeInsets = CGSizeAddEdgeInsets(titleSize, self.titleEdgeInsets);
//	
//	// calculate content size
//	switch (_mlb_imageViewPosition) {
//		case MLBOmniButtonImageViewPositionTop:
//		case MLBOmniButtonImageViewPositionBottom: {
//			contentSize = CGSizeMake(MAX(imageViewSizeWithEdgeInsets.width, titleLabelSizeWithEdgeInsets.width), imageViewSizeWithEdgeInsets.height + titleLabelSizeWithEdgeInsets.height);
//			
//			imageViewSizeWithEdgeInsets.width = contentSize.width;
//			imageViewSize = CGSizeSubtractEdgeInsets(imageViewSizeWithEdgeInsets, self.imageEdgeInsets);
//			
//			titleLabelSizeWithEdgeInsets.width = contentSize.width;
//			titleSize = CGSizeSubtractEdgeInsets(titleLabelSizeWithEdgeInsets, self.titleEdgeInsets);
//			
//			break;
//		}
//		case MLBOmniButtonImageViewPositionLeft:
//		case MLBOmniButtonImageViewPositionRight: {
//			contentSize = CGSizeMake(imageViewSizeWithEdgeInsets.width + titleLabelSizeWithEdgeInsets.width, MAX(imageViewSizeWithEdgeInsets.height, titleLabelSizeWithEdgeInsets.height));
//			break;
//		}
//	}
//	
//	// calculate content bounds with contentEdgeInsets
//	contentSizeWithEdgeInsets = CGSizeAddEdgeInsets(contentSize, self.contentEdgeInsets);
//	
//	return contentSizeWithEdgeInsets;
//}

- (CGSize)mlb_buttonSizeNeedsLayout:(BOOL)needsLayout {
	//	NSLog(@"-----------------------");
	//	NSLog(@"_mlb_imageViewPosition = %ld, self.frame = %@", _mlb_imageViewPosition, NSStringFromCGRect(self.frame));
	
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
	titleLabelSize = titleSize;
	titleLabelSizeWithEdgeInsets = CGSizeAddEdgeInsets(titleSize, self.titleEdgeInsets);
	
	if (!_userSetSize) { // not set size
		// calculate content size
		switch (_mlb_imageViewPosition) {
			case MLBOmniButtonImageViewPositionTop:
			case MLBOmniButtonImageViewPositionBottom: {
				contentSize = CGSizeMake(MAX(imageViewSizeWithEdgeInsets.width, titleLabelSizeWithEdgeInsets.width), imageViewSizeWithEdgeInsets.height + titleLabelSizeWithEdgeInsets.height);
				
				imageViewSizeWithEdgeInsets.width = contentSize.width;
				imageViewSize = CGSizeSubtractEdgeInsets(imageViewSizeWithEdgeInsets, self.imageEdgeInsets);
				
				titleLabelSizeWithEdgeInsets.width = contentSize.width;
				titleSize = CGSizeSubtractEdgeInsets(titleLabelSizeWithEdgeInsets, self.titleEdgeInsets);
				
				break;
			}
			case MLBOmniButtonImageViewPositionLeft:
			case MLBOmniButtonImageViewPositionRight: {
				contentSize = CGSizeMake(imageViewSizeWithEdgeInsets.width + titleLabelSizeWithEdgeInsets.width, MAX(imageViewSizeWithEdgeInsets.height, titleLabelSizeWithEdgeInsets.height));
				break;
			}
		}
		
		// calculate content bounds with contentEdgeInsets
		contentSizeWithEdgeInsets = CGSizeAddEdgeInsets(contentSize, self.contentEdgeInsets);
		
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
	
	//	NSLog(@"contentSizeWithEdgeInsets = %@", NSStringFromCGSize(contentSizeWithEdgeInsets));
	//	NSLog(@"\nimageSize = %@,\nimageViewSize = %@,\nimageViewSizeWithEdgeInsets = %@,\ntitleSize = %@,\ntitleLabelSize = %@,\ntitleLabelSizeWithEdgeInsets = %@", NSStringFromCGSize(imageSize), NSStringFromCGSize(imageViewSize), NSStringFromCGSize(imageViewSizeWithEdgeInsets), NSStringFromCGSize(titleSize), NSStringFromCGSize(titleLabelSize), NSStringFromCGSize(titleLabelSizeWithEdgeInsets));
	
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
	
	return CGSizeZero;
}

#pragma mark - Parent Methods

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[self mlb_buttonSizeNeedsLayout:YES];
}

- (CGSize)intrinsicContentSize {
	NSLog(@"%@", NSStringFromSelector(_cmd));
	
	CGSize contentSize = [self mlb_buttonSizeNeedsLayout:NO];
	NSLog(@"contentSize = %@", NSStringFromCGSize(contentSize));
	if (!CGSizeEqualToSize(contentSize, CGSizeZero)) {
		return contentSize;
	}
	
	return [super intrinsicContentSize];
}

@end
