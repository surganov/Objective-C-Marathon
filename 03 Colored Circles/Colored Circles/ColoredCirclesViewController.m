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
	
//	self.view.backgroundColor = [UIColor blackColor];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    if(recognizer.state == UIGestureRecognizerStateRecognized)
    {
        CGPoint point = [recognizer locationInView:recognizer.view];
//        NSLog(@"%@",NSStringFromCGPoint(point));
		[self drawCircleAtPoint:point];
    }
}

- (void)drawCircleAtPoint:(CGPoint)point
{
	CGRect frame = [UIScreen mainScreen].bounds;
	frame.size.height = 50;
	frame.size.width = 50;
	frame.origin = point;
	Circle *circle = [[Circle alloc] initWithFrame:frame];
	[self.view addSubview:circle];
}


@end
