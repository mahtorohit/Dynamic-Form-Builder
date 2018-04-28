//
//  UISegmentedControl+Extra.m
//  DynamicFormGenerator
//
//  Created by ROHIT on 2/25/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import "UISegmentedControl+Extra.h"
static char FIELDTYPE_IDENTIFER;
static char ENTRYDATAID_IDENTIFER;
static char VALUEARRAY_IDENTIFER;
@implementation UISegmentedControl (Extra)

@dynamic fieldType;
@dynamic entryDataId;

- (void)setFieldType:(FieldType)animated {
  objc_setAssociatedObject(self, &FIELDTYPE_IDENTIFER,
                           [NSNumber numberWithInteger:animated],
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FieldType)fieldType {
  //   int val=(int) objc_getAssociatedObject(self, &FIELDTYPE_IDENTIFER);
  NSString *str = objc_getAssociatedObject(self, &FIELDTYPE_IDENTIFER);
  return (FieldType)[str integerValue];
}

- (void)setEntryDataId:(NSString *)newEntryDataId {
  objc_setAssociatedObject(self, &ENTRYDATAID_IDENTIFER, newEntryDataId,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)entryDataId {
  return objc_getAssociatedObject(self, &ENTRYDATAID_IDENTIFER);
}

- (void)setValueArray:(NSArray *)newValueArray {
  objc_setAssociatedObject(self, &VALUEARRAY_IDENTIFER, newValueArray,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)valueArray {
  return objc_getAssociatedObject(self, &VALUEARRAY_IDENTIFER);
}

@end
