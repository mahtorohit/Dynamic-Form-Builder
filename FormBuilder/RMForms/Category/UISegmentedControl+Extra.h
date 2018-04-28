//
//  UISegmentedControl+Extra.h
//  DynamicFormGenerator
//
//  Created by ROHIT on 2/25/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UISegmentedControl (Extra)

@property (nonatomic, assign) FieldType fieldType;
@property (nonatomic, retain) NSString *entryDataId;
@property (nonatomic, strong) NSArray *valueArray;
@end
