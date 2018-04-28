//
//  TextInputeChangeListener.h
//  DynamicFormGenerator
//
//  Created by ROHIT on 2/25/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

/**
 * To have custom methods for textview in TextInputeChangeListener
 **/

#import <Foundation/Foundation.h>

@protocol TextInputeChangeListener<NSObject>
- (void)DoneClicked:(UIPopoverController *)pop
           WithText:(NSString *)Date
          WithEntry:(NSString *)Entry;
- (void)CancelClick:(UIPopoverController *)pop;
@end
