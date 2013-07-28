//
//  CirclesView.m
//  Colored Circles
//
//  Created by Sergey Surganov on 28.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "CirclesView.h"

@implementation CirclesView

- (void)setup
{
	self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
	[self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)drawCircleAtPoint:(CGPoint)p withRadius:(CGFloat)radius inContext:(CGContextRef)context
{
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
	CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, YES);
	CGContextStrokePath(context);
	UIGraphicsPopContext();
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGPoint midPoint;
	
	midPoint.x = 150;
	midPoint.y = 150;

	CGContextSetLineWidth(context, 5.0);
	[[UIColor blueColor] setStroke];
	
	[self drawCircleAtPoint:midPoint withRadius:60 inContext:context];

	midPoint.x = 150;
	midPoint.y = 350;
	
	[self drawCircleAtPoint:midPoint withRadius:60 inContext:context];
}

@end
