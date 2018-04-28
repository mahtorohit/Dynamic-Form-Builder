//
//  FormParser.h
//  DynamicForms
//
//  Created by ROHIT on 19/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMFormsInfo.h"

@interface FormParser : NSObject

- (NSMutableArray *)GetDataFromJson:(NSString *)data;

@end
