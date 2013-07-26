//
//  CounterViewController.h
//  Counter
//
//  Created by Sergey Surganov on 27.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterViewController : UIViewController

@property (nonatomic) int count;
@property (strong, nonatomic) IBOutlet UILabel *display;

@end
