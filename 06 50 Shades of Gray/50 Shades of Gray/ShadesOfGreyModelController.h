//
//  ShadesOfGreyModelController.h
//  50 Shades of Gray
//
//  Created by Sergey Surganov on 31.07.13.
//  Copyright (c) 2013 Sergey Surganov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShadesOfGreyDataViewController;

@interface ShadesOfGreyModelController : NSObject <UIPageViewControllerDataSource>

- (ShadesOfGreyDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(ShadesOfGreyDataViewController *)viewController;

@end
