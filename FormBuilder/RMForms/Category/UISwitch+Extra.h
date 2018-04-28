//
//  UISwitch+Extra.h
//  DynamicForms
//
//  Created by ROHIT on 21/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UISwitch (Extra)

@property (nonatomic, assign) FieldType fieldType;
@property (nonatomic, retain) NSString *entryDataId;
@property (nonatomic, retain) UILabel *lbView;
@end
