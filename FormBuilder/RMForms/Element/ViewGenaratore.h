//
//  ViewGenaratore.h
//  DynamicForms
//
//  Created by ROHIT on 20/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ElementDetails.h"
#import "DataController.h"
#import "UIButton+Extra.h"
#import "UISwitch+Extra.h"
#import "UITextField+Extra.h"
#import "UITextView+Extra.h"
#import "UISegmentedControl+Extra.h"
@interface ViewGenaratore : NSObject

@property (strong, nonatomic) DataController *Datadelegate;

- (UIView *)GetViewFromElement:(ElementDetails *)element Xposition:(int)Xpos;
@end
