//
//  TextInputePoppOver.m
//  DynamicFormGenerator
//
//  Created by ROHIT on 2/25/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import "TextInputePoppOver.h"

@interface TextInputePoppOver ()

@end

@implementation TextInputePoppOver
@synthesize entryDataId, popOver, DelegateBtn;
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

  if (self.TextInpute != nil) {
    self.textValue.text = self.TextInpute;
  }
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

/**
 * Set comment image based on a length of text
 **/
- (void)DoneDate {
  if ((self.textValue.text.length != 0) &&
      ![self.textValue.text isEqualToString:@" "]) {
    self.DelegateBtn.title = self.textValue.text;
    [self.DelegateBtn setImage:[UIImage imageNamed:@"comment1.png"]
                      forState:UIControlStateNormal];
  } else {
    self.DelegateBtn.title = @"";
    [self.DelegateBtn setImage:[UIImage imageNamed:@"comment.png"]
                      forState:UIControlStateNormal];
  }
  [self.delegate DoneClicked:(UIPopoverController *)self.popOver
                    WithText:self.textValue.text
                   WithEntry:self.entryDataId];
}

/**
 * Removes pop over from view
 **/
- (void)CancelDate {
  [self.delegate CancelClick:self.popOver];
}

@end
