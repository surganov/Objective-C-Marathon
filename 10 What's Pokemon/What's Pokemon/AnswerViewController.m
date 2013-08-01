//
//  AnswerViewController.m
//  What's Pokemon
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "AnswerViewController.h"
#import "PokemonViewController.h"

@interface AnswerViewController ()

@end

@implementation AnswerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.answerLabel.text = self.answer;
	
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	if (toInterfaceOrientation == UIDeviceOrientationPortrait) {
		[self performSegueWithIdentifier:@"rotateBack" sender:self];
	}
}

@end
