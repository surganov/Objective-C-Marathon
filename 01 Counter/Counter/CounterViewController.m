//
//  CounterViewController.m
//  Counter
//
//  Created by Sergey Surganov on 27.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()

@property (strong, nonatomic) IBOutlet UILabel *display;

@end

@implementation CounterViewController

- (void)setCount:(int)count
{
    _count = count;
    self.display.text = [NSString stringWithFormat:@"%d", _count];
}

- (IBAction)plusOne
{
	++self.count;
}

- (IBAction)minusOne
{
	--self.count;
}

- (IBAction)reset
{
	self.count = 0;
}

@end
