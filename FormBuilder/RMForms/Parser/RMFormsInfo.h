//
//  GeneralInfo.h
//  RMFormsiPhone
//
//  Created by Siddharth on 1/1/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * For storing form information into RMFormsInfo object
 **/

@interface RMFormsInfo : NSObject {
 @private
  NSString *_formId;
  NSString *_formTitle, *_formSubTitle, *_formIcon, *_formThemeColor;
  NSDate *_formCreatedTime, *_formExpiryTime;
  NSMutableArray *_categoryArray, *_elementsArrayWithId;
  int totalCategoriesCount;
}

@property (strong, nonatomic) NSMutableArray *categoryArray,
    *elementsArrayWithId;
@property (strong, nonatomic) NSString *formTitle, *formSubTitle, *formIcon,
    *formId, *formThemeColor;
@property (strong, nonatomic) NSDate *formCreatedTime, *formExpiryTime;
@property (assign, nonatomic) int totalCategoriesCount;

@end
