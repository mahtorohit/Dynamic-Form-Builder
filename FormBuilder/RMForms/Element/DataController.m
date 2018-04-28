//
//  DataController.m
//  DynamicForms
//
//  Created by ROHIT on 20/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import "DataController.h"
#import "AppDelegate.h"

@implementation DataController
@synthesize popOver;

//=================================================
/** delegate method All Text Fields */
//=================================================

- (void)textFieldDidEndEditing:(UITextField *)textField {
  // NSLog(@"%@",textField.text);
}

- (void)textViewDidEndEditing:(UITextView *)textView {
  // NSLog(@"aaaaaaaaaaaaaa@");
}

//=================================================
/** delegate method All UIbuttons */
//=================================================

- (IBAction)ButtonAction:(id)sender {
  UIButton *btn = (UIButton *)sender;

  FieldType fi = btn.fieldType;

  switch (fi) {
    case FieldLabelField:
      // NSLog(@"LAB ");
      break;
    case FieldTextField:
      // NSLog(@"LAB2 ");
      break;
    case FieldTextView:
      // NSLog(@"LAB 3");
      break;
    case FieldDatePicker: {
      UIStoryboard *mystoryboard =
          [UIStoryboard storyboardWithName:@"Main" bundle:nil];

      UINavigationController *leftView =
          [mystoryboard instantiateViewControllerWithIdentifier:@"DatePopOver"];

      DatePopOver *moreView = [leftView.viewControllers objectAtIndex:0];
      //   moreView.delegate = D;
      moreView.title = @"Select Date";
      //  NSString * en=btn.entryDataId;
      moreView.entryDataId = btn.entryDataId;
      moreView.DelegateBtn = btn;

      moreView.minDate = btn.minDate;
      moreView.maxDate = btn.maxDate;
      self.popOver =
          [[UIPopoverController alloc] initWithContentViewController:leftView];

      moreView.popOver = self.popOver;
      moreView.delegate = self;

      [self.popOver presentPopoverFromRect:[sender frame]
                                    inView:btn.superview.superview
                  permittedArrowDirections:UIPopoverArrowDirectionAny
                                  animated:YES];

    } break;
    case FieldDataPicker: {
      UIStoryboard *storyboard =
          [UIStoryboard storyboardWithName:@"Main" bundle:nil];
      UINavigationController *leftView =
          [storyboard instantiateViewControllerWithIdentifier:@"DataPopOver"];

      DataPopOver *inputChoice = [leftView.viewControllers objectAtIndex:0];
      inputChoice.valuesArray = btn.valueArray;
      inputChoice.title = btn.title;
      inputChoice.isMultiSelection = btn.multiSelection;
      inputChoice.DelegateBtn = btn;
      BOOL selected = YES;
      if (!inputChoice.isMultiSelection) {
        for (int i = 0; i < [inputChoice.valuesArray count]; i++) {
          if ([[inputChoice.valuesArray objectAtIndex:i]
                  isEqualToString:btn.currentTitle]) {
            inputChoice.selectedIndex = i;
            selected = NO;
          }
        }
        if (selected) {
          inputChoice.selectedIndex = -1;
        }
      } else {
        NSMutableArray *selectedArray = [[NSMutableArray alloc] init];
        if ([btn.currentTitle length] > 0 &&
            (![btn.currentTitle isEqualToString:btn.title])) {
          NSArray *tempArray =
              [btn.currentTitle componentsSeparatedByString:@"|"];
          for (int i = 0; i < [btn.valueArray count]; i++) {
            if ([tempArray count] > 0) {
              for (int j = 0; j < [tempArray count]; j++) {
                if ([[btn.valueArray objectAtIndex:i]
                        isEqualToString:[tempArray objectAtIndex:j]]) {
                  [selectedArray addObject:[NSNumber numberWithInt:i]];
                }
              }
            }
          }
        }
        inputChoice.selectedIndexArray = [selectedArray mutableCopy];
      }

      inputChoice.delegate = self;

      if (self.popOver == nil) {
        self.popOver = [[UIPopoverController alloc]
            initWithContentViewController:leftView];
      } else
        [self.popOver setContentViewController:leftView];

      CGRect aFrame =
          btn.frame;  //[self.tableView rectForRowAtIndexPath:indexPath];

      aFrame.origin.x = btn.frame.origin.x + 10;
      [self.popOver presentPopoverFromRect:aFrame
                                    inView:btn.superview
                  permittedArrowDirections:UIPopoverArrowDirectionRight
                                  animated:YES];
    } break;

    case FieldDataPickerMulti: {
      UIStoryboard *storyboard =
          [UIStoryboard storyboardWithName:@"Main" bundle:nil];
      UINavigationController *leftView =
          [storyboard instantiateViewControllerWithIdentifier:@"DataPopOver"];

      DataPopOver *inputChoice = [leftView.viewControllers objectAtIndex:0];
      inputChoice.valuesArray = btn.valueArray;
      inputChoice.title = btn.title;
      inputChoice.isMultiSelection = YES;
      inputChoice.DelegateBtn = btn;
      BOOL selected = YES;
      if (!inputChoice.isMultiSelection) {
        for (int i = 0; i < [inputChoice.valuesArray count]; i++) {
          if ([[inputChoice.valuesArray objectAtIndex:i]
                  isEqualToString:btn.currentTitle]) {
            inputChoice.selectedIndex = i;
            selected = NO;
          }
        }
        if (selected) {
          inputChoice.selectedIndex = -1;
        }
      } else {
        NSMutableArray *selectedArray = [[NSMutableArray alloc] init];
        if ([btn.currentTitle length] > 0 &&
            (![btn.currentTitle isEqualToString:btn.title])) {
          NSArray *tempArray =
              [btn.currentTitle componentsSeparatedByString:@"|"];
          for (int i = 0; i < [btn.valueArray count]; i++) {
            if ([tempArray count] > 0) {
              for (int j = 0; j < [tempArray count]; j++) {
                if ([[btn.valueArray objectAtIndex:i]
                        isEqualToString:[tempArray objectAtIndex:j]]) {
                  [selectedArray addObject:[NSNumber numberWithInt:i]];
                }
              }
            }
          }
        }
        inputChoice.selectedIndexArray = [selectedArray mutableCopy];
      }

      inputChoice.delegate = self;

      if (self.popOver == nil) {
        self.popOver = [[UIPopoverController alloc]
            initWithContentViewController:leftView];
      } else
        [self.popOver setContentViewController:leftView];

      CGRect aFrame =
          btn.frame;  //[self.tableView rectForRowAtIndexPath:indexPath];

      aFrame.origin.x = btn.frame.origin.x + 10;
      [self.popOver presentPopoverFromRect:aFrame
                                    inView:btn.superview
                  permittedArrowDirections:UIPopoverArrowDirectionRight
                                  animated:YES];
    } break;

    case FieldAmPmImagePicker:
    case FieldImagePicker: {
      self.imagePop = [[ImagePopOver alloc] init];
      self.imagePop.imgPickerPopOver = self.popOver;
      self.imagePop.DelegateBtn = btn;
      self.imagePop.delegate = self;
      [self.imagePop takePhotoBtn_Clicked];

    } break;
    case FieldAmPmInputePop:
    case FieldInputePop: {
      UIStoryboard *mystoryboard =
          [UIStoryboard storyboardWithName:@"Main" bundle:nil];

      UINavigationController *leftView = [mystoryboard
          instantiateViewControllerWithIdentifier:@"TextInputePoppOver"];

      //            TextInputePoppOver *moreView = [leftView.viewControllers
      //            objectAtIndex:0];
      TextInputePoppOver *moreView = [[TextInputePoppOver alloc] init];
      moreView = [leftView.viewControllers objectAtIndex:0];

      moreView.title = @"Enter Text";
      if (btn.title != nil) {
        moreView.TextInpute = btn.title;
      }

      if (btn.entryDataId != nil)
        moreView.entryDataId = btn.entryDataId;

      moreView.DelegateBtn = btn;

      self.popOver =
          [[UIPopoverController alloc] initWithContentViewController:leftView];

      moreView.popOver = popOver;
      moreView.delegate = self;

      [self.popOver presentPopoverFromRect:[sender frame]
                                    inView:btn.superview
                  permittedArrowDirections:UIPopoverArrowDirectionAny
                                  animated:YES];

    } break;

    //        case FieldAmPmImagePicker:
    //        {
    //            self.imagePop = [[ImagePopOver alloc]init];
    //            self.imagePop.imgPickerPopOver=self.popOver;
    //            self.imagePop.DelegateBtn=btn;
    //            //            self.imagePop.
    //            self.imagePop.delegate=self;
    //            [self.imagePop takePhotoBtn_Clicked];
    //        }
    //            break;

    //        case FieldAmPmInputePop:
    //        {
    //
    //            UIStoryboard *mystoryboard = [UIStoryboard
    //            storyboardWithName:@"Main" bundle:nil];
    //
    //            UINavigationController *leftView = [mystoryboard
    //            instantiateViewControllerWithIdentifier:@"TextInputePoppOver"];
    //
    //            TextInputePoppOver *moreView = [leftView.viewControllers
    //            objectAtIndex:0];
    //            moreView.title = @"Enter Text";
    //
    ////            moreView.entryDataId=btn.entryDataId;
    ////            moreView.DelegateBtn=btn;
    //
    //
    //            self.popOver = [[UIPopoverController alloc]
    //            initWithContentViewController:leftView];
    //
    ////            moreView.popOver=self.popOver;
    ////            moreView.delegate=self;
    //
    //            [self.popOver presentPopoverFromRect:[sender frame]
    //            inView:btn.superview.superview
    //            permittedArrowDirections:UIPopoverArrowDirectionAny
    //            animated:YES];
    //
    //
    //        }
    //            break;

    default:
      break;
  }

  // NSLog(@"aaaaaaaaaaaaaa@");
}

//=================================================
/** delegate method MoreViewController Actions */
//=================================================

//- (IBAction)handleMore:(id)sender
//{
//
//    UIButton *btn=(UIButton *)sender;
//    if(self.popOver!=nil)
//    {
//        [self.popOver dismissPopoverAnimated:YES];
//    }
//    UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main"
//    bundle:nil];
//    UINavigationController *leftView = [mystoryboard
//    instantiateViewControllerWithIdentifier:@"MoreViewController"];
//
//    SAMMoreViewController *moreView = [leftView.viewControllers
//    objectAtIndex:0];
//    moreView.delegate = self;
//    moreView.title = @"More";
//
//    self.popOver = [[UIPopoverController alloc]
//    initWithContentViewController:leftView];
//    //[self.popOver presentPopoverFromRect:[sender frame] inView:self.view
//    permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
///*    if(self.view.window!=nil){
//
//        [self.popOver
//        presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem
//        permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
//
//
//    }*/
//     [self.popOver presentPopoverFromRect:[sender frame]
//     inView:btn.superview.superview
//     permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//}

//=============================================================
/** delegate method MoreViewController Popover Done Clicked */
//=============================================================

- (void)doneMoreButton_Clicked {
  [self.popOver dismissPopoverAnimated:YES];
}

//=============================================================
/** delegate method All UISwitch Controlles */
//=============================================================

- (IBAction)TickAction:(id)sender {
  UISwitch *Switch = (UISwitch *)sender;

  if (Switch.on) {
    Switch.superview.backgroundColor =
        [AppDelegate colorWithHexString:@"3755FD"];

  } else {
    Switch.superview.backgroundColor = [UIColor clearColor];
  }

  if (Switch.fieldType == FieldAmPmCheck) {
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components =
        [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit)
                    fromDate:date];
    int hour = (int)[components hour];
    int minute = (int)[components minute];
    NSRange reng =
        [Switch.lbView.text rangeOfString:@"PM" options:NSBackwardsSearch];

    if (Switch.on) {
      if (reng.location == NSNotFound) {
        if (minute > 10)
          Switch.lbView.text =
              [NSString stringWithFormat:@"AM %d:%d", hour, minute];
        else
          Switch.lbView.text =
              [NSString stringWithFormat:@"AM %d:0%d", hour, minute];
      } else {
        if (minute > 10)
          Switch.lbView.text =
              [NSString stringWithFormat:@"PM %d:%d", hour, minute];
        else
          Switch.lbView.text =
              [NSString stringWithFormat:@"PM %d:0%d", hour, minute];
      }

    } else {
      if (reng.location == NSNotFound) {
        Switch.lbView.text = @"AM 00:00";
      } else {
        Switch.lbView.text = @"PM 00:00";
      }
    }

    components = nil;
    date = nil;
    calendar = nil;
  }
}

- (void)doneButton_Clicked:(id)value WithEntry:(NSString *)entry {
  [self.popOver dismissPopoverAnimated:YES];
  if ([value isKindOfClass:[NSString class]]) {
    //  NSLog(@"%@",value);
  } else if ([value isKindOfClass:[NSArray class]]) {
    //    NSLog(@"%@",value);
  }
}

- (void)cancelButton_Clicked {
  [self.popOver dismissPopoverAnimated:YES];
}

//=============================================================
/** delegate method Date Popover Done Clicked
* @param UIPopoverController popover
 * @param NSDate date
 * @param NSString UserEntry ID
*/
//=============================================================

- (void)DoneClicked:(UIPopoverController *)pop
           WithDate:(NSDate *)Date
          WithEntry:(NSString *)Entry {
  // NSLog(@"%@ - date , %@ User Entry ",Date,Entry);

  [pop dismissPopoverAnimated:YES];
}

//=============================================================
/** delegate method Image Popover Done Clicked
 * @param NSString Image URL
 * @param NSString UserEntry ID
 */
//=============================================================

- (void)imageButton_Clicked:(NSString *)value WithEntry:(NSString *)entry {
  // NSLog(@"%@",value);
  // NSLog(@"%@",entry);
}

- (void)CancelClick:(UIPopoverController *)pop {
  [pop dismissPopoverAnimated:YES];
}

/** delegate method Text Popover Done Clicked
 * @param UIPopoverController popover
 * @param NSString String data
 * @param NSString UserEntry ID
 */
- (void)DoneClicked:(UIPopoverController *)pop
           WithText:(NSString *)Data
          WithEntry:(NSString *)Entry {
  // NSLog(@"%@ - date , %@ User Entry ",Date,Entry);

  [pop dismissPopoverAnimated:YES];
}

- (IBAction)SegmentAction:(id)sender {
  UISegmentedControl *seg = (UISegmentedControl *)sender;

  // NSLog(@"%@ - date , %@ User Entry ",seg.entryDataId,[seg
  // titleForSegmentAtIndex:seg.selectedSegmentIndex]);}
}
@end
