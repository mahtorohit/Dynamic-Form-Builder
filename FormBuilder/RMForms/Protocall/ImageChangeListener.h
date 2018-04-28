//
//  ImageChangeListener.h
//  DynamicFormGenerator
//
//  Created by Siddharth on 2/25/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

/**
 * To have custom methods for image picker in ImageChangeListener
 **/

#import <Foundation/Foundation.h>

@protocol ImageChangeListener<NSObject>

- (void)imageButton_Clicked:(NSString *)value WithEntry:(NSString *)entry;

@end
