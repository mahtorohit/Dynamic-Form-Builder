//
//  RMFormsCateforyInfo.h
//  RMForms
//
//  Created by Siddharth on 1/7/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

/**
 * For storing category information of selected form into RMFormsCateforyInfo
 *object
 **/

#import <Foundation/Foundation.h>

@interface RMFormsCateforyInfo : NSObject {
  NSString *_categoryId;
  NSString *_categoryTitle, *_categoryIcon;
  NSDate *_categoryCreatedTime, *_categoryExpiryTime;
  NSArray *_rowsInSectionArray;
  int totalSectionCount;
}

@property (strong, nonatomic) NSDate *categoryCreatedTime, *categoryExpiryTime;
@property (strong, nonatomic) NSString *categoryTitle, *categoryIcon;
@property (strong, nonatomic) NSString *categoryId;
@property (strong, nonatomic) NSArray *rowsInSectionArray;
@property (assign, nonatomic) int totalSectionCount;

@end
