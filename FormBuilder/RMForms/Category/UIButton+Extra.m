//
//  UIButton+Extra.m
//  DynamicForms
//
//  Created by ROHIT on 21/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import "UIButton+Extra.h"
#import <objc/runtime.h>
static char FIELDTYPE_IDENTIFER;
static char ENTRYDATAID_IDENTIFER;
static char VALUEARRAY_IDENTIFER;
static char DATE_MIN;
static char DATE_MAX;
static char TITLE_IDENTIFER;
static BOOL MULTISELECTION_IDENTIFER;

@implementation UIButton (Extra)
@dynamic fieldType;
@dynamic entryDataId;
@dynamic valueArray;
@dynamic minDate;
@dynamic maxDate;
@dynamic title;
@dynamic multiSelection;

- (void)setFieldType:(FieldType)animated {
  objc_setAssociatedObject(self, &FIELDTYPE_IDENTIFER,
                           [NSNumber numberWithInteger:animated],
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FieldType)fieldType {
  //   int val=(int) objc_getAssociatedObject(self, &FIELDTYPE_IDENTIFER);
  NSNumber *str = objc_getAssociatedObject(self, &FIELDTYPE_IDENTIFER);
  return (FieldType)[str integerValue];
}

- (void)setEntryDataId:(NSString *)newEntryDataId {
  objc_setAssociatedObject(self, &ENTRYDATAID_IDENTIFER, newEntryDataId,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)entryDataId {
  return objc_getAssociatedObject(self, &ENTRYDATAID_IDENTIFER);
}

- (void)setMultiSelection:(BOOL)newMultiSelection {
  objc_setAssociatedObject(self, &MULTISELECTION_IDENTIFER,
                           [NSNumber numberWithBool:newMultiSelection],
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)multiSelection {
  return [objc_getAssociatedObject(self, &MULTISELECTION_IDENTIFER) boolValue];
}

- (void)setTitle:(NSString *)newTitle {
  objc_setAssociatedObject(self, &TITLE_IDENTIFER, newTitle,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)title {
  return objc_getAssociatedObject(self, &TITLE_IDENTIFER);
}

- (void)setValueArray:(NSArray *)newValueArray {
  objc_setAssociatedObject(self, &VALUEARRAY_IDENTIFER, newValueArray,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)valueArray {
  return objc_getAssociatedObject(self, &VALUEARRAY_IDENTIFER);
}

- (void)setMinDate:(NSDate *)newDate {
  objc_setAssociatedObject(self, &DATE_MIN, newDate,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDate *)minDate {
  return objc_getAssociatedObject(self, &DATE_MIN);
}

- (void)setMaxDate:(NSDate *)newDate {
  objc_setAssociatedObject(self, &DATE_MAX, newDate,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDate *)maxDate {
  return objc_getAssociatedObject(self, &DATE_MAX);
}

@end
