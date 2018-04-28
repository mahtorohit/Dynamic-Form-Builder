//
//  DatePopOver.h
//  DynamicFormGenerator
//
//  Created by ROHIT on 24/02/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

/**
 * DatePopOver shows date picker in a pop over.
 **/

#import <UIKit/UIKit.h>
//#import "UIPopoverController+Extra.h"
//#import "DateChangeListener.h"

@interface DatePopOver : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *DatePicker;

@property (weak, nonatomic) IBOutlet UIButton *BtnDelete;
@property (weak, nonatomic) id<DateChangeListener> delegate;
@property (weak, nonatomic) UIButton *DelegateBtn;
@property (strong, nonatomic) UIPopoverController *popOver;
@property (nonatomic, strong) NSString *entryDataId;
@property (nonatomic, strong) NSDate *minDate;
@property (nonatomic, strong) NSDate *maxDate;
- (IBAction)DeleteClicked:(id)sender;

@end
