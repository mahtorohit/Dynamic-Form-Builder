//
//  FormParserV1.m
//  DynamicFormGenerator
//
//  Created by ROHIT on 5/19/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import "FormParserV1.h"
#import "ElementDetails.h"
#import "RMFormsCateforyInfo.h"
#import "RMFormsRowInfo.h"
#import "AppDelegate.h"
#import "RMFormsInfo.h"
@implementation FormParserV1

/**
 *  Get Array of RMFormsInfo from row json
 *  @param NSString RowJson.
 *  @return NSMutableArray FormData.
 */

- (NSMutableArray *)GetDataFromJson:(NSString *)strdata {
  NSString *filePath =
      [[NSBundle mainBundle] pathForResource:strdata ofType:@"json"];
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
    NSMutableArray *arr = [self parseJSON:json];
    return arr;
  }
  return nil;
}

/**
 *  parse ElementDetails from row json
 *  @param NSArray Elements in Row.
 *  @return NSMutableDictionary Element Details.
 */

- (NSMutableDictionary *)parseElements:(NSArray *)jsonDic {
  NSMutableDictionary *RowDat = [[NSMutableDictionary alloc] init];

  for (int i = 0; i < jsonDic.count; i++) {
    NSMutableArray *rowLis = [[jsonDic objectAtIndex:i] objectForKey:@"child"];
    if ([rowLis count] > 0) {
      NSMutableArray *arr = [[NSMutableArray alloc] init];
      for (int j = 0; j < rowLis.count; j++) {
        NSDictionary *views = [rowLis objectAtIndex:j];
        ElementDetails *ele = [[ElementDetails alloc]
            initWithDataV1:[views objectForKey:@"attr"]];
        [arr addObject:ele];
      }
      [RowDat setValue:arr forKey:[NSString stringWithFormat:@"Row%d", i]];
    }
  }

  return RowDat;
}

/**
 *  Get metadata & catagory Details from form array
 *  @param NSDictionary Metadata.
 *  @return NSMutableArray Catagory Details.
 */
- (NSMutableArray *)parseJSON:(NSDictionary *)dictConf {
  NSMutableArray *formArray = [[NSMutableArray alloc] init];
  NSMutableArray *rowLis = [dictConf objectForKey:@"child"];
  if ([rowLis count] > 0) {
    for (int j = 0; j < rowLis.count; j++) {
      NSDictionary *obj = [[NSDictionary alloc] init];
      obj = [rowLis objectAtIndex:j];
      if ([[obj objectForKey:@"tag"] isEqualToString:@"metadata"]) {
        RMFormsInfo *formInfo = [[RMFormsInfo alloc] init];

        NSDictionary *att = [obj objectForKey:@"attr"];

        formInfo.formTitle = [att objectForKey:@"formTitle"];
        formInfo.formSubTitle = [att objectForKey:@"formSubtitle"];

        formInfo.categoryArray = [self parseCategory:dictConf];

        for (int i = 0; i < rowLis.count; i++) {
          NSMutableArray *categorysArray = [[NSMutableArray alloc] init];
          NSDictionary *obj = [[NSDictionary alloc] init];
          obj = [rowLis objectAtIndex:i];
          if ([[obj objectForKey:@"tag"] isEqualToString:@"userentry"]) {
            NSArray *catViewList = [obj objectForKey:@"child"];

            for (int i = 0; i < catViewList.count; i++) {
              obj = [catViewList objectAtIndex:i];
              RMFormsCateforyInfo *formcatinfo =
                  [[RMFormsCateforyInfo alloc] init];
              formcatinfo.totalSectionCount = 1;
              formcatinfo.categoryId =
                  [[obj objectForKey:@"attr"] objectForKey:@"dataparentid"];

              formcatinfo.rowsInSectionArray =
                  [self parserRowsInSection:[catViewList objectAtIndex:i]];
              [categorysArray addObject:formcatinfo];
            }

            formInfo.elementsArrayWithId = categorysArray;
          }
        }

        [formArray addObject:formInfo];
      }
    }
  }

  AppDelegate *appDelegate =
      (AppDelegate *)[[UIApplication sharedApplication] delegate];
  appDelegate.formDataArray = formArray;
  return formArray;

  return nil;
}

/**
 *  Parse ElementDetails from UserEntry
 *  @param NSDictionary Metadata.
 *  @return NSMutableArray Catagory Details.
 */
- (NSMutableArray *)parseJSONa:(NSDictionary *)dictConf {
  NSMutableDictionary *RowDat = [[NSMutableDictionary alloc] init];
  NSMutableArray *arr = [[NSMutableArray alloc] init];
  NSMutableArray *rowLis = [dictConf objectForKey:@"child"];
  if ([rowLis count] > 0) {
    for (int j = 0; j < rowLis.count; j++) {
      NSDictionary *obj = [[NSDictionary alloc] init];
      obj = [rowLis objectAtIndex:j];
      if ([[obj objectForKey:@"tag"] isEqualToString:@"userentry"]) {
        // obj = [obj objectForKey:@"child"];
        NSMutableArray *row = [[NSMutableArray alloc] init];
        arr = [[NSMutableArray alloc] init];
        row = [obj objectForKey:@"child"];
        for (int i = 0; i < row.count; i++) {
          NSMutableDictionary *chi = [row objectAtIndex:i];
          NSMutableArray *ch = [[NSMutableArray alloc] init];

          ch = [chi objectForKey:@"child"];

          for (int i = 0; i < ch.count; i++) {
            NSMutableDictionary *chi1 = [ch objectAtIndex:i];
            NSMutableArray *ch1 = [[NSMutableArray alloc] init];
            ch1 = [chi1 objectForKey:@"child"];
            for (int i = 0; i < ch1.count; i++) {
              NSMutableDictionary *chi2 = [[NSMutableDictionary alloc] init];
              chi2 = [[ch1 objectAtIndex:i] objectForKey:@"attr"];
              //                            NSMutableArray *ch2=[[NSMutableArray
              //                            alloc] init];

              ElementDetails *ele =
                  [[ElementDetails alloc] initWithDataV1:chi2];
              [arr addObject:ele];
            }

            [RowDat setValue:arr
                      forKey:[NSString stringWithFormat:@"Row%d", i]];
          }
        }
      }
    }
  }

  return RowDat;
}

/**
 *  Get Array of catagory from a Form
 *  @param NSDictionary Catagory json .
 *  @return NSMutableArray Catagory Array.
 */

- (NSMutableArray *)parseCategory:(NSDictionary *)dictConf {
  NSMutableArray *categorysArray = [[NSMutableArray alloc] init];
  NSMutableArray *rowLis = [dictConf objectForKey:@"child"];
  if ([rowLis count] > 0) {
    for (int j = 0; j < rowLis.count; j++) {
      NSDictionary *obj = [[NSDictionary alloc] init];
      obj = [rowLis objectAtIndex:j];
      if ([[obj objectForKey:@"tag"] isEqualToString:@"categoryentry"]) {
        NSMutableArray *cat = [[NSMutableArray alloc] init];
        cat = [obj objectForKey:@"child"];

        for (int i = 0; i < cat.count; i++) {
          NSDictionary *catDet = [cat objectAtIndex:i];

          RMFormsCateforyInfo *elementInfo = [[RMFormsCateforyInfo alloc] init];
          if ([[catDet objectForKey:@"attr"] objectForKey:@"id"] != nil) {
            elementInfo.categoryId =
                [[catDet objectForKey:@"attr"] objectForKey:@"id"];
          }
          if ([[catDet objectForKey:@"attr"] objectForKey:@"text"] != nil) {
            elementInfo.categoryTitle =
                [[catDet objectForKey:@"attr"] objectForKey:@"text"];
          }

          [categorysArray addObject:elementInfo];
        }
      }
    }
  }

  return categorysArray;
}

/**
 *  Parse RMFormsRowInfo from Json
 *  @param NSDictionary Catagory json .
 *  @return NSMutableArray RMFormsRowInfo Array.
 */
- (NSMutableArray *)parserRowsInSection:(NSDictionary *)categoryDic {
  NSArray *rowArrayCount = [categoryDic objectForKey:@"child"];

  NSMutableArray *rowsArray = [[NSMutableArray alloc] init];

  for (int i = 0; i < rowArrayCount.count; i++) {
    NSDictionary *rowDic = [rowArrayCount objectAtIndex:i];
    NSDictionary *discAttr = [rowDic objectForKey:@"attr"];

    if (rowDic != nil) {
      //           NSArray *row= [rowDic  objectForKey:@"child"];
      //            for(int i=0;i<rowArrayCount.count;i++)
      //            {
      // rowInfo.noRows= []
      if ([rowArrayCount objectAtIndex:i] != nil) {
        RMFormsRowInfo *rowInfo = [[RMFormsRowInfo alloc] init];
        rowInfo.noSection = 1;
        rowInfo.sectionName = @"";
        rowInfo.rowHeight = [[discAttr objectForKey:@"height"] intValue];
        //                NSArray *rowLis=[[rowArrayCount objectAtIndex:i]
        //                objectForKey:@"child"] ;

        rowInfo.noRows = [rowArrayCount count];

        rowInfo.elementInfoArray = [self parseElements:rowArrayCount];
        [rowsArray addObject:rowInfo];
      }
      //            }
    }
  }
  return rowsArray;
}
@end
