//
//  UISwitch+Extra.m
//  DynamicForms
//
//  Created by ROHIT on 21/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import "UISwitch+Extra.h"
static char FIELDTYPE_IDENTIFER;
static char ENTRYDATAID_IDENTIFER;
static UILabel *BGVIEW_IDENTIFER;

@implementation UISwitch (Extra)
@dynamic fieldType;
@dynamic entryDataId;
@dynamic lbView;

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

- (void)setLbView:(UILabel *)newEntryDataId {
  objc_setAssociatedObject(self, &BGVIEW_IDENTIFER, newEntryDataId,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)lbView {
  return objc_getAssociatedObject(self, &BGVIEW_IDENTIFER);
}

@end
