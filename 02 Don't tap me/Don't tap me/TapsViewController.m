//
//  TapsViewController.m
//  Don't tap me
//
//  Created by Sergey Surganov on 27.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "TapsViewController.h"

@interface TapsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *phrases;
@end

@implementation TapsViewController

- (void)viewDidLoad
{
	UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
	[self.view addGestureRecognizer:singleFingerTap];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
//	CGPoint location = [recognizer locationInView:[recognizer.view superview]];
	NSLog(@"TAPPED");

	// DO SOMETHING
}

@end
