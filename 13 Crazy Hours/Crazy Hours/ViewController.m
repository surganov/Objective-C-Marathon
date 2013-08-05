//
//  ViewController.m
//  Crazy Hours
//
//  Created by Sergey Surganov on 06.08.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (nonatomic) CALayer *minuteHand;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setBackground];
	[self setMinuteHand];
}

- (void)setBackground
{
	UIColor * highColor = [UIColor yellowColor];
	UIColor * lowColor = [UIColor greenColor];
	
	CAGradientLayer *bgGradient = [CAGradientLayer layer];
	[bgGradient setFrame:[self.view bounds]];
	[bgGradient setColors:[NSArray arrayWithObjects:(id)[highColor CGColor], (id)[lowColor CGColor], nil]];
	[self.view.layer addSublayer:bgGradient];
}

- (void)setMinuteHand
{
	self.minuteHand = [CALayer layer];
	self.minuteHand.backgroundColor = [UIColor redColor].CGColor;
	
	CGPoint centerPoint = self.view.center;
	self.minuteHand.frame = CGRectMake(centerPoint.x, centerPoint.y, 10, 150);
	//	NSLog(@"%@",NSStringFromCGPoint(self.clockMinute.position));
	self.minuteHand.anchorPoint = CGPointMake(0.5, 0);
	self.minuteHand.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
	self.minuteHand.position = CGPointMake(self.minuteHand.position.x-self.minuteHand.frame.size.width/2,
										   self.minuteHand.position.y-self.minuteHand.frame.size.height/2);
	
	self.minuteHand.transform = CATransform3DMakeRotation(180.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
	
	[self.view.layer addSublayer:self.minuteHand];
}

- (IBAction)singleTap:(id)sender
{
	[self tick:nil];
}

- (void) rotateMinute
{
	CGFloat angle = 3 / 180.0 * M_PI;
	NSNumber *rotationAtStart = [self.minuteHand valueForKeyPath:@"transform.rotation"];
	CATransform3D myRotationTransform = CATransform3DRotate(self.minuteHand.transform, angle, 0.0, 0.0, 1.0);
	self.minuteHand.transform = myRotationTransform;
	CABasicAnimation *myAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	myAnimation.duration = 0.1;
	myAnimation.fromValue = rotationAtStart;
	myAnimation.toValue = [NSNumber numberWithFloat:([rotationAtStart floatValue] + angle)];
	[self.minuteHand addAnimation:myAnimation forKey:@"transform.rotation"];
}

- (void) tick:(NSTimer *)timer
{
	[self rotateMinute];
}

@end

