//
//  DeStijlViewController.m
//  De Stijl
//
//  Created by Sergey Surganov on 28.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "DeStijlViewController.h"
#import "Painting.h"

@interface DeStijlViewController ()
@property (nonatomic, weak) IBOutlet Painting *painting;
@end

@implementation DeStijlViewController

- (void)viewDidLoad
{

}

- (void)setPainting:(Painting *)painting
{
	_painting = painting;
	[self.painting addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self.painting action:@selector(handlePanGesture:)]];
}

- (BOOL)shouldAutorotate
{
	return NO;
}


@end
