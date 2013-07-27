//
//  TapsViewController.m
//  Don't tap me
//
//  Created by Sergey Surganov on 27.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "TapsViewController.h"

@interface TapsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *phrases;
@end

@implementation TapsViewController

- (void)viewDidLoad
{
	UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
	[self.view addGestureRecognizer:singleFingerTap];
	
	self.view.backgroundColor = [UIColor blackColor];
	
	self.phrases.text = @"Don't tap me.\n\n";
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
//	CGPoint location = [recognizer locationInView:[recognizer.view superview]];
//	NSLog(@"TAPPED");

//	self.phrases.text = @"You tapped me!";
	
	self.phrases.text = [self pickPhrase];
}

- (NSString *)pickPhrase
{
	NSArray *phrasesStorage = @[
		@"I have nothing for you.\n\n",
		@"You can go home now.\n\n",
		@"I told you enough.\n\n",
		@"You haven't done\nyour previous exercise.",
		@"It was very nice to meet you.\n\n",
		@"Leave me alone, please.\n\n",
		@"I need some rest.\n\n",
		@"Oh, it's you again.\n\n",
		@"You can close the app now.\n\n",
		@"Go and do some work.\n\n",
		@"Stop tap like crazy!\nDo you think I'm iron?",
		@"Come later.\n\n",
		@"Easy there!\n\n",
		@"I told you, I have\nnothing for you!\n\n",
		@"Why it is do hard to understand?\n\n",
		@"I spell it for you:\nG E T  O F F.",
		@"You can quit now.\n\n",
		@"You make me really angry!\n\n",
		@"Ok, you got me. Happy?\n\n",
		@"You won.\n\n",
		@"This is the last time.\n\n",
		@"Don't say anybody.\n\n",
		@"It's over for today.\n\n",
		@"Isn't it enough for you?\n\n"
		];
	
	uint32_t randomNumber = arc4random_uniform([phrasesStorage count]);
	
	return [phrasesStorage objectAtIndex:randomNumber];
}

- (BOOL)shouldAutorotate
{
	return NO;
}

@end
