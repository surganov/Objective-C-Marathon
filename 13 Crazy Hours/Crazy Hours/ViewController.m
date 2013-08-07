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
		_hours = (int) (hours - 12);
	} else if (hours < 0) {
		_hours = (int) (12 + hours);
	} else {
		_hours = (int) (hours);
	}
	NSLog(@"hours:%i",_hours);
	self.hourHand.transform = CATransform3DMakeRotation((_hours * 30 + 180.0) / 180.0 * M_PI, 0.0, 0.0, 1.0);
}

- (void)setMinutes:(NSInteger)minutes
{
	if (minutes % 60 == 60 || minutes % 60 == 0) {
		_minutes = (int) (minutes - 60);
		self.hours++;
	} else if (minutes < 0) {
		_minutes = (int) (60 + minutes);
		self.hours--;
	} else {
		_minutes = (int) (minutes);
	}
	NSLog(@"minutes:%i",_minutes);
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
	if (self.minutes < 55) {
		self.minutes = 55;
	}
	self.minutes++;
}

- (IBAction)rotateGesture:(UIRotationGestureRecognizer *)gesture
{
//	self.minuteHand.transform = CATransform3DMakeRotation(gesture.rotation*1.5, 0.0, 0.0, 1.0);
//	CGFloat minutes = gesture.rotation * 180.0 / M_PI / 6;
//	NSLog(@"%f", minutes);
	self.minutes = gesture.rotation * 180.0 / M_PI / 6;
}


#pragma mark - Setting the view
- (void)viewDidLoad
{
	[self setBackground];
	
	self.seconds = [ClockModel currentSeconds];
	
	self.minutes = [ClockModel currentMinutes];
	self.minuteHand = [self createClockHandWithSize:CGPointMake(10, 100) WithColor:[UIColor redColor] AtTime:self.minutes];
	[self.view.layer addSublayer:self.minuteHand];
	
	self.hours = [ClockModel currentHours];
	self.hourHand = [self createClockHandWithSize:CGPointMake(10, 80) WithColor:[UIColor blackColor] AtTime:self.hours];
	[self.view.layer addSublayer:self.hourHand];

	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
}

- (void) tick:(NSTimer *)timer
{
	self.seconds++;
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

