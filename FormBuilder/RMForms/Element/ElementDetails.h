//
//  ElementDetails.h
//  DynamicForms
//
//  Created by ROHIT on 19/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ElementDetails : NSObject {
}
- (id)initWithData:(NSDictionary *)data;
- (id)initWithDataV1:(NSDictionary *)data;
@property (assign, nonatomic) int ElementType;
@property (assign, nonatomic) int SpaceBetween;
@property (assign, nonatomic) int activetab;
@property (assign, nonatomic) int FontSize;
@property (strong, nonatomic) NSString *ElementId;
@property (strong, nonatomic) NSString *TextAlign;
@property (strong, nonatomic) NSString *LableText;
@property (assign, nonatomic) int width;
@property (assign, nonatomic) int hight;
@property (assign, nonatomic) int RowID;
@property (assign, nonatomic) int separator;
@property (assign, nonatomic) int TopPadding;
@property (assign, nonatomic) int BottomPadding;
@property (assign, nonatomic) int RightPadding;
@property (assign, nonatomic) int leftPadding;
@property (assign, nonatomic) FieldType fieldType;
@property (strong, nonatomic) NSString *TextValue;
@property (strong, nonatomic) NSString *TextColor;
@property (strong, nonatomic) NSArray *ArrayValue;
@property (assign, nonatomic) BOOL multiSelection, seperatorLineAfterText;
@property (strong, nonatomic) NSDate *MinDate;
@property (strong, nonatomic) NSDate *MaxDate;

@end
