//
//  AppDelegate.h
//  FormBuilder
//
//  Created by Rohit Mahto on 28/04/18.
//  Copyright © 2018 Rohit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder<UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UISplitViewController *split;
@property (strong, nonatomic) NSMutableDictionary *RowArray;
@property (strong, nonatomic) NSMutableDictionary *FormS;
@property (strong, nonatomic) NSMutableArray *FormArray;
@property (strong, nonatomic) NSMutableArray *formDataArray;
@property (strong, nonatomic) UINavigationController *navigationCon;
@property (strong, nonatomic) NSMutableDictionary *userEntriesDataSubmit;
@property (strong, nonatomic) NSMutableArray *userEntriesData;
/**
 *The NSOperationQueue instance regulates the execution of a set of NSOperation
 *objects. After being added to a queue, an operation remains in that queue
 *until it is explicitly canceled or finishes executing its task. Operations
 *within the queue (but not yet executing) are themselves organized according to
 *priority levels and inter-operation object dependencies and are executed
 *accordingly. An application may create multiple operation queues and submit
 *operations to any of them.
 **/

@property (strong, nonatomic) NSOperationQueue *globalOperationQueue;
+ (UIColor *)colorWithHexString:(NSString *)hex;
@end

