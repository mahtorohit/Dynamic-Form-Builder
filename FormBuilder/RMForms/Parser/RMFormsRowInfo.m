//
//  RMFormsRowInfo.m
//  RMForms
//
//  Created by Siddharth on 1/7/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import "RMFormsRowInfo.h"

@implementation RMFormsRowInfo

@synthesize noRows = _noRows;
@synthesize noSection = _noSection;
@synthesize sectionName = _sectionName;
@synthesize elementInfoArray = _elementInfoArray;
@synthesize rowHeight;

- (id)init {
  if (self = [super init]) {
    self.noRows = 0;
    self.noSection = 0;
    self.rowHeight = 0;
    self.sectionName = @"";
    self.elementInfoArray = [[NSMutableDictionary alloc] init];
  }
  return self;
}

@end
