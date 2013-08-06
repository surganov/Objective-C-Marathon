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
@property (nonatomic, weak) CALayer *minuteHand;
@property (nonatomic, weak) CALayer *secondsHand;
@property (nonatomic) NSInteger minutes;
@property (nonatomic) NSInteger seconds;
@end

@implementation ViewController

- (NSInteger)minutes
{
	if (!_minutes) {
		NSDate *now = [NSDate new];
		NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
		
//		[calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
		NSDateComponents *dateComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:now];
		_minutes = [dateComponents minute];
	}
	return _minutes;
}

- (void) setCurrentSeconds
{
	NSDate *now = [NSDate new];
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dateComponents = [calendar components:(NSSecondCalendarUnit) fromDate:now];
	self.seconds = [dateComponents second];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setBackground];
	[self setMinuteHand:self.minuteHand atMinutes:self.minutes];
	[self setCurrentSeconds];
	[self setSecondsHand:self.secondsHand atSeconds:self.seconds];

	NSLog(@"%i", self.seconds);
	[self setTimer];

}

- (void)setTimer
{
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
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

- (void)setMinuteHand:(CALayer *)minuteHand atMinutes:(NSInteger)minutes
{
	self.minuteHand = [CALayer layer];
	self.minuteHand.backgroundColor = [UIColor redColor].CGColor;
	self.minuteHand.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
	
	CGPoint centerPoint = self.view.center;
	self.minuteHand.frame = CGRectMake(centerPoint.x, centerPoint.y, 10, 140);
	self.minuteHand.anchorPoint = CGPointMake(0.5, 0);
	self.minuteHand.position = CGPointMake(self.minuteHand.position.x-self.minuteHand.frame.size.width/2,
										   self.minuteHand.position.y-self.minuteHand.frame.size.height/2);
	
	// set minute hand at 0 point
	self.minuteHand.transform = CATransform3DMakeRotation(180.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
	
	// set current time to minute hand
	self.minuteHand.transform = CATransform3DMakeRotation((minutes * 6 + 180.0) / 180.0 * M_PI, 0.0, 0.0, 1.0);
	
	[self.view.layer addSublayer:self.minuteHand];
}

- (void)setSecondsHand:(CALayer *)secondsHand atSeconds:(NSInteger)seconds
{
	self.secondsHand = [CALayer layer];
	self.secondsHand.backgroundColor = [UIColor blackColor].CGColor;
	self.secondsHand.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
	
	CGPoint centerPoint = self.view.center;
	self.secondsHand.frame = CGRectMake(centerPoint.x, centerPoint.y, 5, 170);
	self.secondsHand.anchorPoint = CGPointMake(0.5, 0);
	self.secondsHand.position = CGPointMake(self.secondsHand.position.x-self.secondsHand.frame.size.width/2,
										   self.secondsHand.position.y-self.secondsHand.frame.size.height/2);
	
	// set seconds hand at 0 point
	self.secondsHand.transform = CATransform3DMakeRotation(180.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
	
	// set seconds time to minute hand
	self.secondsHand.transform = CATransform3DMakeRotation((seconds * 6 + 180.0) / 180.0 * M_PI, 0.0, 0.0, 1.0);
	
	[self.view.layer addSublayer:self.secondsHand];
}

- (IBAction)singleTap:(id)sender
{
	[self tick:nil];
}

- (void) rotateMinute
{
	CGFloat angle = 6 / 180.0 * M_PI;
	NSNumber *rotationAtStart = [self.minuteHand valueForKeyPath:@"transform.rotation"];
	CATransform3D myRotationTransform = CATransform3DRotate(self.minuteHand.transform, angle, 0.0, 0.0, 1.0);
	self.minuteHand.transform = myRotationTransform;
	CABasicAnimation *myAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	myAnimation.duration = 0.1;
	myAnimation.fromValue = rotationAtStart;
	myAnimation.toValue = [NSNumber numberWithFloat:([rotationAtStart floatValue] + angle)];
	[self.minuteHand addAnimation:myAnimation forKey:@"transform.rotation"];
}

- (void) rotateSeconds
{
	CGFloat angle = 6 / 180.0 * M_PI;
	NSNumber *rotationAtStart = [self.secondsHand valueForKeyPath:@"transform.rotation"];
	CATransform3D myRotationTransform = CATransform3DRotate(self.secondsHand.transform, angle, 0.0, 0.0, 1.0);
	self.secondsHand.transform = myRotationTransform;
	CABasicAnimation *myAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	myAnimation.duration = 0.1;
	myAnimation.fromValue = rotationAtStart;
	myAnimation.toValue = [NSNumber numberWithFloat:([rotationAtStart floatValue] + angle)];
	[self.secondsHand addAnimation:myAnimation forKey:@"transform.rotation"];
	
	self.seconds++;
	if (self.seconds == 60) {
		self.seconds = 0;
	}
	NSLog(@"%i",self.seconds);
}

- (void) tick:(NSTimer *)timer
{
	[self rotateSeconds];
	if (self.seconds == 0) {
		[self rotateMinute];
	}
//	NSLog(@"%f",(59*6)/180*M_PI);
//	NSLog(@"%@",(NSNumber*)[self.secondsHand valueForKeyPath:@"transform.rotation"]);
}

@end

