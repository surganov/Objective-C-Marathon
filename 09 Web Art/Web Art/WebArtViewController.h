//
//  WebArtViewController.h
//  Web Art
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebArtViewController : UIViewController

@property (nonatomic, strong) UIWebView *myWebView;
- (IBAction)tapRecognized:(id)sender;

@end
