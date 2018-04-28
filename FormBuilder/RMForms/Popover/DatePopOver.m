//
//  DatePopOver.m
//  DynamicFormGenerator
//
//  Created by ROHIT on 24/02/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import "DatePopOver.h"
#import "UIButton+Extra.h"

@interface DatePopOver ()

@end

@implementation DatePopOver
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewWillAppear:(BOOL)animated {
  self.navigationItem.leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                       style:UIBarButtonItemStyleDone
                                      target:self
                                      action:@selector(CancelDate)];

  self.navigationItem.rightBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                       style:UIBarButtonItemStyleDone
                                      target:self
                                      action:@selector(DoneDate)];

  [self.DatePicker setMaximumDate:self.maxDate];
  [self.DatePicker setMinimumDate:self.minDate];
}
- (void)viewDidLoad {
  [super viewDidLoad];

  self.preferredContentSize = CGSizeMake(320, 200);

  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)DeleteClicked:(id)sender {
}

/**
 * Set Selected date in a label
 **/
- (void)DoneDate {
  [self.DelegateBtn
      setTitle:[NSString stringWithFormat:@"%@", self.DatePicker.date]
      forState:UIControlStateNormal];
  [self.delegate DoneClicked:(UIPopoverController *)self.popOver
                    WithDate:self.DatePicker.date
                   WithEntry:self.entryDataId];
}

/**
 * Remove a popover from view
 **/
- (void)CancelDate {
  [self.delegate CancelClick:self.popOver];
}
@end
