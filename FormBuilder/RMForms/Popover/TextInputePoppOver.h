//
//  TextInputePoppOver.h
//  DynamicFormGenerator
//
//  Created by ROHIT on 2/25/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

/**
 * TextInputePoppOver shows description in a pop over.
 **/

#import <UIKit/UIKit.h>
#import "UIButton+Extra.h"
@interface TextInputePoppOver : UIViewController

@property (weak, nonatomic) id<TextInputeChangeListener> delegate;
@property (weak, nonatomic) UIButton *DelegateBtn;
@property (strong, nonatomic) UIPopoverController *popOver;
@property (nonatomic, strong) NSString *entryDataId;
@property (nonatomic, strong) NSString *TextInpute;
@property (weak, nonatomic) IBOutlet UITextView *textValue;

@end
