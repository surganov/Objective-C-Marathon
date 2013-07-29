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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	NSLog(@"It's rotates!");
}

@end
