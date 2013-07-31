//
//  NeverSorryViewController.m
//  Never Sorry
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "NeverSorryViewController.h"
#import "Camera.h"
#import <QuartzCore/QuartzCore.h>

@interface NeverSorryViewController ()

@end

@implementation NeverSorryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[Camera startInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
