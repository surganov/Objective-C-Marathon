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
//	self.display.text = [currentDate description];
	
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	[calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	NSDateComponents *sochiDateComponents = [[NSDateComponents alloc] init];
	[sochiDateComponents setYear:2014];
	[sochiDateComponents setMonth:3];
	[sochiDateComponents setDay:7];
	NSDate *sochiDate = [calendar dateFromComponents:sochiDateComponents];
	
	self.display.text = [sochiDate description];
	
}


@end
