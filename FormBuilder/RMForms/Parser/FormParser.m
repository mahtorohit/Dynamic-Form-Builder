//
//  FormParser.m
//  DynamicForms
//
//  Created by ROHIT on 19/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import "FormParser.h"
#import "ElementDetails.h"
#import "RMFormsCateforyInfo.h"
#import "RMFormsRowInfo.h"
#import "AppDelegate.h"

@implementation FormParser
- (NSMutableArray *)GetDataFromJson:(NSString *)strdata {
  NSString *filePath =
      [[NSBundle mainBundle] pathForResource:@"formv1" ofType:@"json"];
  NSString *myText;
  if (filePath) {
    myText = [NSString stringWithContentsOfFile:filePath
                                       encoding:NSUTF8StringEncoding
                                          error:nil];
    if (myText) {
      // NSLog(@"data:\n%@",myText);
    }
  }
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  NSError *error = nil;
  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:&error];

  if ([json isKindOfClass:[NSDictionary class]]) {
    NSDictionary *jsonDic = (NSDictionary *)json;
    NSMutableArray *arr = [self parseJSON:jsonDic];
    return arr;
  }
  return nil;
}

- (NSMutableDictionary *)parseElements:(NSDictionary *)jsonDic {
  NSMutableDictionary *RowDat = [[NSMutableDictionary alloc] init];
  NSMutableArray *arr = [[NSMutableArray alloc] init];
  NSMutableArray *rowLis = [jsonDic objectForKey:@"UserEntries"];
  if ([rowLis count] > 0) {
    for (int j = 0; j < rowLis.count; j++) {
      NSMutableArray *row = [[NSMutableArray alloc] init];
      arr = [[NSMutableArray alloc] init];

      row = [[rowLis objectAtIndex:j] objectForKey:@"ViewArray"];

      for (int i = 0; i < row.count; i++) {
        ElementDetails *ele =
            [[ElementDetails alloc] initWithData:[row objectAtIndex:i]];
        [arr addObject:ele];
      }
      [RowDat setValue:arr
                forKey:[[rowLis objectAtIndex:j] objectForKey:@"RowId"]];
    }
    return RowDat;
  }
  return nil;
}

- (NSMutableArray *)parseJSON:(NSDictionary *)dictConf {
  NSMutableArray *formArray = [[NSMutableArray alloc] init];
  if ([dictConf objectForKey:@"categoryEntry"] != nil) {
    RMFormsInfo *formInfo = [[RMFormsInfo alloc] init];
    if ([dictConf objectForKey:@"metadata"] != nil) {
      if ([[dictConf objectForKey:@"metadata"] objectForKey:@"formTitle"] !=
          nil) {
        formInfo.formTitle =
            [[dictConf objectForKey:@"metadata"] objectForKey:@"formTitle"];
      }
      if ([[dictConf objectForKey:@"metadata"]
              objectForKey:@"formThemeColor"] != nil) {
        formInfo.formThemeColor = [[dictConf objectForKey:@"metadata"]
            objectForKey:@"formThemeColor"];
      }
      if ([[dictConf objectForKey:@"metadata"] objectForKey:@"formSubTitle"] !=
          nil) {
        formInfo.formSubTitle =
            [[dictConf objectForKey:@"metadata"] objectForKey:@"formSubTitle"];
      }
      if ([[dictConf objectForKey:@"metadata"]
              objectForKey:@"formCreatedTime"] != nil) {
        // self.formInfo.formCreatedTime=[[dictConf
        // objectForKey:@"metadata"]objectForKey:@"formCreatedTime"];
      }
      if ([[dictConf objectForKey:@"metadata"]
              objectForKey:@"formExpiryTime"] != nil) {
        // self.formInfo.formExpiryTime=[[dictConf
        // objectForKey:@"metadata"]objectForKey:@"formExpiryTime"];
      }
      if ([[dictConf objectForKey:@"metadata"] objectForKey:@"formIcon"] !=
          nil) {
        formInfo.formIcon =
            [[dictConf objectForKey:@"metadata"] objectForKey:@"formIcon"];
      }
    }
    if ([[dictConf objectForKey:@"categoryEntry"] objectForKey:@"entry"] !=
        nil) {
      formInfo.categoryArray = [self parseCategory:dictConf];
    }
    if ([dictConf objectForKey:@"userEntry"] != nil) {
      NSArray *categoryArrayCount = [dictConf objectForKey:@"userEntry"];
      NSMutableArray *categorysArray = [[NSMutableArray alloc] init];
      for (int i = 0; i < [categoryArrayCount count]; i++) {
        NSDictionary *categoryDic = [categoryArrayCount objectAtIndex:i];
        RMFormsCateforyInfo *categoryInfo = [[RMFormsCateforyInfo alloc] init];
        if ([categoryDic objectForKey:@"categoryId"] != nil) {
          categoryInfo.categoryId = [categoryDic objectForKey:@"categoryId"];
        }
        if ([categoryDic objectForKey:@"totalSection"] != nil) {
          categoryInfo.totalSectionCount =
              [[categoryDic objectForKey:@"totalSection"] intValue];
        }
        if ([categoryDic objectForKey:@"rowsInSection"] != nil) {
          categoryInfo.rowsInSectionArray =
              [self parserRowsInSection:categoryDic];
        }
        [categorysArray addObject:categoryInfo];
      }
      formInfo.elementsArrayWithId = categorysArray;
    }
    [formArray addObject:formInfo];
    AppDelegate *appDelegate =
        (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.formDataArray = formArray;
    return formArray;
  }
  return nil;
}

- (NSMutableArray *)parseCategory:(NSDictionary *)dictConf {
  NSArray *categoryArrayCount =
      [[dictConf objectForKey:@"categoryEntry"] objectForKey:@"entry"];
  NSMutableArray *categorysArray = [[NSMutableArray alloc] init];
  // formInfo.totalCategoriesCount=[categoryArrayCount count];
  for (int i = 0; i < [categoryArrayCount count]; i++) {
    NSDictionary *categoryDic = [categoryArrayCount objectAtIndex:i];
    if (categoryDic != nil) {
      RMFormsCateforyInfo *elementInfo = [[RMFormsCateforyInfo alloc] init];
      if ([categoryDic objectForKey:@"categoryId"] != nil) {
        elementInfo.categoryId = [categoryDic objectForKey:@"categoryId"];
      }
      if ([categoryDic objectForKey:@"categoryTitle"] != nil) {
        elementInfo.categoryTitle = [categoryDic objectForKey:@"categoryTitle"];
      }
      if ([categoryDic objectForKey:@"categoryCreatedTime"] != nil) {
        // self.formInfo.formCreatedTime=[[dictConf
        // objectForKey:@"metadata"]objectForKey:@"formCreatedTime"];
      }
      if ([categoryDic objectForKey:@"categoryExpiryTime"] != nil) {
        // self.formInfo.formExpiryTime=[[dictConf
        // objectForKey:@"metadata"]objectForKey:@"formExpiryTime"];
      }
      if ([categoryDic objectForKey:@"categoryIcon"] != nil) {
        elementInfo.categoryIcon = [categoryDic objectForKey:@"categoryIcon"];
      }
      [categorysArray addObject:elementInfo];
    }
  }
  return categorysArray;
}

- (NSMutableArray *)parserRowsInSection:(NSDictionary *)categoryDic {
  NSArray *rowArrayCount = [categoryDic objectForKey:@"rowsInSection"];
  NSMutableArray *rowsArray = [[NSMutableArray alloc] init];
  for (int i = 0; i < [rowArrayCount count]; i++) {
    NSDictionary *rowDic = [rowArrayCount objectAtIndex:i];
    if (rowDic != nil) {
      RMFormsRowInfo *rowInfo = [[RMFormsRowInfo alloc] init];
      if ([rowDic objectForKey:@"noSection"] != nil) {
        rowInfo.noSection = [[rowDic objectForKey:@"noSection"] intValue];
      }
      if ([rowDic objectForKey:@"TotalRows"] != nil) {
        rowInfo.noRows = [[rowDic objectForKey:@"TotalRows"] intValue];
      }
      if ([rowDic objectForKey:@"sectionName"] != nil) {
        rowInfo.sectionName = [rowDic objectForKey:@"sectionName"];
      }
      if ([rowDic objectForKey:@"UserEntries"] != nil) {
        rowInfo.elementInfoArray = [self parseElements:rowDic];
      }
      [rowsArray addObject:rowInfo];
    }
  }
  return rowsArray;
}

@end

