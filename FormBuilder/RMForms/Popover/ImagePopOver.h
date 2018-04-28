//
//  ImagePopOver.h
//  DynamicFormGenerator
//
//  Created by Siddharth on 2/25/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageChangeListener.h"

/**
 * ImagePopOver shows pop over with a image picker.
 **/
@interface ImagePopOver : UIViewController<UIImagePickerControllerDelegate,
                                           UINavigationControllerDelegate,
                                           UIActionSheetDelegate>

@property (strong, nonatomic) UIButton *DelegateBtn;
@property (nonatomic, strong) UIPopoverController *imgPickerPopOver;
@property (nonatomic, strong) id<ImageChangeListener> delegate;

- (void)takePhotoBtn_Clicked;

@end
