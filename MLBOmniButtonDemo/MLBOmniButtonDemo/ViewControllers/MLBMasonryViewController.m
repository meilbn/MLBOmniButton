//
//  MLBMasonryViewController.m
//  MLBOmniButtonDemo
//
//  Created by meilbn on 17/10/2016.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "MLBMasonryViewController.h"
#import "MLBOmniButton.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface MLBMasonryViewController ()

@property (strong, nonatomic) MLBOmniButton *button0;

@property (strong, nonatomic) MLBOmniButton *button1;

@end

@implementation MLBMasonryViewController

#pragma mark - Lifecycle

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.edgesForExtendedLayout = UIRectEdgeNone;
	
	[self initDatas];
	[self setupViews];
}

#pragma mark - Private Methods

- (void)initDatas {
	
}

- (void)setupViews {
	self.view.autoresizesSubviews = NO;
	
	// NSLayoutConstraint
	_button0 = [MLBOmniButton new];
	_button0.backgroundColor = [UIColor lightGrayColor];
	_button0.translatesAutoresizingMaskIntoConstraints = NO;
	[_button0 setImage:[UIImage imageNamed:@"icon_adding_user"] forState:UIControlStateNormal];
	[_button0 setTitle:@"Button" forState:UIControlStateNormal];
	_button0.mlb_imageViewPosition = MLBOmniButtonImageViewPositionTop;
//	_button0.mlb_imageViewSize = CGSizeMake(200, 200);
	[self.view addSubview:_button0];
//	[_button0 mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.width.height.equalTo(@100);
//		make.center.equalTo(self.view);
//	}];
	
	// width constraint
//	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_button0(==100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_button0)]];
	// height constraint
//	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_button0(==100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_button0)]];
	// center button0 horizontally in self.view
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_button0 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
	// center button0 vertically in self.view
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_button0 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
	
	// https://upload.wikimedia.org/wikipedia/zh/3/34/Lenna.jpg
	// http://users.math.yale.edu/YCM/IMAGES/GCOMPRES/LENNA/LENNA.JPG
	// http://www.fmwconcepts.com/misc_tests/FFT_tests/lena_lowpass/lena.jpg
	[_button0 mlb_setImageWithURL:[NSURL URLWithString:@"http://www.fmwconcepts.com/misc_tests/lena.png"] placeholderImage:[UIImage imageNamed:@"icon_adding_user"] forState:UIControlStateNormal storeImageToDisk:YES];
	
	// Masonry
	_button1 = [MLBOmniButton new];
	_button1.backgroundColor = [UIColor lightGrayColor];
	[_button1 setImage:[UIImage imageNamed:@"icon_default_avatar_grey"] forState:UIControlStateNormal];
	[_button1 setTitle:@"Button" forState:UIControlStateNormal];
	_button1.mlb_imageViewPosition = MLBOmniButtonImageViewPositionBottom;
	[self.view addSubview:_button1];
	[_button1 mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(_button0.mas_bottom).offset(20);
		make.centerX.equalTo(self.view);
	}];
}

#pragma mark - Action



#pragma mark - Network Request




@end
