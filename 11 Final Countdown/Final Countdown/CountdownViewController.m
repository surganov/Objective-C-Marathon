//
//  CountdownViewController.m
//  Final Countdown
//
//  Created by Sergey Surganov on 02.08.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "CountdownViewController.h"

@interface CountdownViewController ()

@end

@implementation CountdownViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSDate *currentDate = [NSDate date];
	self.display.text = [currentDate description];
	
	// calculate time to Sochi 2014
	// it's March 7 2014
	
}


@end
