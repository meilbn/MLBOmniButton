//
//  MLBBadgeBackgroud.m
//  MLBOmniButtonDemo
//
//  Created by meilbn on 13/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "MLBBadgeBackgroud.h"

@interface MLBBadgeBackgroud ()

@end

@implementation MLBBadgeBackgroud

+ (Class)layerClass {
	// this make our view create a CAShapeLayer
	// instead of a CALayer for its backing layer
	return [CAShapeLayer class];
}

#pragma mark - LifeCycle

- (instancetype)init {
	self = [super init];
	
	if (self) {
		[self mlb_config];
		[self mlb_updateView];
	}
	
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self) {
		[self mlb_config];
		[self mlb_updateView];
	}
	
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	
	if (self) {
		[self mlb_config];
		[self mlb_updateView];
	}
	
	return self;
}

#pragma mark - Parent Methods

- (void)drawRect:(CGRect)rect {
	UIBezierPath *cornersPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CGRectGetHeight(self.bounds)];
	
	((CAShapeLayer *)self.layer).strokeColor = _mlb_borderColor.CGColor;
	((CAShapeLayer *)self.layer).fillColor = _mlb_backgroundColor.CGColor;
	((CAShapeLayer *)self.layer).lineWidth = _mlb_borderWidth;
	((CAShapeLayer *)self.layer).path = cornersPath.CGPath;
}

#pragma mark - Setter

- (void)setMlb_backgroundColor:(UIColor *)mlb_backgroundColor {
	if (_mlb_backgroundColor != mlb_backgroundColor) {
		_mlb_backgroundColor = mlb_backgroundColor;
		((CAShapeLayer *)self.layer).fillColor = _mlb_backgroundColor.CGColor;
		[self setNeedsDisplay];
	}
}

- (void)setMlb_borderColor:(UIColor *)mlb_borderColor {
	if (_mlb_borderColor != mlb_borderColor) {
		_mlb_borderColor = mlb_borderColor;
		((CAShapeLayer *)self.layer).strokeColor = _mlb_borderColor.CGColor;
		[self setNeedsDisplay];
	}
}

- (void)setMlb_borderWidth:(CGFloat)mlb_borderWidth {
	if (_mlb_borderWidth != mlb_borderWidth) {
		_mlb_borderWidth = mlb_borderWidth;
		((CAShapeLayer *)self.layer).lineWidth = _mlb_borderWidth;
		[self setNeedsDisplay];
	}
}

#pragma mark - Private Methods

- (void)mlb_config {
	if (!_mlb_backgroundColor) {
		self.contentMode = UIViewContentModeRedraw;
		_mlb_backgroundColor = kMLBBadgeDefaultBackgroundColor;
		_mlb_borderColor = [UIColor whiteColor];
		_mlb_borderWidth = 0;
	}
}

- (void)mlb_updateView {
	self.backgroundColor = [UIColor clearColor];
}

@end
