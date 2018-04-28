//
//  UIButton+Extra.h
//  DynamicForms
//
//  Created by ROHIT on 21/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

/**
 * UIButton+Extra overrides properties and methods.
 **/

#import <UIKit/UIKit.h>

@interface UIButton (Extra)

/**
 * FieldType refers field type of UI.
 * @see FieldType
 **/
@property (nonatomic, assign) FieldType fieldType;
@property (nonatomic, retain) NSString *entryDataId, *title;
@property (nonatomic, strong) NSArray *valueArray;
@property (nonatomic, retain) NSDate *minDate;
@property (nonatomic, retain) NSDate *maxDate;
@property (assign, nonatomic) BOOL multiSelection;

@end
