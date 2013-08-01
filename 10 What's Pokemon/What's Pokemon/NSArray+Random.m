//
//  NSArray+Random.m
//  What's Pokemon
//
//  Created by Sergey Surganov on 01.08.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)

- (id)randomObject {
    uint32_t rnd = arc4random_uniform([self count]);
    return [self objectAtIndex:rnd];
}

@end