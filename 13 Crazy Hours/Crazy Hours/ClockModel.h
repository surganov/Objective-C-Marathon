//
//  ClockModel.h
//  Crazy Hours
//
//  Created by Sergey Surganov on 06.08.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClockModel : NSObject

+ (NSInteger)currentSeconds;
+ (NSInteger)currentMinutes;
+ (NSInteger)currentHours;

@end
