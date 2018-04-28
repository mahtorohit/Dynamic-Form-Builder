//
//  LoginAppDelegate.h
//  DynamicFormGenerator
//
//  Created by Siddharth on 2/26/17.
//  Copyright (c) 2017 Rohit Mahto. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginPopDelegate<NSObject>

- (void)LoginSucessfull;
- (void)Loginfailed;
- (void)cancelClicked;

@end
