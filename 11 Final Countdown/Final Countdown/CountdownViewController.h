//
//  CountdownViewController.h
//  Final Countdown
//
//  Created by Sergey Surganov on 02.08.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (nonatomic) NSTimeInterval remainingTime;

@end
