//
//  DataController.h
//  DynamicForms
//
//  Created by ROHIT on 20/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DateChangeListener.h"
#import "DataSelectListener.h"
#import "ImagePopOver.h"
#import "ImageChangeListener.h"
#import "UIButton+Extra.h"
#import "DataPopOver.h"
#import "DatePopOver.h"
#import "ImagePopOver.h"
#import "TextInputePoppOver.h"
#import "UISegmentedControl+Extra.h"
#import "UISwitch+Extra.h"
#import "TextInputeChangeListener.h"

@interface DataController : NSObject<UITextFieldDelegate,
                                     UITextViewDelegate,
                                     DateChangeListener,
                                     DataSelectListener,
                                     TextInputeChangeListener,
                                     ImageChangeListener>
@property (nonatomic, strong) UIPopoverController *popOver;
@property (nonatomic, strong) ImagePopOver *imagePop;
@property (nonatomic, strong) TextInputePoppOver *TextPop;
- (IBAction)ButtonAction:(id)sender;

- (IBAction)SegmentAction:(id)sender;
- (IBAction)TickAction:(id)sender;
- (IBAction)handleMore:(id)sender;

@end
