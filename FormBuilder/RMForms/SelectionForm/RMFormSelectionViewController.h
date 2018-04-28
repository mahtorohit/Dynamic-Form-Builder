//
//  RMFormselectionViewController.h
//  RMForms
//
//  Created by ROHIT on 11/02/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

/**
 * RMFormselectionViewController define a class that selection of form in
 *cluster view.
 **/

#import <UIKit/UIKit.h>
#import "LoginPopDelegate.h"

@interface RMFormselectionViewController
    : UIViewController<UICollectionViewDataSource,
                       UICollectionViewDelegate,
                       LoginPopDelegate> {
 @private
  int index;
}

/**
 * Store number of forms in a array
 **/
@property (strong, nonatomic) NSArray *Forms;
@property (weak, nonatomic) IBOutlet UICollectionView *FormCollection;
@property (nonatomic, strong) UIPopoverController *popOver;
@end
