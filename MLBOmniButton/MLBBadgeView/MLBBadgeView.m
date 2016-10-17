//
//  MLBBadgeView.m
//  MLBOmniButtonDemo
//
//  Created by meilbn on 13/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "MLBBadgeView.h"

@interface MLBBadgeView ()

@property (strong, nonatomic, readwrite) MLBBadgeBackgroud *mlb_badgeBackground;
@property (strong, nonatomic) UILabel *badgeLabel;

@end

@implementation MLBBadgeView

#pragma mark - LifeCycle

- (instancetype)init {
	self = [super init];
	
	if (self) {
		[self mlb_config];
		[self mlb_setupViews];
	}
	
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self) {
		[self mlb_config];
		[self mlb_setupViews];
	}
	
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	
	if (self) {
		[self mlb_config];
		[self mlb_setupViews];
	}
	
	return self;
}

#pragma mark - Setter

- (void)setMlb_badgeValue:(NSString *)mlb_badgeValue {
	if (![_mlb_badgeValue isEqualToString:mlb_badgeValue]) {
		_mlb_badgeValue = mlb_badgeValue.copy;
		
		_badgeLabel.text = _mlb_badgeValue;
		
		if (!_mlb_badgeValue || [_mlb_badgeValue isEqualToString:@""]) {
			self.hidden = YES;
		} else {
			self.hidden = NO;
			
			[self setNeedsLayout];
			[self layoutIfNeeded];
		}
	}
}

- (void)setMlb_maxWidth:(CGFloat)mlb_maxWidth {
	if (_mlb_maxWidth != mlb_maxWidth) {
		_mlb_maxWidth = mlb_maxWidth;
		[self setNeedsLayout];
	}
}

#pragma mark - Private Methods

- (void)mlb_config {
	_mlb_maxWidth = 0;
	_mlb_textColor = [UIColor whiteColor];
	_mlb_font = [UIFont systemFontOfSize:13];
}

- (void)mlb_setupViews {
	if (self.mlb_badgeBackground) {
		return;
	}
	
	self.backgroundColor = [UIColor clearColor];
	
	self.mlb_badgeBackground = [[MLBBadgeBackgroud alloc] initWithFrame:self.bounds];
	[self addSubview:self.mlb_badgeBackground];
	
	self.badgeLabel = [UILabel new];
	self.badgeLabel.backgroundColor = [UIColor clearColor];
	self.badgeLabel.textAlignment = NSTextAlignmentCenter;
	self.badgeLabel.textColor = _mlb_textColor;
	self.badgeLabel.font = _mlb_font;
	[self addSubview:self.badgeLabel];
}

#pragma mark - Parent Methods

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[self.badgeLabel sizeToFit];
	CGSize textSize = self.badgeLabel.frame.size;
	textSize = CGSizeMake(ceil(textSize.width), ceil(textSize.height));
	
	CGFloat height = textSize.height + 2;
	CGFloat width = MAX(textSize.width + 5 * 2, height);
	self.frame = (CGRect){self.frame.origin, CGSizeMake(_mlb_maxWidth > 0 ? MIN(width, _mlb_maxWidth) : width, height)};
	
	self.mlb_badgeBackground.frame = self.bounds;
	self.badgeLabel.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

@end
