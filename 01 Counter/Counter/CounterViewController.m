//
//  CounterViewController.m
//  Counter
//
//  Created by Sergey Surganov on 27.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()

@end

@implementation CounterViewController

- (IBAction)plusOne
{
	self.display.text = [NSString stringWithFormat:@"%d",++self.count];
}

- (IBAction)minusOne
{
	self.display.text = [NSString stringWithFormat:@"%d",--self.count];
}

- (IBAction)reset
{
	self.count = 0;
	self.display.text = @"0";
}

@end
