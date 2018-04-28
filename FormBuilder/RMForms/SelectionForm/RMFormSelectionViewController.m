//
//  RMFormselectionViewController.m
//  RMForms
//
//  Created by ROHIT on 11/02/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import "RMFormselectionViewController.h"
#import "FormHolder.h"
#import "FormParser.h"
#import "FormParserV1.h"
#import "AppDelegate.h"

@interface RMFormselectionViewController ()

@end

@implementation RMFormselectionViewController

//  @ Initialise Form array

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization

    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    self.Forms = del.FormArray;
  }
  return self;
}
- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  AppDelegate *del = [[UIApplication sharedApplication] delegate];
  self.Forms = del.FormArray;

  // self.navigationController.navigationBar.topItem.title = @"Select Form";
  [self.navigationController.navigationItem setTitle:@"Select Form"];
  [self.navigationController setNavigationBarHidden:NO];

  self.navigationController.toolbar.translucent = NO;
  self.navigationController.toolbar.hidden = NO;

  // method 1
  // [self setToolbarItems:[NSArray arrayWithObjects: button1, nil]
  // animated:YES];
  self.navigationController.toolbar.barTintColor =
      [AppDelegate colorWithHexString:@"0e96dc"];
  self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
  self.navigationController.navigationBar.barTintColor =
      [AppDelegate colorWithHexString:@"0e96dc"];

  self.navigationController.toolbar.barTintColor = [UIColor blackColor];

  [self.navigationController.navigationBar setTitleTextAttributes:@{
    NSForegroundColorAttributeName : [UIColor whiteColor],
    NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:25]
  }];

  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 700, 44)];

  UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(450, 0, 240, 15)];
  lbl.font = [UIFont systemFontOfSize:12];
  lbl.textColor = [UIColor whiteColor];
  lbl.text = @"Last Login : 02/21/2017 11:11 pm";

  UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(450, 25, 240, 15)];
  lbl1.font = [UIFont systemFontOfSize:12];
  lbl1.textColor = [UIColor whiteColor];

  lbl1.text = @"Last Sync : 02/21/2017 11:11 pm";

  [view addSubview:lbl];
  [view addSubview:lbl1];
  //  NSArray *item1 =[[NSArray alloc] initWithObjects:lbl,lbl1, nil];

  UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:view];

  // [self.navigationController.toolbar add]
  [self setToolbarItems:[NSArray arrayWithObjects:btn, nil] animated:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return self.Forms.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  FormHolder *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:@"FormHolder"
                                                forIndexPath:indexPath];
  cell.FormImage.image = [UIImage imageNamed:@"icon-4.png"];

  cell.FormLable.text =
      [[self.Forms objectAtIndex:indexPath.row] objectForKey:@"FormName"];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  index = (int)indexPath.row;

  [self.popOver dismissPopoverAnimated:YES];
  [self inspectionAddUpdateSelectedwithForm:[[self.Forms
                                                objectAtIndex:indexPath.row]
                                                objectForKey:@"FormName"]];
}

//=================================================
/**
 * Inspect Selected form
 * @return Form = Name of form
 **/
//=================================================

- (void)inspectionAddUpdateSelectedwithForm:(NSString *)Form {
  NSMutableArray *formArray = [[NSMutableArray alloc] init];

  FormParserV1 *parser = [[FormParserV1 alloc] init];
  formArray = [parser GetDataFromJson:Form];

  AppDelegate *appDelegate =
      (AppDelegate *)[[UIApplication sharedApplication] delegate];

  appDelegate.navigationCon = self.navigationController;

  UISplitViewController *split = [self.storyboard
      instantiateViewControllerWithIdentifier:@"SplitViewController"];

  NSMutableArray *views = [[split viewControllers] mutableCopy];

  UINavigationController *navCon = [views objectAtIndex:0];
}

@end
