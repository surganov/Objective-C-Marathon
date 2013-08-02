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
	
	
	self.remainingTime = [sochiDate timeIntervalSinceNow];
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];

}

- (void)timerTick:(NSTimer *)timer
{
	self.remainingTime -= 1;
	NSDate *countdown = [NSDate dateWithTimeIntervalSinceReferenceDate:self.remainingTime];
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	
	[formatter setDateFormat:@"DD"];
	NSString *days = [formatter stringFromDate:countdown];
	[formatter setDateFormat:@"hh"];
	NSString *hours = [formatter stringFromDate:countdown];
	[formatter setDateFormat:@"mm"];
	NSString *minutes = [formatter stringFromDate:countdown];
	[formatter setDateFormat:@"ss"];
	NSString *seconds = [formatter stringFromDate:countdown];
	
	self.display.text = [NSString stringWithFormat:@"%@ days, %@ hours, %@ minutes, %@ seconds to the XXII Olympic Winter Games",
						 days, hours, minutes, seconds];
	
//	self.display.text = [NSString stringWithFormat:@"%@\nto Sochi 2014",[formatter stringFromDate:countdown]];
}


@end
