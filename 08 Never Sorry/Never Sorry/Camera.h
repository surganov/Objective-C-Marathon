//
//  Camera.h
//  Tricky Driver
//
//  Created by Zoreslav Khimich on 18/06/2013.
//  Copyright (c) 2013 Tricky Eyes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Camera : NSObject

+ (void)startInView:(UIView *)superview;
+ (void)stop;

@end
