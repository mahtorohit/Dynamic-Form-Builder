//
//  ImagePopOver.m
//  DynamicFormGenerator
//
//  Created by Siddharth on 2/25/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import "ImagePopOver.h"
#import "DejalActivityView.h"
#import "UIImage+Resize.h"
#import "UIButton+Extra.h"

#define kActionSheetFrame CGRectMake(0, 0, 320, 490)
#define imageScaleSize CGSizeMake(1024, 768)

@interface ImagePopOver ()

@end

@implementation ImagePopOver

@synthesize DelegateBtn, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  //[self takePhotoBtn_Clicked];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picking Image Part

//=================================================
/** Clicked on take or select photo */
//=================================================

- (void)takePhotoBtn_Clicked {
  // self.DelegateBtn = [sender tag];

  UIButton *btn = self.DelegateBtn;
  if (btn != nil) {
    CGRect aFrame = btn.frame;
    aFrame.origin.x = btn.frame.origin.x + 10;
    if ([btn imageForState:UIControlStateNormal] != nil) {
      if ([UIImagePickerController
              isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *sheet = [[UIActionSheet alloc]
                     initWithTitle:@"Select"
                          delegate:self
                 cancelButtonTitle:@"Cancel"
            destructiveButtonTitle:@"Delete"
                 otherButtonTitles:@"Take Photo", @"Choose from library", nil];
        [sheet showFromRect:aFrame inView:btn.superview animated:YES];
      } else {
        UIActionSheet *sheet =
            [[UIActionSheet alloc] initWithTitle:@"Select"
                                        delegate:self
                               cancelButtonTitle:@"Cancel"
                          destructiveButtonTitle:@"Delete"
                               otherButtonTitles:@"Choose from library", nil];
        [sheet showFromRect:aFrame inView:btn.superview animated:YES];
      }
    } else {
      if ([UIImagePickerController
              isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *sheet = [[UIActionSheet alloc]
                     initWithTitle:@"Select"
                          delegate:self
                 cancelButtonTitle:@"Cancel"
            destructiveButtonTitle:nil
                 otherButtonTitles:@"Take Photo", @"Choose from library", nil];
        [sheet showFromRect:aFrame inView:btn.superview animated:YES];
      } else

      {
        UIActionSheet *sheet =
            [[UIActionSheet alloc] initWithTitle:@"Select"
                                        delegate:self
                               cancelButtonTitle:@"Cancel"
                          destructiveButtonTitle:nil
                               otherButtonTitles:@"Choose from library", nil];
        [sheet showFromRect:aFrame inView:btn.superview animated:YES];
      }
    }
  }
}
//=================================================
/** Actionsheet delegate method user selected option */
//=================================================

- (void)actionSheet:(UIActionSheet *)actionSheet
    clickedButtonAtIndex:(NSInteger)buttonIndex {
  UIButton *btn = self.DelegateBtn;

  if ([[actionSheet buttonTitleAtIndex:buttonIndex]
          isEqualToString:@"Delete"]) {
    if (btn != nil) {
      [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
      [btn setContentMode:UIViewContentModeScaleAspectFit];
      [btn setClipsToBounds:YES];

      // border radius
      [btn.layer setCornerRadius:0.0f];

      // border
      //[ImgBtn.layer setBorderColor:[UIColor blackColor].CGColor];
      [btn.layer setBorderWidth:0.0f];

      // drop shadow
      //            [ImgBtn.layer setShadowColor:[UIColor blackColor].CGColor];
      //            [ImgBtn.layer setShadowOpacity:0.8];
      [btn.layer setShadowRadius:0.0];
      [btn.layer setShadowOffset:CGSizeMake(0.0, 0.0)];
      [btn.layer setMasksToBounds:YES];

      [self.delegate imageButton_Clicked:@""
                               WithEntry:self.DelegateBtn.entryDataId];
    }
  } else if ([[actionSheet buttonTitleAtIndex:buttonIndex]
                 isEqualToString:@"Take Photo"]) {
    // Take photo selected
    [self
        presentUIImagePickerController:UIImagePickerControllerSourceTypeCamera];
  } else if ([[actionSheet buttonTitleAtIndex:buttonIndex]
                 isEqualToString:@"Choose from library"]) {
    // Use existing selected
    [self presentUIImagePickerController:
              UIImagePickerControllerSourceTypePhotoLibrary];
  }
}

//=================================================
// Show image picker
// Accept parameter source type as SourceTypeCamera | SourceTypePhotoLibrary
//=================================================

- (void)done_Clicked {
  [self.imgPickerPopOver dismissPopoverAnimated:YES];
}

- (void)presentUIImagePickerController:
    (UIImagePickerControllerSourceType)sourcetype {
  UIButton *btn = self.DelegateBtn;
  if (btn != nil) {
    UIImagePickerController *imagePickerController =
        [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = sourcetype;
    imagePickerController.preferredContentSize = CGSizeMake(320, 250);
    //        [imagePickerController setShowsCameraControls:NO];
    UINavigationController *bar = imagePickerController.navigationController;
    //[bar setHidden:NO];
    bar.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                         style:UIBarButtonSystemItemDone
                                        target:self
                                        action:@selector(done_Clicked)];

    if (self.imgPickerPopOver != nil)
      [self.imgPickerPopOver setContentViewController:imagePickerController];
    else
      self.imgPickerPopOver = [[UIPopoverController alloc]
          initWithContentViewController:imagePickerController];
    if (sourcetype == UIImagePickerControllerSourceTypeCamera) {
      CGFloat scaleFactor = 1.3f;

      switch ([UIApplication sharedApplication].statusBarOrientation) {
        case UIInterfaceOrientationLandscapeLeft:

          imagePickerController.cameraViewTransform = CGAffineTransformScale(
              CGAffineTransformMakeRotation(M_PI * 90 / 180.0), scaleFactor,
              scaleFactor);

          break;

        case UIInterfaceOrientationLandscapeRight:

          imagePickerController.cameraViewTransform = CGAffineTransformScale(
              CGAffineTransformMakeRotation(M_PI * -90 / 180.0), scaleFactor,
              scaleFactor);

          break;

        case UIInterfaceOrientationPortraitUpsideDown:

          imagePickerController.cameraViewTransform =
              CGAffineTransformMakeRotation(M_PI * 180 / 180.0);

          break;

        default:
          break;
      }
    }

    // if(self.contentView.window!=nil)
    {
      //            if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
      //                [self.contentView
      //                presentViewController:imagePickerController animated:YES
      //                completion:nil];
      //            }
      //            else
      {
        CGRect aFrame = btn.frame;
        aFrame.origin.x = btn.frame.origin.x + 10;
        [self.imgPickerPopOver presentPopoverFromRect:aFrame
                                               inView:btn.superview
                             permittedArrowDirections:UIPopoverArrowDirectionAny
                                             animated:YES];
      }
    }
  }
}

//=================================================
// Camera Picker delegate method user has selected Photo/Take Photo
//=================================================
- (void)imagePickerController:(UIImagePickerController *)picker
    didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
  //  NSLog(@"In imagePickerController didFinishPickingMediaWithInfo");
  UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
  [picker dismissViewControllerAnimated:YES completion:nil];
  picker = nil;

  // Managing image size
  [DejalBezelActivityView activityViewForView:self.DelegateBtn
                                    withLabel:@"Saving Image..."];
  //    UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
  //    [DejalBezelActivityView activityViewForView:window withLabel:@"Saving
  //    Image..."];
  //[DejalActivityView
  //activityViewForView:window].showNetworkActivityIndicator=YES;
  __block NSString *pathImage = @"";
  //    dispatch_async(dispatch_queue_create("SearchQueue", 0), ^{
  //        pathImage=[self savingPicture:image];
  //    });

  dispatch_async(dispatch_get_global_queue(0, 0), ^{
    pathImage = [self savingPicture:image];

    dispatch_async(dispatch_get_main_queue(), ^{
      // NSLog(@" lol:%@",pathImage);
      [self.imgPickerPopOver dismissPopoverAnimated:YES];
      [self.delegate imageButton_Clicked:pathImage
                               WithEntry:self.DelegateBtn.entryDataId];
    });
  });
}

// Saving image
- (NSString *)savingPicture:(UIImage *)image {
  @autoreleasepool {
    UIImage *newImage = [self resizeImage:image];
    NSString *pathImage = [self pathForSavedImage:newImage];

    dispatch_async(dispatch_get_main_queue(), ^{

      @autoreleasepool {
        UIButton *btn = self.DelegateBtn;

        if (btn != nil) {
          [btn setImage:newImage forState:UIControlStateNormal];
          [btn setContentMode:UIViewContentModeScaleAspectFill];
          [btn setClipsToBounds:YES];

          // border radius
          [btn.layer setCornerRadius:6.0f];

          // border
          //[ImgBtn.layer setBorderColor:[UIColor blackColor].CGColor];
          [btn.layer setBorderWidth:0.5f];

          // drop shadow
          //            [ImgBtn.layer setShadowColor:[UIColor
          //            blackColor].CGColor];
          //            [ImgBtn.layer setShadowOpacity:0.8];
          [btn.layer setShadowRadius:3.0];
          [btn.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
          [btn.layer setMasksToBounds:YES];
        }

        [DejalBezelActivityView removeViewAnimated:YES];
        //  [DejalActivityView removeView];
      }
    });
    return pathImage;
  }
  return @"";
}

//=================================================
// Save image and return path of saved image
//=================================================

- (NSString *)pathForSavedImage:(UIImage *)image {
  NSString *imageName =
      [NSString stringWithFormat:@"Image_%@.jpg", self.DelegateBtn.entryDataId];
  // NSString* imageName =[NSString stringWithFormat:@"Image1_1_1.jpg"];

  // Delete if image already exists
  [self deleteExistingImage:imageName];

  NSData *imageData = UIImageJPEGRepresentation(image, 1.0);

  if (imageData.length > 0) {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    // Now we get the full path to the file
    NSString *fullPathToFile =
        [documentsDirectory stringByAppendingPathComponent:imageName];

    // and then we write it out
    [imageData writeToFile:fullPathToFile atomically:NO];

    return fullPathToFile;
  }

  return @"";
}

//=================================================
// Delete saved photo from documents directory
// Accepts parameter image name if file exists, delets file
//=================================================

- (void)deleteExistingImage:(NSString *)imageName {
  if ([self isPhotoAvailableWithName:imageName]) {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    // Now we get the full path to the file
    NSString *fullPathToFile =
        [documentsDirectory stringByAppendingPathComponent:imageName];

    NSError *error;
    [[NSFileManager defaultManager]
        removeItemAtURL:[NSURL fileURLWithPath:fullPathToFile]
                  error:&error];
  }
}

- (BOOL)isPhotoAvailableWithName:(NSString *)name {
  // If already image added
  NSString *imageName = name;

  // get document directory path
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                       NSUserDomainMask, YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];

  // Now we get the full path to the file
  NSString *fullPathToFile =
      [documentsDirectory stringByAppendingPathComponent:imageName];

  // if file already available give option to delete file
  if ([[NSFileManager defaultManager] fileExistsAtPath:fullPathToFile]) {
    return YES;
  }

  return NO;
}

//=================================================
// Resizing image size selected 1024x768
// Request parameter source image returns size adjusted image
//=================================================

- (UIImage *)resizeImage:(UIImage *)sourceImage {
  CGSize scaleSize;
  if (sourceImage.size.width > imageScaleSize.width &&
      sourceImage.size.width > imageScaleSize.height) {
    scaleSize = imageScaleSize;

    if (sourceImage.size.height > sourceImage.size.width) {
      scaleSize = CGSizeMake(imageScaleSize.height, imageScaleSize.width);
    }
  } else {
    scaleSize = sourceImage.size;
  }

  return [sourceImage resizedImage:scaleSize interpolationQuality:1.0];
}

@end
