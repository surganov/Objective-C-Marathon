//
//  hexHolor.h
//  50 Shades of Gray
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (hexColor)

+ (UIColor *)colorWithHex:(NSUInteger)hexRepr;

@end
