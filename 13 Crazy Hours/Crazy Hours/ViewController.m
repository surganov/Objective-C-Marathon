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
@property (nonatomic, weak) CALayer *hourHand;
@property (nonatomic, weak) CALayer *minuteHand;
@property (nonatomic) NSInteger hours;
@property (nonatomic) NSInteger minutes;
@property (nonatomic) NSInteger seconds;
@end

@implementation ViewController

{}

- (void)setHours:(NSInteger)hours
{
	NSDictionary *crazyHours = @{@1:@7,@2:@12,@3:@5,@4:@10,@5:@3,@6:@8,@7:@1,@8:@6,@9:@11,@10:@4,@11:@9,@12:@2};

	if (hours > 12) {
		_hours = hours % 12;
	} else {
		_hours = hours;
	}
	
	NSLog(@"hours:%i",_hours);
	
	self.hourHand.transform = CATransform3DMakeRotation(([crazyHours[[NSNumber numberWithInt:_hours]] intValue] * 30 + 180.0) / 180.0 * M_PI, 0.0, 0.0, 1.0);
//	self.hourHand.transform = CATransform3DMakeRotation((_hours * 30 + 180.0) / 180.0 * M_PI, 0.0, 0.0, 1.0);
}

- (void)setMinutes:(NSInteger)minutes
{
	if (minutes >= 60) {
		_minutes = minutes % 60;
		self.hours++;
	} else if (minutes == 60) {
		_minutes = minutes;
		self.hours++;
	} else {
		_minutes = minutes;
	}
	
//	NSLog(@"minutes:%i",_minutes);
	self.minuteHand.transform = CATransform3DMakeRotation((_minutes * 6 + 180.0) / 180.0 * M_PI, 0.0, 0.0, 1.0);
}

- (void)setSeconds:(NSInteger)seconds
{
	if (seconds >= 60) {
		_seconds = (int) (seconds - 60);
		self.minutes++;
	} else if (seconds < 0) {
		_seconds = (int) (60 + seconds);
		self.minutes--;
	} else {
		_seconds = (int) (seconds);
	}
//	NSLog(@"%i",seconds);
}

#pragma mark - Gestures
- (IBAction)singleTap:(id)sender
{
	if (self.minutes < 50) {
		self.minutes = 50;
	}
	self.minutes++;
}

- (IBAction)rotateGesture:(UIRotationGestureRecognizer *)gesture
{
//	self.minuteHand.transform = CATransform3DMakeRotation(gesture.rotation*1.5, 0.0, 0.0, 1.0);
	static CGFloat lastState;
	CGFloat translation;
	if (UIGestureRecognizerStateChanged) {
		translation = gesture.rotation - lastState;
		lastState = gesture.rotation;
	}

	CGFloat minutes = translation * 180.0 / M_PI / 6;
	self.minutes += minutes * 2;
//	NSLog(@"%i",self.minutes);

}

#define OFFSET 20

#pragma mark - Setting the view
- (void)viewDidLoad
{
//	[self setBackground];
	CALayer *bg = [CALayer layer];
	bg.frame = self.view.frame;
	bg.contents = (id) [UIImage imageNamed:@"crazy-hours-bg.png"].CGImage;
	[self.view.layer addSublayer:bg];
	
	CALayer *bigCircle = [CALayer layer];
	bigCircle.frame = CGRectMake(self.view.center.x-14, self.view.center.y-14-OFFSET, 27, 27);
	bigCircle.contents = (id) [UIImage imageNamed:@"clock-big-circle.png"].CGImage;
	[self.view.layer addSublayer:bigCircle];
	
	self.seconds = [ClockModel currentSeconds];
	
	self.minutes = [ClockModel currentMinutes];
	self.minuteHand = [self createClockHandWithSize:CGPointMake(19, 127) withImage:[UIImage imageNamed:@"clock-minute-hand.png"] atTime:self.minutes];
	[self.view.layer addSublayer:self.minuteHand];
	
	self.hours = [ClockModel currentHours];
	self.hourHand = [self createClockHandWithSize:CGPointMake(30, 86) withImage:[UIImage imageNamed:@"clock-hour-hand.png"] atTime:self.hours];
	[self.view.layer addSublayer:self.hourHand];

	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
	
	
	
	CALayer *smallCircle = [CALayer layer];
	smallCircle.frame = CGRectMake(self.view.center.x-10, self.view.center.y-10-OFFSET, 19, 19);
	smallCircle.contents = (id) [UIImage imageNamed:@"clock-small-circle.png"].CGImage;
	[self.view.layer addSublayer:smallCircle];
}

- (void) tick:(NSTimer *)timer
{
	self.minutes += 1;
//	if (self.seconds == 60) {
//		self.seconds = 0;
//	}
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

- (CALayer *)createClockHandWithSize:(CGPoint)size withImage:(UIImage*)image atTime:(NSInteger)time
{
	CALayer *clockHand = [CALayer layer];
	clockHand.contents = (id) image.CGImage;
	clockHand.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
	
	CGPoint centerPoint = self.view.center;
	clockHand.frame = CGRectMake(centerPoint.x, centerPoint.y, size.x, size.y);
	clockHand.anchorPoint = CGPointMake(0.5, 0);
	clockHand.position = CGPointMake(clockHand.position.x-clockHand.frame.size.width/2,
									 clockHand.position.y-clockHand.frame.size.height/2-OFFSET);
	
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

