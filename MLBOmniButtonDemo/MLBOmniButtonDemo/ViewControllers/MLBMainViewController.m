//
//  MLBMainViewController.m
//  MLBOmniButtonDemo
//
//  Created by meilbn on 11/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "MLBMainViewController.h"
#import <Masonry/Masonry.h>
#import "MLBOmniButton.h"

@interface MLBMainViewController ()

@property (strong, nonatomic) MLBOmniButton *omniButton;
@property (strong, nonatomic) MLBOmniButton *omniButtonLeft;

@property (strong, nonatomic) MLBOmniButton *button0;
@property (strong, nonatomic) MLBOmniButton *button1;
@property (strong, nonatomic) MLBOmniButton *button2;
@property (strong, nonatomic) MLBOmniButton *button3;

@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonInIB;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonInIB1;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonInIBRight;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonInIBWithSizeCons;
@property (weak, nonatomic) IBOutlet MLBOmniButton *buttonInIBMultiLines;

@end

@implementation MLBMainViewController

#pragma mark - Lifecycle

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.title = @"Main";
	
	[self initDatas];
	[self setupViews];
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	
//	_button0.center = CGPointMake(self.view.center.x, 70);
//	_button1.center = CGPointMake(self.view.center.x, 150);
//	_button2.center = CGPointMake(self.view.center.x, 300);
//	_button3.center = CGPointMake(self.view.center.x, 450);
	
	_omniButton.center = self.view.center;
}

#pragma mark - Private Methods

- (void)initDatas {
	
}

- (void)setupViews {
//	_button0 = [self addbuttonWithFrame:CGRectZero bgColor:[UIColor greenColor] title:@"BUTTON" imageName:@"icon_adding_user" imageViewPosition:MLBOmniButtonImageViewPositionLeft imageEdgeInsets:UIEdgeInsetsZero titleEdgeInsets:UIEdgeInsetsZero contentEdgeInsets:UIEdgeInsetsZero];
//	[button0 mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.centerX.equalTo(self.view);
//		make.top.equalTo(self.view);
//	}];

//	_button1 = [self addbuttonWithFrame:CGRectZero bgColor:[UIColor greenColor] title:@"BUTTON" imageName:@"icon_adding_user" imageViewPosition:MLBOmniButtonImageViewPositionRight imageEdgeInsets:UIEdgeInsetsMake(0, 5, 8, 0) titleEdgeInsets:UIEdgeInsetsZero contentEdgeInsets:UIEdgeInsetsMake(10, 2, 5, 15)];
//	[button1 mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.centerX.equalTo(self.view);
//		make.top.equalTo(button0.mas_bottom).offset(5);
//	}];
	
//	_button2 = [self addbuttonWithFrame:CGRectZero bgColor:[UIColor greenColor] title:@"BUTTON" imageName:@"icon_adding_user" imageViewPosition:MLBOmniButtonImageViewPositionBottom imageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5) titleEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2) contentEdgeInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
//	[button2 mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.centerX.equalTo(self.view);
//		make.top.equalTo(button1.mas_bottom).offset(5);
//	}];
	
//	UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
//	centerButton.frame = CGRectMake(0, 0, 100, 100);
//	centerButton.center = self.view.center;
//	centerButton.backgroundColor = [UIColor lightGrayColor];
//	[centerButton setTitle:@"button" forState:UIControlStateNormal];
//	[centerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//	[centerButton setImage:[UIImage imageNamed:@"icon_default_avatar_grey"] forState:UIControlStateNormal];
//	[centerButton setBackgroundImage:[UIImage imageNamed:@"icon_adding_user"] forState:UIControlStateNormal];
//	[self.view addSubview:centerButton];
	
//	_button3 = [self addbuttonWithFrame:CGRectZero bgColor:[UIColor greenColor] title:@"BUTTON" imageName:@"icon_adding_user" imageViewPosition:MLBOmniButtonImageViewPositionTop imageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5) titleEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2) contentEdgeInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
//	[button3 mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.centerX.equalTo(self.view);
//		make.top.equalTo(button2.mas_bottom).offset(5);
//	}];
	
	_omniButton = [self addbuttonWithFrame:CGRectMake(0, 0, 100, 100) bgColor:[UIColor greenColor] title:@"BUTTON" imageName:@"icon_adding_user" imageViewPosition:MLBOmniButtonImageViewPositionLeft imageEdgeInsets:UIEdgeInsetsZero titleEdgeInsets:UIEdgeInsetsZero contentEdgeInsets:UIEdgeInsetsZero];
	[_omniButton setBackgroundImage:[UIImage imageNamed:@"icon_default_avatar_grey"] forState:UIControlStateNormal];
//	_omniButton = [self addbuttonWithFrame:CGRectZero bgColor:[UIColor greenColor] title:@"BUTTON" imageName:@"icon_adding_user" imageViewPosition:MLBOmniButtonImageViewPositionTop imageEdgeInsets:UIEdgeInsetsZero titleEdgeInsets:UIEdgeInsetsZero contentEdgeInsets:UIEdgeInsetsZero];
	
	_omniButtonLeft = [self addbuttonWithFrame:CGRectMake(0, CGRectGetMidY(self.view.frame), 0, 0) bgColor:[UIColor blueColor] title:@"BUTTON" imageName:@"icon_adding_user" imageViewPosition:MLBOmniButtonImageViewPositionLeft imageEdgeInsets:UIEdgeInsetsMake(0, 8, 0, 0) titleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0) contentEdgeInsets:UIEdgeInsetsZero];
	
	_buttonInIB.mlb_imageViewPosition = MLBOmniButtonImageViewPositionTop;
//	_buttonInIB.imageView.backgroundColor = [UIColor blueColor];
	
	_buttonInIB1.mlb_imageViewPosition = MLBOmniButtonImageViewPositionBottom;
	
	_buttonInIBRight.mlb_imageViewPosition = MLBOmniButtonImageViewPositionRight;
	
	_buttonInIBWithSizeCons.mlb_imageViewPosition = MLBOmniButtonImageViewPositionBottom;
	
	[_buttonInIBMultiLines setTitle:@"ButtonButtonButtonButtonButtonButtonButtonButton" forState:UIControlStateNormal];
}

- (MLBOmniButton *)addbuttonWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor title:(NSString *)title imageName:(NSString *)imageName imageViewPosition:(MLBOmniButtonImageViewPosition)imageViewPosition imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets {
	MLBOmniButton *button = CGRectEqualToRect(frame, CGRectZero) ? [MLBOmniButton new] : [[MLBOmniButton alloc] initWithFrame:frame];
	button.backgroundColor = bgColor;
	[button setTitle:title forState:UIControlStateNormal];
	[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	button.imageView.backgroundColor = [UIColor redColor];
	[button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
	button.mlb_imageViewPosition = imageViewPosition;
	button.imageEdgeInsets = imageEdgeInsets;
	button.titleEdgeInsets = titleEdgeInsets;
	button.contentEdgeInsets = contentEdgeInsets;
	
	[self.view addSubview:button];
	
	return button;
}

#pragma mark - Action



#pragma mark - Network Request



@end
