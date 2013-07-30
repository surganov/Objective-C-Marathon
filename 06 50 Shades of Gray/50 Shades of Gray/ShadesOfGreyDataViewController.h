//
//  ShadesOfGreyDataViewController.h
//  50 Shades of Gray
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShadesOfGreyDataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@property (weak, nonatomic) IBOutlet UIView *paper;

@end
