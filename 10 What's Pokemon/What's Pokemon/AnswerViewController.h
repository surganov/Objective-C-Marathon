//
//  AnswerViewController.h
//  What's Pokemon
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerViewController : UIViewController

@property (nonatomic, strong) NSString *answer;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end
