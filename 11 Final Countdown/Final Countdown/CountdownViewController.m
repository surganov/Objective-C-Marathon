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
	
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	[calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	NSDateComponents *sochiDateComponents = [[NSDateComponents alloc] init];
	[sochiDateComponents setYear:2014];
	[sochiDateComponents setMonth:2];
	[sochiDateComponents setDay:7];
	NSDate *sochiDate = [calendar dateFromComponents:sochiDateComponents];
	
	//calculate difference between local date and Sochi date
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	[formatter setDateFormat:@"DD"];
	
	NSTimeInterval remainingTime = [sochiDate timeIntervalSinceNow];
	NSDate *countdown = [NSDate dateWithTimeIntervalSinceReferenceDate:remainingTime];
	
	self.display.text = [NSString stringWithFormat:@"%@ days\nto Sochi 2014",[formatter stringFromDate:countdown]];
}


@end
