//
//  SAMInputChoiceViewController.m
//  SAM
//
//  Created by Prasad Potale on 28/05/13.
//  Copyright (c) 2013 KAHUNA. All rights reserved.
//

#import "DataPopOver.h"
#import "GlobalConstants.h"
#import "UIButton+Extra.h"
#define kOtherDescMaxChar 32

@interface DataPopOver ()

@end

@implementation DataPopOver
@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
    self.navigationController.navigationBar.barTintColor =
        [UIColor blueColor];  //[appDelegate colorWithHexString:themeColor];

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    [self.navigationController.navigationBar setTitleTextAttributes:@{
      NSForegroundColorAttributeName : [UIColor whiteColor]
    }];

    self.navigationController.navigationBar.translucent = NO;
  }

  self.navigationItem.rightBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                       style:UIBarButtonItemStyleDone
                                      target:self
                                      action:@selector(done_Clicked)];

  self.navigationItem.leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                       style:UIBarButtonItemStyleDone
                                      target:self
                                      action:@selector(cancel_Clicked)];

  // self.navigationItem.rightBarButtonItem.enabled = FALSE;
  [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
  [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
  int height = 0;

  int count = (int)[self.valuesArray count];
  height = height + count * 44;

  if (height > 600)
    height = 600;

  self.preferredContentSize = CGSizeMake(320, height);
  if (self.selectedIndex == -1) {
    //[self.navigationItem.rightBarButtonItem setEnabled:NO];
  }
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:
    (UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationLandscapeRight ||
          interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

#pragma mark--
#pragma mark Tableview Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
  //     if(self.valuesArrayForSection1!=nil)
  //         return 2;

  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  if (section == 0)
    return [self.valuesArray count];
  //    else if(section == 1)
  //        return [self.valuesArrayForSection1 count];

  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSArray *tempArray;

  if (indexPath.section == 0)
    tempArray = self.valuesArray;

  UITableViewCell *cell;

  NSString *cellIdentifier = @"TitleCell";

  {
    cellIdentifier = @"TitleCell";

    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")) {
      cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                             forIndexPath:indexPath];
    } else {
      cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
  }

  UILabel *titleLbl = (UILabel *)[cell viewWithTag:1];

  titleLbl.text = [tempArray objectAtIndex:indexPath.row];

  if (!self.isMultiSelection) {
    if (self.selectedIndex == indexPath.row) {
      cell.accessoryView = [[UIImageView alloc]
          initWithImage:[UIImage imageNamed:@"tick_clicked.png"]];
      titleLbl.textColor = [UIColor colorWithRed:62.0 / 255.0
                                           green:100.0 / 255.0
                                            blue:182.0 / 255.0
                                           alpha:1.0];
      self.selectedIndex = indexPath.row;
      self.selectedSection = indexPath.section;
    } else {
      cell.accessoryView = [[UIImageView alloc]
          initWithImage:[UIImage imageNamed:@"tick_unclicked.png"]];
      titleLbl.textColor = [UIColor blackColor];
    }
  } else {
    cell.accessoryView = [[UIImageView alloc]
        initWithImage:[UIImage imageNamed:@"tick_unclicked.png"]];
    titleLbl.textColor = [UIColor blackColor];
    for (int i = 0; i < [self.selectedIndexArray count]; i++) {
      NSNumber *indexSelected = [self.selectedIndexArray objectAtIndex:i];
      if ([indexSelected
              isEqualToNumber:[NSNumber numberWithInt:(int)indexPath.row]]) {
        cell.accessoryView = [[UIImageView alloc]
            initWithImage:[UIImage imageNamed:@"tick_clicked.png"]];
        titleLbl.textColor = [UIColor colorWithRed:62.0 / 255.0
                                             green:100.0 / 255.0
                                              blue:182.0 / 255.0
                                             alpha:1.0];
        // self.selectedIndex = indexPath.row;
        self.selectedSection = indexPath.section;
      }
    }
  }

  cell.selectionStyle = UITableViewCellSelectionStyleNone;

  return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSArray *tempArray;

  if (indexPath.section == 0)
    tempArray = self.valuesArray;
  if (!self.isMultiSelection) {
    if (self.selectedIndex == indexPath.row &&
        self.selectedSection == indexPath.section) {
      self.selectedIndex = -1;
      self.selectedSection = -1;
      //[self.navigationItem.rightBarButtonItem setEnabled:NO];
    } else {
      [self.navigationItem.rightBarButtonItem setEnabled:YES];
      self.selectedIndex = indexPath.row;
      self.selectedSection = indexPath.section;
    }
  } else if (self.isMultiSelection) {
    BOOL selected = YES;
    for (int i = 0; i < [self.selectedIndexArray count]; i++) {
      NSNumber *indexSelected = [self.selectedIndexArray objectAtIndex:i];
      if ([indexSelected
              isEqualToNumber:[NSNumber numberWithInt:(int)indexPath.row]] &&
          self.selectedSection == indexPath.section) {
        [self.selectedIndexArray removeObjectAtIndex:i];
        selected = NO;
      }
    }
    if (selected) {
      [self.selectedIndexArray
          addObject:[NSNumber numberWithInt:(int)indexPath.row]];
    }
    self.selectedSection = indexPath.section;
  }

  [self.tableView reloadData];
}

/**
 * Set number of selected values in a label if isMultiSelection is enabled
 * or Set single selected values in a label
 **/
- (void)done_Clicked {
  NSArray *tempArray;

  if (self.selectedSection == 0)
    tempArray = self.valuesArray;
  if (!self.isMultiSelection) {
    id value =
        [self doneButton_Clicked:[NSNumber numberWithInt:self.selectedIndex]
                           value:nil];
    if ([value isKindOfClass:[NSString class]]) {
      [self.delegate doneButton_Clicked:value
                              WithEntry:self.DelegateBtn.entryDataId];
    }
  } else if (self.isMultiSelection) {
    if ([self.selectedIndexArray count] > 0) {
      id value =
          [self doneButton_Clicked:[[NSArray alloc]
                                       initWithArray:self.selectedIndexArray]
                             value:nil];
      if ([value isKindOfClass:[NSArray class]]) {
        [self.delegate doneButton_Clicked:value
                                WithEntry:self.DelegateBtn.entryDataId];
      }
    } else {
      self.selectedIndex = -1;
      id value =
          [self doneButton_Clicked:[NSNumber numberWithInt:self.selectedIndex]
                             value:nil];
      if ([value isKindOfClass:[NSString class]]) {
        [self.delegate doneButton_Clicked:value
                                WithEntry:self.DelegateBtn.entryDataId];
      }
    }
  }
}

/**
 * Remove pop over from view
 **/
- (void)cancel_Clicked {
  [self.delegate cancelButton_Clicked];
}

#pragma mark--
#pragma mark TextField Delegate source
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
  if (self.selectedIndex >= 0) {
    UITableViewCell *cell = [self.tableView
        cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectedIndex
                                                 inSection:0]];
    cell.accessoryView = [[UIImageView alloc]
        initWithImage:[UIImage imageNamed:@"tick_unclicked.png"]];

    UILabel *title = (UILabel *)[cell viewWithTag:1];
    [title setTextColor:[UIColor blackColor]];
  }

  UITableViewCell *cell = [self.tableView
      cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.otherCellIndex
                                               inSection:0]];
  cell.accessoryView = [[UIImageView alloc]
      initWithImage:[UIImage imageNamed:@"tick_clicked.png"]];
  UILabel *title = (UILabel *)[cell viewWithTag:1];
  [title setTextColor:[UIColor colorWithRed:62.0 / 255.0
                                      green:100.0 / 255.0
                                       blue:182.0 / 255.0
                                      alpha:1.0]];

  self.selectedIndex = self.otherCellIndex;

  self.selectedSection = 0;

  return YES;
}

- (BOOL)textField:(UITextField *)textField
    shouldChangeCharactersInRange:(NSRange)range
                replacementString:(NSString *)string {
  NSUInteger newLength =
      [textField.text length] + [string length] - range.length;
  return (newLength > kOtherDescMaxChar) ? NO : YES;
}

/**
 * Set selected values in a label
 * @param selectedRow = it can be single number or array
 * @param selectedValue = value in a string format
 **/
- (id)doneButton_Clicked:(id)selectedRow value:(NSString *)selectedValue {
  if ([selectedRow isKindOfClass:[NSNumber class]]) {
    if ([selectedRow intValue] == -1) {
      [self.DelegateBtn setTitle:@"" forState:UIControlStateNormal];
      return @"";
    } else {
      // self.valueLblField.text=[self.cellData.valuesArray
      // objectAtIndex:selectedRow];
      [self.DelegateBtn
          setTitle:[self.valuesArray objectAtIndex:[selectedRow intValue]]
          forState:UIControlStateNormal];
      /*if (selectedValue!=nil) {
          if ([selectedValue length]>0) {
              //self.valueLblField.text=selectedValue;
              [self.DelegateBtn setTitle:selectedValue
      forState:UIControlStateNormal];
          }
      }*/
      return [self.valuesArray objectAtIndex:[selectedRow intValue]];
    }
  } else if ([selectedRow isKindOfClass:[NSArray class]]) {
    NSArray *tempArray = [[NSArray alloc] initWithArray:selectedRow];
    NSString *str = @"";
    if ([tempArray count] > 0) {
      NSNumber *index = [tempArray objectAtIndex:0];
      str = [self.valuesArray objectAtIndex:[index intValue]];
      for (int i = 1; i < [tempArray count]; i++) {
        NSNumber *index = [tempArray objectAtIndex:i];
        str = [str stringByAppendingString:@"|"];
        str = [str stringByAppendingString:[self.valuesArray
                                               objectAtIndex:[index intValue]]];
      }
      [self.DelegateBtn setTitle:str forState:UIControlStateNormal];
    }
    return tempArray;
  }
  return nil;
}

@end
