//
//  UITextView+Extra.h
//  DynamicForms
//
//  Created by ROHIT on 21/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UITextView (Extra)

@property (nonatomic, assign) FieldType fieldType;
@property (nonatomic, retain) NSString *entryDataId;

@end
