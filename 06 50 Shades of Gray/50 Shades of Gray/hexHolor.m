//
//  hexHolor.m
//  50 Shades of Gray
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "hexHolor.h"

@implementation UIColor (hexColor)

+ (UIColor *)colorWithHex:(NSUInteger)hexRepr {
    
    unsigned char redByte = (hexRepr & 0xFF0000) >> 16, greenByte = (hexRepr & 0xFF00) >> 8,blueByte = hexRepr & 0xFF;
    
    CGFloat red = (CGFloat)redByte / 0xFF, green = (CGFloat)greenByte / 0xFF, blue = (CGFloat)blueByte / 0xFF;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
}

@end
