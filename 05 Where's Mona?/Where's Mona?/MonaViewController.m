//
//  MonaViewController.m
//  Where's Mona?
//
//  Created by Sergey Surganov on 30.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "MonaViewController.h"

@interface MonaViewController ()

@end

@implementation MonaViewController

- (void)viewDidAppear:(BOOL)animated
{
//	UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
//	animated = NO;
//	UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
//	if (orientation == UIDeviceOrientationLandscapeLeft) {
//		NSLog(@"left");
//	}
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    /* Disable system animations */
    [UIView setAnimationsEnabled:NO];
    
    /* Switcheroo */
	switch (toInterfaceOrientation) {
		case UIInterfaceOrientationPortrait:
			self.imageHolder.image = [UIImage imageNamed:@"mona-portrait.png"];
			NSLog(@"portrait");
			break;
		case UIInterfaceOrientationLandscapeLeft:
			self.imageHolder.image = [UIImage imageNamed:@"mona-landscape-right.png"];
			NSLog(@"left");
			break;
		case UIInterfaceOrientationLandscapeRight:
			self.imageHolder.image = [UIImage imageNamed:@"mona-landscape-left.png"];
			NSLog(@"right");
			break;
		case UIInterfaceOrientationPortraitUpsideDown:
			self.imageHolder.image = [UIImage imageNamed:@"mona-portrait-upside-down.png"];
			NSLog(@"upside down");
			break;
			
		default:
			break;
	}
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSUInteger)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskAll;
}

@end
