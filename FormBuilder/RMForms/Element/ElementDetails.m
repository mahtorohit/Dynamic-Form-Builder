//
//  ElementDetails.m
//  DynamicForms
//
//  Created by ROHIT on 19/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import "ElementDetails.h"

@implementation ElementDetails

//-(id)initWithData:(NSDictionary *)data
//{
//    if(data!=nil)
//    {
//        if([data objectForKey:@"width"]!=nil)
//        {
//            self.width=[[data objectForKey:@"width"] intValue];
//        }
//        else
//        {
//            self.width=[[NSNumber numberWithInteger:0] intValue];
//        }
//        if([data objectForKey:@"hight"])
//        {
//            self.hight=[[data objectForKey:@"hight"] intValue];
//        }
//        else
//        {
//
//            self.hight=[[NSNumber numberWithInteger:0] intValue];
//        }
//        if([data objectForKey:@"RowID"])
//        {
//            self.RowID=[[data objectForKey:@"RowID"] intValue];
//
//        }
//        else
//        {
//            self.RowID=0 ;
//        }
//        if([data objectForKey:@"ElementType"])
//        {
//            self.ElementType=[[data objectForKey:@"ElementType"] intValue];
//
//
//            switch (self.ElementType ) {
//                case 1:
//                {
//                    self.fieldType= FieldLabelField;
//
//
//                }
//                                       break;
//                case 2:
//                    self.fieldType= FieldTextField;
//                    break;
//
//                case 3:
//                    self.fieldType= FieldTextView;
//                    break;
//
//                case 4:
//                    self.fieldType= FieldCheBoxType1;
//                    break;
//
////                case 5:
////                    self.fieldType= FieldCheBoxType2;
////                    break;
//
//                case 6:
//                {
//
//
//                    self.fieldType= FieldDatePicker;
//
//
//
////                    "Date": {
////                        "minDate": "2/2/2017",
////                        "maxDate": "2/3/2017"
////                    }
//
//                    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]
//                    init];
//                    [dateFormat setDateFormat:@"MM/dd/yyyy"];
//
//
//
//                    if ([data objectForKey:@"Date"]) {
//                        self.MinDate=[dateFormat dateFromString:[[data
//                        objectForKey:@"Date"] objectForKey:@"minDate"]];
//                         self.MaxDate=[dateFormat dateFromString:[[data
//                         objectForKey:@"Date"] objectForKey:@"maxDate"]];
//
//
//                   }
//
//                    dateFormat=nil;
//
//
//
//                }
//                    break;
//
//                case 7:
//                {
//                    self.fieldType= FieldDataPicker;
//
//                    if ([data objectForKey:@"MultiSelection"]!=nil) {
//                        self.multiSelection=[[data
//                        objectForKey:@"MultiSelection"]boolValue];
//                    }
//
//                    if ([data objectForKey:@"value"]!=nil) {
//                        if ([[data objectForKey:@"value"]
//                        isKindOfClass:[NSArray class]]) {
//                            NSArray *valuesArray=[data objectForKey:@"value"];
//                            if ([valuesArray count]>0) {
//                                self.ArrayValue=[valuesArray mutableCopy];
//                            }
//                        }
//                        else if ([[data objectForKey:@"value"]length]>0)
//                        {
//
//                        }
//                    }
//
//
//
//                }
//                    break;
//                case 8:
//                    self.fieldType= FieldImagePicker;
//                    break;
//                case 9:
//                self.fieldType= FieldInputePop;
//                break;
//                case 10:
//                {
//                    self.fieldType= FieldSegment;
//
//                    if([data objectForKey:@"activetab"])
//                    {
//
//                        self.activetab = [[data objectForKey:@"activetab"]
//                        intValue];
//                    }
//
//
//                    if ([data objectForKey:@"value"]!=nil) {
//                        if ([[data objectForKey:@"value"]
//                        isKindOfClass:[NSArray class]]) {
//                            NSArray *valuesArray=[data objectForKey:@"value"];
//                            if ([valuesArray count]>0) {
//                                self.ArrayValue=[valuesArray mutableCopy];
//                            }
//                        }
//                        else if ([[data objectForKey:@"value"]length]>0)
//                        {
//
//                        }
//
//
//                    }
//                }
//                    break;
//
//
//                case 11:
//                    self.fieldType= FieldAmPmCheck;
//                    break;
//
//                case 12:
//                    self.fieldType= FieldAmPmImagePicker;
//                    break;
//
//                case 13:
//                {
//                    self.fieldType= FieldAmPmSegment;
//
//
//                    if ([data objectForKey:@"value"]!=nil) {
//                        if ([[data objectForKey:@"value"]
//                        isKindOfClass:[NSArray class]]) {
//                            NSArray *valuesArray=[data objectForKey:@"value"];
//                            if ([valuesArray count]>0) {
//                                self.ArrayValue=[valuesArray mutableCopy];
//                            }
//                        }
//                        else if ([[data objectForKey:@"value"]length]>0)
//                        {
//
//                        }
//                    }
//
//                }
//                    break;
//
//                case 14:
//                {
//                    self.fieldType= FieldAmPmInputePop;
//                }
//                    break;
//
//
//                default:
//                    break;
//            }
//        }
//        else
//        {
//            self.ElementType=0;
//        }
//        if([data objectForKey:@"ElementId"])
//        {
////            if([[data objectForKey:@"ElementId"] isKindOfClass:[NSArray
///class]])
////            {
////
////            }
////            else
////            {
//                 self.ElementId=[data objectForKey:@"ElementId"];
////            }
//
//        }
//        else
//        {
//            self.ElementId=@"";
//        }
//        self.seperatorLineAfterText=YES;
//        if ([data objectForKey:@"SeperatorLineAfterText"]!=nil) {
//            self.seperatorLineAfterText=[[data
//            objectForKey:@"SeperatorLineAfterText"]boolValue];
//        }
//
//        if([data objectForKey:@"TextValue"])
//        {
//            if([[data objectForKey:@"TextValue"] isKindOfClass:[NSString
//            class]])
//            self.TextValue=[data objectForKey:@"TextValue"];
//        }
//        else
//        {
//            self.TextValue=@"";
//        }
//
//        if([data objectForKey:@"paddingtop"])
//        {
//            self.TopPadding = [[data objectForKey:@"paddingtop"] intValue];
//        }
//
//        if([data objectForKey:@"paddingbottom"])
//        {
//            self.BottomPadding = [[data objectForKey:@"paddingbottom"]
//            intValue];
//        }
//
//        if([data objectForKey:@"paddingright"])
//        {
//            self.RightPadding = [[data objectForKey:@"paddingright"]
//            intValue];
//        }
//        if([data objectForKey:@"paddingleft"])
//        {
//            self.leftPadding = [[data objectForKey:@"paddingleft"] intValue];
//        }
//
//    }
////
////    NSThread* myThread = [[NSThread alloc] initWithTarget:self
//// selector:@selector(myThreadMainMethod)
////                                                   object:nil];
////    [myThread start];
////
////
////    [myThread ]
//
//    return self;
//}

//-(void)myThreadMainMethod
//{
//
//}

- (id)initWithDataV1:(NSDictionary *)data {
  //    "tag": "ele-label",
  //    "attr": {
  //        "text": "aaaaa a a a   a aaaaaaaa a  aaaaa",
  //        "width": "100",
  //        "height": "100",
  //        "paddingtop": "40",
  //        "paddingbottom": "0",
  //        "paddingleft": "1",
  //        "paddingright": "0",
  //        "fontsize": "13",
  //        "color": "#000000",
  //        "textalign": "center",
  //        "separator": "YES",
  //        "id": "dropedItem21",
  //        "onclick": "showProperty(id); event.stopPropagation();",
  //        "activeclass": ""
  //        }

  if (data != nil) {
    if ([data objectForKey:@"width"] != nil) {
      self.width = [[data objectForKey:@"width"] intValue];
    } else {
      self.width = [[NSNumber numberWithInteger:0] intValue];
    }
    if ([data objectForKey:@"height"]) {
      self.hight = [[data objectForKey:@"height"] intValue];
    } else {
      self.hight = [[NSNumber numberWithInteger:0] intValue];
    }
    if ([data objectForKey:@"RowID"]) {
      self.RowID = [[data objectForKey:@"RowID"] intValue];

    } else {
      self.RowID = 0;
    }

    if ([data objectForKey:@"paddingtop"]) {
      self.TopPadding = [[data objectForKey:@"paddingtop"] intValue];
    }

    if ([data objectForKey:@"text"]) {
      if ([[data objectForKey:@"text"] isKindOfClass:[NSString class]])
        self.TextValue = [data objectForKey:@"text"];
    } else {
      self.TextValue = @"";
    }

    if ([data objectForKey:@"TextValue"]) {
      if ([[data objectForKey:@"TextValue"] isKindOfClass:[NSString class]])
        self.TextValue = [data objectForKey:@"TextValue"];
    } else {
      self.TextValue = @"";
    }

    if ([data objectForKey:@"elementtype"]) {
      self.ElementType = [[data objectForKey:@"elementtype"] intValue];

      switch (self.ElementType) {
        case 1: {
          self.fieldType = FieldLabelField;

          if ([data objectForKey:@"text"]) {
            self.TextValue = [data objectForKey:@"text"];
          }
        } break;
        case 2:
          self.fieldType = FieldTextField;
          break;

        case 3:
          self.fieldType = FieldTextView;
          break;

        case 4:
          self.fieldType = FieldCheBoxType1;
          break;

        //                case 5:
        //                    self.fieldType= FieldCheBoxType2;
        //                    break;

        case 6: {
          self.fieldType = FieldDatePicker;

          //                    "Date": {
          //                        "minDate": "2/2/2017",
          //                        "maxDate": "2/3/2017"
          //                    }

          if ([data objectForKey:@"label"] != nil) {
            self.LableText = [data objectForKey:@"label"];
          }

          self.TextValue = [NSString stringWithFormat:@"%@", [NSDate date]];

          NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
          [dateFormat setDateFormat:@"MM/dd/yyyy"];

          if ([data objectForKey:@"Date"]) {
            self.MinDate =
                [dateFormat dateFromString:[[data objectForKey:@"Date"]
                                               objectForKey:@"minDate"]];
            self.MaxDate =
                [dateFormat dateFromString:[[data objectForKey:@"Date"]
                                               objectForKey:@"maxDate"]];
          }

          dateFormat = nil;

        } break;

        case 7: {
          self.fieldType = FieldDataPicker;

          if ([data objectForKey:@"label"] != nil) {
            self.LableText = [data objectForKey:@"label"];
          }

          if ([data objectForKey:@"text"] != nil) {
            NSMutableArray *items = (NSMutableArray *)[
                [data objectForKey:@"text"] componentsSeparatedByString:@";"];

            for (int i = 0; i < items.count; i++) {
              if ([[items objectAtIndex:i] length] == 0) {
                [items removeObjectAtIndex:i];
              }
            }
            self.ArrayValue = items;
            self.TextValue = [items objectAtIndex:0];
          }

        } break;
        case 8:
          self.fieldType = FieldImagePicker;
          break;
        case 9:
          self.fieldType = FieldInputePop;
          break;
        case 10: {
          self.fieldType = FieldSegment;

          if ([data objectForKey:@"activetab"]) {
            self.activetab = [[data objectForKey:@"activetab"] intValue];
          }

          if ([data objectForKey:@"label1"] != nil &&
              [data objectForKey:@"label2"] != nil &&
              [data objectForKey:@"label3"] != nil) {
            NSMutableArray *valuesArray = [[NSMutableArray alloc] init];

            [valuesArray addObject:[data objectForKey:@"label1"]];
            [valuesArray addObject:[data objectForKey:@"label2"]];

            [valuesArray addObject:[data objectForKey:@"label3"]];

            if ([valuesArray count] > 0) {
              self.ArrayValue = [valuesArray mutableCopy];
            }
          }

        } break;

        case 11:
          self.fieldType = FieldAmPmCheck;
          break;

        case 12:
          self.fieldType = FieldAmPmImagePicker;
          break;

        case 13: {
          self.fieldType = FieldAmPmSegment;

          if ([data objectForKey:@"activetab"]) {
            self.activetab = [[data objectForKey:@"activetab"] intValue];
          }

          if ([data objectForKey:@"label1"] != nil &&
              [data objectForKey:@"label2"] != nil &&
              [data objectForKey:@"label3"] != nil) {
            NSMutableArray *valuesArray = [[NSMutableArray alloc] init];

            [valuesArray addObject:[data objectForKey:@"label1"]];
            [valuesArray addObject:[data objectForKey:@"label2"]];

            [valuesArray addObject:[data objectForKey:@"label3"]];

            if ([valuesArray count] > 0) {
              self.ArrayValue = [valuesArray mutableCopy];
            }
          }

        } break;

        case 14: {
          self.fieldType = FieldAmPmInputePop;
        } break;

        case 15: {
          self.fieldType = FieldLabText;
          self.LableText = [data objectForKey:@"label"];
          self.TextValue = [data objectForKey:@"text"];
        } break;

        case 16: {
          self.fieldType = FieldDataPickerMulti;

          if ([data objectForKey:@"label"] != nil) {
            self.LableText = [data objectForKey:@"label"];
          }

          if ([data objectForKey:@"text"] != nil) {
            NSMutableArray *items = (NSMutableArray *)[
                [data objectForKey:@"text"] componentsSeparatedByString:@";"];
            for (int i = 0; i < items.count; i++) {
              if ([[items objectAtIndex:i] length] == 0) {
                [items removeObjectAtIndex:i];
              }
            }

            self.ArrayValue = items;
            self.TextValue = [items objectAtIndex:0];
          }

        } break;
        case 17: {
          self.fieldType = FieldLabTextBig;

          self.LableText = [data objectForKey:@"label"];
          self.TextValue = [data objectForKey:@"text"];

        } break;
        default:
          break;
      }
    } else {
      self.ElementType = 0;
    }
    if ([data objectForKey:@"ElementId"]) {
      //            if([[data objectForKey:@"ElementId"] isKindOfClass:[NSArray
      //            class]])
      //            {
      //
      //            }
      //            else
      //            {
      self.ElementId = [data objectForKey:@"ElementId"];
      //            }

    } else {
      self.ElementId = @"tmpID";
    }
    self.seperatorLineAfterText = YES;
    if ([data objectForKey:@"SeperatorLineAfterText"] != nil) {
      self.seperatorLineAfterText =
          [[data objectForKey:@"SeperatorLineAfterText"] boolValue];
    }

    if ([data objectForKey:@"separator"]) {
      if ([[data objectForKey:@"separator"] isEqualToString:@"YES"])
        self.separator = YES;
    } else {
      self.separator = NO;
    }
    if ([data objectForKey:@"fontsize"]) {
      self.FontSize = [[data objectForKey:@"fontsize"] intValue];
    }

    if ([data objectForKey:@"paddingtop"]) {
      self.TopPadding = [[data objectForKey:@"paddingtop"] intValue];
    }

    if ([data objectForKey:@"paddingbottom"]) {
      self.BottomPadding = [[data objectForKey:@"paddingbottom"] intValue];
    }

    if ([data objectForKey:@"paddingright"]) {
      self.RightPadding = [[data objectForKey:@"paddingright"] intValue];
    }
    if ([data objectForKey:@"paddingleft"]) {
      self.leftPadding = [[data objectForKey:@"paddingleft"] intValue];
    }

    if ([data objectForKey:@"spacebetween"]) {
      self.SpaceBetween = [[data objectForKey:@"spacebetween"] intValue];
    }

    if ([data objectForKey:@"textalign"]) {
      self.TextAlign = [data objectForKey:@"textalign"];
    }

    if ([data objectForKey:@"color"]) {
      self.TextColor = [[data objectForKey:@"color"]
          stringByReplacingOccurrencesOfString:@"#"
                                    withString:@""];
    }
  }

  return self;
}
@end
