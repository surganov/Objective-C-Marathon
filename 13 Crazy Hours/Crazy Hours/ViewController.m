//
//  ViewController.m
//  Crazy Hours
//
//  Created by Sergey Surganov on 06.08.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ClockModel.h"

@interface ViewController ()
@property (nonatomic, weak) CALayer *minuteHand;
@property (nonatomic, weak) CALayer *secondsHand;
@property (nonatomic) NSInteger minutes;
@property (nonatomic) NSInteger seconds;
@end

@implementation ViewController

{}

#pragma mark - Gestures
- (IBAction)singleTap:(id)sender
{
	[self tick:nil];
}

- (IBAction)rotateGesture:(UIRotationGestureRecognizer *)gesture
{
	CGFloat rotationDegree = gesture.rotation * 180.0 / M_PI;
	NSLog(@"%f", rotationDegree);
	
	[self rotateClockHand:self.minuteHand atDegree:rotationDegree/50 during:0];
//	[self rotateClockHand:self.minuteHand atDegree:-1 during:0];
	
}


#pragma mark - Setting the view
- (void)viewDidLoad
{
	[self setBackground];
	
	self.minutes = [ClockModel currentMinutes];
	self.minuteHand = [self createClockHandWithSize:CGPointMake(10, 100) WithColor:[UIColor redColor] AtTime:self.minutes];
	[self.view.layer addSublayer:self.minuteHand];
	
	self.seconds = [ClockModel currentSeconds];
	self.secondsHand = [self createClockHandWithSize:CGPointMake(8, 130) WithColor:[UIColor blackColor] AtTime:self.seconds];
	[self.view.layer addSublayer:self.secondsHand];

	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
}

- (void) tick:(NSTimer *)timer
{
	[self rotateClockHand:self.secondsHand atDegree:6 during:0.1];

	self.seconds++;
	if (self.seconds == 60) {
		self.seconds = 0;
	}

//	NSLog(@"%i",self.seconds);
	
	if (self.seconds == 0) {
		[self rotateClockHand:self.minuteHand atDegree:6 during:0.1];
	}
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

- (CALayer *)createClockHandWithSize:(CGPoint)size WithColor:(UIColor*)color AtTime:(NSInteger)time
{
	CALayer *clockHand = [CALayer layer];
	clockHand.backgroundColor = color.CGColor;
	clockHand.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
	
	CGPoint centerPoint = self.view.center;
	clockHand.frame = CGRectMake(centerPoint.x, centerPoint.y, size.x, size.y);
	clockHand.anchorPoint = CGPointMake(0.5, 0);
	clockHand.position = CGPointMake(clockHand.position.x-clockHand.frame.size.width/2,
									 clockHand.position.y-clockHand.frame.size.height/2);
	
	// set seconds hand at 0 point
	clockHand.transform = CATransform3DMakeRotation(180.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
	
	// set seconds time to minute hand
	clockHand.transform = CATransform3DMakeRotation((time * 6 + 180.0) / 180.0 * M_PI, 0.0, 0.0, 1.0);
	
	return clockHand;
}

- (void)rotateClockHand:(CALayer*)clockHand atDegree:(CGFloat)angle during:(CFTimeInterval)seconds
{
	// convert degrees to radians
	angle = angle / 180.0 * M_PI;
	
	// perform rotation
	NSNumber *rotationAtStart = [clockHand valueForKeyPath:@"transform.rotation"];
	CATransform3D myRotationTransform = CATransform3DRotate(clockHand.transform, angle, 0.0, 0.0, 1.0);
	clockHand.transform = myRotationTransform;
	CABasicAnimation *myAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	myAnimation.duration = seconds;
	myAnimation.fromValue = rotationAtStart;
	myAnimation.toValue = [NSNumber numberWithFloat:([rotationAtStart floatValue] + angle)];
	[clockHand addAnimation:myAnimation forKey:@"transform.rotation"];
}

@end

