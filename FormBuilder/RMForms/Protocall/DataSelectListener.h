//
//  DataSelectListener.h
//  DynamicForms
//
//  Created by ROHIT on 21/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

/**
 * To have custom methods for textfield in DataSelectListener
 **/
#import <Foundation/Foundation.h>

@protocol DataSelectListener<NSObject>

- (void)doneButton_Clicked:(id)value WithEntry:(NSString *)entry;

- (void)cancelButton_Clicked;

@end
