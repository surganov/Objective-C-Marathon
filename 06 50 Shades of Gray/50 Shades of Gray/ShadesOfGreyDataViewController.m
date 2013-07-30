//
//  ShadesOfGreyDataViewController.m
//  50 Shades of Gray
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "ShadesOfGreyDataViewController.h"
#import "hexHolor.h"

@interface ShadesOfGreyDataViewController ()

@end

@implementation ShadesOfGreyDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	self.paper.backgroundColor = [UIColor colorWithWhite:(CGFloat)arc4random_uniform(256)/256. alpha:1];
//    self.paper.backgroundColor = [UIColor colorWithHex:(NSUInteger)@0xD9D9D9];
}

@end
