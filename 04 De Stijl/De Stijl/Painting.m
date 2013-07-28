//
//  Painting.m
//  De Stijl
//
//  Created by Sergey Surganov on 28.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "Painting.h"

@implementation Painting

@synthesize centerPoint = _centerPoint;

- (CGPoint)centerPoint
{
	if (_centerPoint.x == 0 && _centerPoint.y == 0) {
		return CGPointMake(150, 150);
	} else {
		return _centerPoint;
	}
}

- (void)setCenterPoint:(CGPoint)centerPoint
{
	_centerPoint = centerPoint;
	[self setNeedsDisplay];
}


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

- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture
{
	CGPoint translation = [gesture translationInView:self];
	self.centerPoint = CGPointMake(self.centerPoint.x + translation.x,
									  self.centerPoint.y + translation.y);
	[gesture setTranslation:CGPointMake(0, 0) inView:self];

	//	NSLog(@"%@", NSStringFromCGPoint(self.centerPoint));
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
	
	[[UIColor yellowColor] setFill];
	
	CGContextSetLineWidth(context, 5.0);
	[[UIColor blueColor] setStroke];
	
	[self drawCircleAtPoint:self.centerPoint withRadius:30 inContext:context];
}

@end
