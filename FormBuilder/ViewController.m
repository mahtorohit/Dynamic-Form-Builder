//
//  ViewController.m
//  FormBuilder
//
//  Created by Rohit Mahto on 28/04/18.
//  Copyright © 2018 Rohit Mahto. All rights reserved.
//

#import "ViewController.h"
#import "RMFormsInfo.h"
#import "RMFormsRowInfo.h"
#import "ElementDetails.h"
#import "ViewGenaratore.h"
#import "AppDelegate.h"
#import "FormParserV1.h"

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.

  NSMutableArray *formArray = [[NSMutableArray alloc] init];
  FormParserV1 *parser = [[FormParserV1 alloc] init];
  formArray = [parser GetDataFromJson:@"formv1"];

  AppDelegate *appDelegate =
      (AppDelegate *)[[UIApplication sharedApplication] delegate];
  self.Datadelegate = [[DataController alloc] init];
  appDelegate.formArray = formArray;
  if ([appDelegate.formDataArray count] > 0) {
    RMFormsInfo *formInfo = [[RMFormsInfo alloc] init];
    formInfo = [appDelegate.formDataArray objectAtIndex:0];
    self.navigationItem.title = formInfo.formTitle;
    int i;
    int selectedForm;
    for (i = 0; i < [formInfo.elementsArrayWithId count]; i++) {
      RMFormsCateforyInfo *tempCategoryInfo =
          [formInfo.elementsArrayWithId objectAtIndex:i];
      if ([tempCategoryInfo.categoryId
              isEqualToString:self.selectedCategoryWithId]) {
        selectedForm = i;
        self.categoryInfo = [formInfo.categoryArray objectAtIndex:selectedForm];
        self.navigationItem.title = self.categoryInfo.categoryTitle;
        self.categoryInfo =
            [formInfo.elementsArrayWithId objectAtIndex:selectedForm];
        break;
      }
    }
    if (i == [formInfo.elementsArrayWithId count]) {
      selectedForm = 0;
      self.categoryInfo = [formInfo.categoryArray objectAtIndex:selectedForm];
      self.navigationItem.title = self.categoryInfo.categoryTitle;
      self.categoryInfo =
          [formInfo.elementsArrayWithId objectAtIndex:selectedForm];
    }
  }

  [self.DataTableView reloadData];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController
     willHideViewController:(UIViewController *)viewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)popoverController {
  barButtonItem.title = NSLocalizedString(@"Master", @"Master");
  [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
  //    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController
       willShowViewController:(UIViewController *)viewController
    invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
  // Called when the view is shown again in the split view, invalidating the
  // button and popover controller.
  [self.navigationItem setLeftBarButtonItem:nil animated:YES];
  //    self.masterPopoverController = nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  //   NSLog(@"%d",indexPath.row);
  UITableViewCell *cell;

  NSString *cellID = [NSString stringWithFormat:@"Cell%d", (int)indexPath.row];

  cell = [tableView dequeueReusableCellWithIdentifier:cellID];

  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:cellID];
    cell.frame = CGRectMake(0, 0, 703, 44);

    NSArray *dic = [[NSArray alloc] init];
    if ([self.categoryInfo.rowsInSectionArray count] > 0) {
      RMFormsRowInfo *rowInfo = [[RMFormsRowInfo alloc] init];
      rowInfo = [self.categoryInfo.rowsInSectionArray
          objectAtIndex:indexPath.section];
      // dic= [rowInfo.elementInfoArray objectForKey:[NSNumber
      // numberWithInteger:indexPath.row+1]];
      dic = [rowInfo.elementInfoArray
          objectForKey:[NSString stringWithFormat:@"Row%d", indexPath.row]];

      int height = 0;
      if (dic != nil) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];

        for (ElementDetails *el in dic) {
          [arr addObject:[NSNumber numberWithInteger:el.hight]];
        }
        if (arr == nil) {
          height = 44;
        } else {
          NSNumber *max = [arr valueForKeyPath:@"@max.intValue"];
          // NSLog(@" hhhttt %d",[max intValue]);
          height = (int)[max integerValue];
        }

      } else {
        height = 44;
      }

      if (dic != nil) {
        int Xpos = 0;
        for (int i = 0; i < [dic count]; i++) {
          ElementDetails *el = [dic objectAtIndex:i];
          ViewGenaratore *genatratore = [[ViewGenaratore alloc] init];
          genatratore.Datadelegate = self.Datadelegate;
          UIView *view = [genatratore GetViewFromElement:el Xposition:Xpos];
          [view setBackgroundColor:[UIColor clearColor]];
          Xpos += view.frame.size.width;
          [cell.contentView addSubview:view];

          if (el.separator) {
            UILabel *leftBorder = [[UILabel alloc]
                initWithFrame:CGRectMake(Xpos + 5, 0, 1, height)];
            leftBorder.backgroundColor = [UIColor lightGrayColor];
            [cell.contentView addSubview:leftBorder];
          }
        }
      }
    }

    [cell.contentView.superview setClipsToBounds:YES];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  } else {
    return cell;
  }
  return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  if (self.categoryInfo.totalSectionCount > 0) {
    return self.categoryInfo.totalSectionCount;
  }
  return 1;
}

- (NSString *)tableView:(UITableView *)tableView
    titleForHeaderInSection:(NSInteger)section {
  if ([self.categoryInfo.rowsInSectionArray count] > 0) {
    RMFormsRowInfo *rowInfo = [[RMFormsRowInfo alloc] init];
    rowInfo = [self.categoryInfo.rowsInSectionArray objectAtIndex:section];
    return rowInfo.sectionName;
  }
  return @"";
}

- (CGFloat)tableView:(UITableView *)tableView
    heightForHeaderInSection:(NSInteger)section {
  return 30;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  if ([self.categoryInfo.rowsInSectionArray count] > 0) {
    RMFormsRowInfo *rowInfo =
        [self.categoryInfo.rowsInSectionArray objectAtIndex:section];
    if (rowInfo.noRows > 0) {
      return rowInfo.noRows;
    }
  }
  return 0;
}

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if ([self.categoryInfo.rowsInSectionArray count] > 0) {
    RMFormsRowInfo *rowInfo = [[RMFormsRowInfo alloc] init];
    rowInfo =
        [self.categoryInfo.rowsInSectionArray objectAtIndex:indexPath.row];

    int height = rowInfo.rowHeight;
    if (height != 0) {
      return height;
    } else {
      return 44;
    }
  }
  return 44;
}

@end
