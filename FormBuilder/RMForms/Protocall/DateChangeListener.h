//
//  DateChangeListener.h
//  DynamicForms
//
//  Created by ROHIT on 21/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

/**
 * To have custom methods for date picker in DateChangeListener
 **/
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DateChangeListener<NSObject>
- (void)DoneClicked:(UIPopoverController *)pop
           WithDate:(NSDate *)Date
          WithEntry:(NSString *)Entry;
- (void)CancelClick:(UIPopoverController *)pop;
@end
