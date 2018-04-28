//
//  UITextField+Extra.h
//  DynamicForms
//
//  Created by ROHIT on 21/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UITextField (Extra)
@property (nonatomic, assign) FieldType fieldType;
@property (nonatomic, retain) NSString *entryDataId;
@end
d
