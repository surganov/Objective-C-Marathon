//
//  Circle.m
//  Colored Circles
//
//  Created by Sergey Surganov on 28.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "Circle.h"

@implementation Circle

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
		self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();

	CGPoint midPoint;
	midPoint.x = self.bounds.origin.x + self.bounds.size.width/2;
	midPoint.y = self.bounds.origin.y + self.bounds.size.height/2;
	
	CGFloat size = self.bounds.size.width/2;
	if (self.bounds.size.height < self.bounds.size.width) size = self.bounds.size.height/2;
	

	CGContextSetLineWidth(context, 5.0);
	[[UIColor blueColor] setStroke];
	
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
	CGContextAddArc(context, midPoint.x, midPoint.y, size, 0, 2*M_PI, YES);
	CGContextStrokePath(context);
	UIGraphicsPopContext();

}
	
@end
