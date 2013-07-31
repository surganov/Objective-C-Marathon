//
//  WebArtViewController.m
//  Web Art
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import "WebArtViewController.h"

@interface WebArtViewController ()

@end

@implementation WebArtViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.myWebView = [[UIWebView alloc] initWithFrame:CGRectMake(64, 38, 194, 226)];
	[self.view addSubview:self.myWebView];
	self.myWebView.scalesPageToFit = YES;
	[self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.newrafael.com/websites"]]];
}

- (IBAction)tapRecognized:(id)sender {
	NSLog(@"tapped");
	[self.myWebView goBack];
}
@end
