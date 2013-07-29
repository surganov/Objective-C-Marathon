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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _centerPoint = CGPointMake(150, 150);
        self.contentMode = UIViewContentModeRedraw; // Could as well go here, but, actually, doesn't change a thing
    }

    return self;
}


- (void)setCenterPoint:(CGPoint)centerPoint
{
	_centerPoint = centerPoint;
	[self setNeedsDisplay];
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

	UIColor *red = [UIColor colorWithRed:0.9058823529411765 green:0.2980392156862745 blue:0.23529411764705882 alpha:1.0];
	UIColor *yellow = [UIColor colorWithRed:0.9450980392156862 green:0.7686274509803922 blue:0.058823529411764705 alpha:1.0];
	UIColor *blue = [UIColor colorWithRed:0.20392156862745098 green:0.596078431372549 blue:0.8588235294117647 alpha:1.0];
	
	[red setFill];
	UIRectFill(CGRectMake(0, 0, self.centerPoint.x, self.centerPoint.y));
	
	[yellow setFill];
	UIRectFill(CGRectMake(self.centerPoint.x, 0, self.bounds.size.width-self.centerPoint.x, self.centerPoint.y));
	
	[[UIColor whiteColor] setFill];
	UIRectFill(CGRectMake(0, self.centerPoint.y, self.centerPoint.x, self.bounds.size.height-self.centerPoint.y));

	[blue setFill];
	UIRectFill(CGRectMake(self.centerPoint.x, self.centerPoint.y, self.bounds.size.width, self.bounds.size.height));
	
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 18);
    CGContextMoveToPoint(context, 0, self.centerPoint.y);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.centerPoint.y);
    CGContextStrokePath(context);
	
	CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 18);
    CGContextMoveToPoint(context, self.centerPoint.x, 0);
    CGContextAddLineToPoint(context, self.centerPoint.x, self.bounds.size.height);
    CGContextStrokePath(context);
}

@end
