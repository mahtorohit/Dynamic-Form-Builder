//
//  DataPopOver.h
//  DynamicFormGenerator
//
//  Created by Siddharth on 2/24/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

/**
 * DataPopOver shows data in a table format to select single or multiple values.
 **/

#import <UIKit/UIKit.h>
#import "DataSelectListener.h"

@interface DataPopOver : UITableViewController

@property (nonatomic, strong) id<DataSelectListener> delegate;

/**
 * valuesArray contains values in an array.
 **/
@property (nonatomic, strong) NSArray *valuesArray;

@property (nonatomic, assign) int selectedIndex;

@property (nonatomic, assign) int selectedSection, otherCellIndex;

/**
 * isMultiSelection contains boolean value.
 **/
@property (nonatomic, assign) BOOL isMultiSelection;

@property (nonatomic, strong) NSString *otherCellString;

/**
 * selectedIndexArray contains selected values in an array.
 **/
@property (nonatomic, strong) NSMutableArray *selectedIndexArray;

@property (weak, nonatomic) UIButton *DelegateBtn;

@end
