//
//  UITextField+Extra.m
//  DynamicForms
//
//  Created by ROHIT on 21/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import "UITextField+Extra.h"
static char FIELDTYPE_IDENTIFER;
static char ENTRYDATAID_IDENTIFER;
@implementation UITextField (Extra)
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

@end
