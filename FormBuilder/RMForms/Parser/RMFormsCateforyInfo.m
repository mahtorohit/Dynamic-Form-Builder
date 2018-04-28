//
//  RMFormsCateforyInfo.m
//  RMForms
//
//  Created by Siddharth on 1/7/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import "RMFormsCateforyInfo.h"

@implementation RMFormsCateforyInfo

@synthesize categoryCreatedTime = _categoryCreatedTime;
@synthesize categoryExpiryTime = _categoryExpiryTime,
            categoryIcon = _categoryIcon;
@synthesize categoryId = _categoryId, categoryTitle = _categoryTitle;

@synthesize rowsInSectionArray = _rowsInSectionArray;
@synthesize totalSectionCount;

- (id)init {
  if (self = [super init]) {
    self.categoryTitle = @"";
    self.categoryId = @"";
    self.categoryExpiryTime = [[NSDate alloc] init];
    self.categoryCreatedTime = [[NSDate alloc] init];
    self.categoryIcon = @"";
    self.rowsInSectionArray = [[NSArray alloc] init];
    self.totalSectionCount = 0;
  }
  return self;
}

@end
