//
//  ViewController.m
//  Mickey Clock
//
//  Created by Sergey Surganov on 06.08.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property CALayer *clockMinute;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
	UIColor * highColor = [UIColor yellowColor];
	UIColor * lowColor = [UIColor greenColor];
	
	CAGradientLayer *bgGradient = [CAGradientLayer layer];
	[bgGradient setFrame:[self.view bounds]];
	[bgGradient setColors:[NSArray arrayWithObjects:(id)[highColor CGColor], (id)[lowColor CGColor], nil]];
	[self.view.layer addSublayer:bgGradient];
	
	self.clockMinute = [CALayer layer];
	//	self.clockMinute.backgroundColor = [UIColor redColor].CGColor;
	
	CGPoint centerPoint = self.view.center;
	self.clockMinute.frame = CGRectMake(centerPoint.x, centerPoint.y, 60, 150);
	//	NSLog(@"%@",NSStringFromCGPoint(self.clockMinute.position));
	self.clockMinute.anchorPoint = CGPointMake(0.5, 0);
	self.clockMinute.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
	self.clockMinute.position = CGPointMake(self.clockMinute.position.x-self.clockMinute.frame.size.width/2,
											self.clockMinute.position.y-self.clockMinute.frame.size.height/2);
	
	self.clockMinute.transform = CATransform3DMakeRotation(180.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(rotateMinute:) userInfo:nil repeats:YES];
	
	self.clockMinute.contents = (id) [UIImage imageNamed:@"mickey.png"].CGImage;
	
	[self.view.layer addSublayer:self.clockMinute];
}

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

- (void) rotateMinute:(NSTimer *)timer
{
	CGFloat angle = DEGREES_TO_RADIANS(3);
	NSNumber *rotationAtStart = [self.clockMinute valueForKeyPath:@"transform.rotation"];
	CATransform3D myRotationTransform = CATransform3DRotate(self.clockMinute.transform, angle, 0.0, 0.0, 1.0);
	self.clockMinute.transform = myRotationTransform;
	CABasicAnimation *myAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	myAnimation.duration = 0.1;
	myAnimation.fromValue = rotationAtStart;
	myAnimation.toValue = [NSNumber numberWithFloat:([rotationAtStart floatValue] + angle)];
	[self.clockMinute addAnimation:myAnimation forKey:@"transform.rotation"];
}

@end
