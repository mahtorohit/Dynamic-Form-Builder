//
//  RMFormsRowInfo.h
//  RMForms
//
//  Created by Siddharth on 1/7/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

/**
 * For storing row information of selected form into RMFormsRowInfo object
 **/

#import <Foundation/Foundation.h>

@interface RMFormsRowInfo : NSObject {
  int _noRows, _noSection;
  NSMutableDictionary *_elementInfoArray;
  NSString *_sectionName;
  int rowHeight;
}

@property (strong, nonatomic) NSMutableDictionary *elementInfoArray;
@property (strong, nonatomic) NSString *sectionName;
@property (assign, nonatomic) int noRows, noSection, rowHeight;

@end
