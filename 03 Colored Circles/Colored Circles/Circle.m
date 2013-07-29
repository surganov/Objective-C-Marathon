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
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();

	[[self randomColor] setFill];
	CGContextFillEllipseInRect(context, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
}

- (UIColor *)randomColor
{
	NSArray *flatColors = @[
		[UIColor colorWithRed:0.10196078431372549 green:0.7372549019607844 blue:0.611764705882353 alpha:1.0],
		[UIColor colorWithRed:0.08627450980392157 green:0.6274509803921569 blue:0.5215686274509804 alpha:1.0],
		[UIColor colorWithRed:0.1803921568627451 green:0.8 blue:0.44313725490196076 alpha:1.0],
		[UIColor colorWithRed:0.15294117647058825 green:0.6823529411764706 blue:0.3764705882352941 alpha:1.0],
		[UIColor colorWithRed:0.20392156862745098 green:0.596078431372549 blue:0.8588235294117647 alpha:1.0],
		[UIColor colorWithRed:0.1607843137254902 green:0.5019607843137255 blue:0.7254901960784313 alpha:1.0],
		[UIColor colorWithRed:0.6078431372549019 green:0.34901960784313724 blue:0.7137254901960784 alpha:1.0],
		[UIColor colorWithRed:0.5568627450980392 green:0.26666666666666666 blue:0.6784313725490196 alpha:1.0],
		[UIColor colorWithRed:0.9450980392156862 green:0.7686274509803922 blue:0.058823529411764705 alpha:1.0],
		[UIColor colorWithRed:0.9529411764705882 green:0.611764705882353 blue:0.07058823529411765 alpha:1.0],
		[UIColor colorWithRed:0.9019607843137255 green:0.49411764705882355 blue:0.13333333333333333 alpha:1.0],
		[UIColor colorWithRed:0.8274509803921568 green:0.32941176470588235 blue:0.0 alpha:1.0],
		[UIColor colorWithRed:0.9058823529411765 green:0.2980392156862745 blue:0.23529411764705882 alpha:1.0],
		[UIColor colorWithRed:0.7529411764705882 green:0.2235294117647059 blue:0.16862745098039217 alpha:1.0]];
	uint32_t randomNumber = arc4random_uniform([flatColors count]);
	
	return [flatColors objectAtIndex:randomNumber];
}

@end
