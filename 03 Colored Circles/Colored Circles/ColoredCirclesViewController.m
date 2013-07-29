//
//  ColoredCirclesViewController.m
//  Colored Circles
//
//  Created by Sergey Surganov on 28.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "ColoredCirclesViewController.h"
#import "Circle.h"

@interface ColoredCirclesViewController ()

@end

@implementation ColoredCirclesViewController

- (void)viewDidLoad
{
	UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
	[self.view addGestureRecognizer:singleFingerTap];
	
	UIColor *midnightBlueFlatColor = [UIColor colorWithRed:0.17254901960784313 green:0.24313725490196078 blue:0.3137254901960784 alpha:1.0];
	
	self.view.backgroundColor = midnightBlueFlatColor;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    if(recognizer.state == UIGestureRecognizerStateRecognized)
    {
        CGPoint point = [recognizer locationInView:recognizer.view];
		[self drawCircleAtPoint:point];
    }
}

- (void)drawCircleAtPoint:(CGPoint)point
{
	int lowerBound = 15;
	int upperBound = 70;
	int randomValue = lowerBound + arc4random_uniform(upperBound - lowerBound);
	
	CGFloat size = randomValue;
	CGRect frame = CGRectMake(point.x-size/2, point.y-size/2, size, size);

	Circle *circle = [[Circle alloc] initWithFrame:frame];
	[self.view addSubview:circle];
}


@end
