//
//  ViewController.m
//  Exit
//
//  Created by Sergey Surganov on 08.08.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *exitButton;
@property (weak, nonatomic) IBOutlet UIImageView *exitDialog;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)singleTap:(UITapGestureRecognizer*)gesture
{
	self.exitDialog.hidden = !self.exitDialog.hidden;
	self.exitButton.hidden = !self.exitButton.hidden;
//	NSLog(@"tapped");
}
- (IBAction)singleTapWindow:(UITapGestureRecognizer*)gesture
{
	NSLog(@"tapped window");
}
- (IBAction)exitButton:(UIButton *)sender
{
	exit(0);
	NSLog(@"button");
}
- (IBAction)noButton:(UIButton *)sender {
	self.exitDialog.hidden = !self.exitDialog.hidden;
	self.exitButton.hidden = !self.exitButton.hidden;
	NSLog(@"no");
}
- (IBAction)crossButton:(UIButton *)sender
{
	self.exitDialog.hidden = !self.exitDialog.hidden;
	self.exitButton.hidden = !self.exitButton.hidden;
	NSLog(@"cross");
}

@end
