//
//  MLBAutoLayoutViewController.m
//  MLBOmniButtonDemo
//
//  Created by meilbn on 13/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//
//  Version: 0.1

#import "MLBAutoLayoutViewController.h"
#import "MLBOmniButton.h"

@interface MLBAutoLayoutViewController ()

@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonTop;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonBottom;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonLeft;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonRight;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonLeftSingleLine;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonRightMultiLines;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonLeftWithSizeCons;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonTopWithImageSize;

@end

@implementation MLBAutoLayoutViewController

#pragma mark - Lifecycle

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
	self.edgesForExtendedLayout = UIRectEdgeNone;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	[self initDatas];
	[self setupViews];
}

#pragma mark - Private Methods

- (void)initDatas {
	
}

- (void)setupViews {
	_buttonTop.mlb_imageViewPosition = MLBOmniButtonImageViewPositionTop;
	[self addButtonBorder:_buttonTop];
	_buttonTop.mlb_badgePosition = MLBOmniButtonBadgePositionContentTopLeft;
	_buttonTop.mlb_badgeValue = @"1";
	
	_buttonBottom.mlb_imageViewPosition = MLBOmniButtonImageViewPositionBottom;
	[self addButtonBorder:_buttonBottom];
	_buttonBottom.mlb_badgePosition = MLBOmniButtonBadgePositionImageBottomRight;
	_buttonBottom.mlb_badgeValue = @"4";
	
	_buttonLeft.mlb_imageViewPosition = MLBOmniButtonImageViewPositionLeft;
	[self addButtonBorder:_buttonLeft];
	_buttonLeft.mlb_badgePosition = MLBOmniButtonBadgePositionLabelBottomRight;
	_buttonLeft.mlb_badgeValue = @"7";
	
	_buttonRight.mlb_imageViewPosition = MLBOmniButtonImageViewPositionRight;
	[self addButtonBorder:_buttonRight];
	_buttonRight.mlb_badgePosition = MLBOmniButtonBadgePositionImageBottomLeft;
	_buttonRight.mlb_badgeValue = @"11";
	
	_buttonLeftSingleLine.mlb_imageViewPosition = MLBOmniButtonImageViewPositionLeft;
	[_buttonLeftSingleLine setTitle:@"ButtonButtonButtonButtonButtonButtonButtonButtonButton" forState:UIControlStateNormal];
	[self addButtonBorder:_buttonLeftSingleLine];
	_buttonLeftSingleLine.mlb_badgePosition = MLBOmniButtonBadgePositionLabelBottomLeft;
	_buttonLeftSingleLine.mlb_badgeValue = @"15";
	
	_buttonRightMultiLines.mlb_imageViewPosition = MLBOmniButtonImageViewPositionRight;
	_buttonRightMultiLines.titleLabel.numberOfLines = 2;
	[_buttonRightMultiLines setTitle:@"ButtonButtonButtonButtonButtonButtonButtonButtonButton" forState:UIControlStateNormal];
	[self addButtonBorder:_buttonRightMultiLines];
	_buttonRightMultiLines.mlb_badgePosition = MLBOmniButtonBadgePositionContentTopRight;
	_buttonRightMultiLines.mlb_badgeValue = @"21";
	
	_buttonLeftWithSizeCons.mlb_imageViewPosition = MLBOmniButtonImageViewPositionLeft;
	[self addButtonBorder:_buttonLeftWithSizeCons];
	_buttonLeftWithSizeCons.mlb_badgePosition = MLBOmniButtonBadgePositionContentBottomRight;
	_buttonLeftWithSizeCons.mlb_badgeValue = @"99+";
	
	_buttonTopWithImageSize.mlb_imageViewPosition = MLBOmniButtonImageViewPositionTop;
	_buttonTopWithImageSize.mlb_imageViewSize = CGSizeMake(25, 25);
	[self addButtonBorder:_buttonTopWithImageSize];
	_buttonTopWithImageSize.mlb_badgePosition = MLBOmniButtonBadgePositionContentBottomRight;
	_buttonTopWithImageSize.mlb_badgeValue = @"100";
}

- (void)addButtonBorder:(UIButton *)button {
	button.layer.borderColor = [UIColor colorWithRed:30 / 255.0 green:144 / 255.0 blue:255 / 255.0 alpha:1.000].CGColor;
	button.layer.borderWidth = 0.5;
}

#pragma mark - Action



#pragma mark - Network Request




@end
