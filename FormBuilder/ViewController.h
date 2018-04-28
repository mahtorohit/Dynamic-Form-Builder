//
//  ViewController.h
//  FormBuilder
//
//  Created by Rohit Mahto on 28/04/18.
//  Copyright © 2018 Rohit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "RMFormsCateforyInfo.h"

@interface ViewController : UITableViewController<UISplitViewControllerDelegate,
                                                  UITableViewDelegate,
                                                  UITableViewDataSource> {
  NSString *_selectedCategoryWithId;
}

/**
 * For storing category information of selected form into RMFormsCateforyInfo
 *object
 * @see RMFormsCateforyInfo
 **/

@property (nonatomic, strong) RMFormsCateforyInfo *categoryInfo;
@property (strong, nonatomic) NSString *selectedCategoryWithId;

/**
 * For storing and control information into DataController object
 * @see DataController
 **/
@property (strong, nonatomic) DataController *Datadelegate;
@property (strong, nonatomic) id detailItem;
@property (assign, nonatomic) int ViewX;
@property (weak, nonatomic) IBOutlet UITableView *DataTableView;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
