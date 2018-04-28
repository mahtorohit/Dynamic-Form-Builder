
//
//  GeneralInfo.m
//  RMFormsiPhone
//
//  Created by Siddharth on 1/1/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import "RMFormsInfo.h"

@implementation RMFormsInfo

@synthesize formCreatedTime = _formCreatedTime;
@synthesize formExpiryTime = _formExpiryTime, formIcon = _formIcon;
@synthesize formSubTitle = _formSubTitle, formTitle = _formTitle;
@synthesize categoryArray = _categoryArray, totalCategoriesCount;
@synthesize elementsArrayWithId = _elementsArrayWithId;
@synthesize formThemeColor = _formThemeColor, formId = _formId;

- (id)init {
  if (self = [super init]) {
    self.formIcon = @"";
    self.formSubTitle = @"";
    self.formCreatedTime = [[NSDate alloc] init];
    self.formExpiryTime = [[NSDate alloc] init];
    self.formTitle = @"";
    self.formThemeColor = @"";
    self.categoryArray = [[NSMutableArray alloc] init];
    self.elementsArrayWithId = [[NSMutableArray alloc] init];
    self.totalCategoriesCount = 0;
  }
  return self;
}

@end

d
