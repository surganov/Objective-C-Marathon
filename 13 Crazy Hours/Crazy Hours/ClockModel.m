//
//  ClockModel.m
//  Crazy Hours
//
//  Created by Sergey Surganov on 06.08.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "ClockModel.h"

@implementation ClockModel

+ (NSInteger)currentSeconds
{
	NSDate *now = [NSDate new];
	
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dateComponents = [calendar components:(NSSecondCalendarUnit) fromDate:now];

	return [dateComponents second];
}

+ (NSInteger)currentMinutes
{
	NSDate *now = [NSDate new];
	
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dateComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:now];

	return [dateComponents minute];
}

@end
