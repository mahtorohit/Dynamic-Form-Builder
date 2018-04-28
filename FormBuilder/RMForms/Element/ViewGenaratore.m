//
//  ViewGenaratore.m
//  DynamicForms
//
//  Created by ROHIT on 20/02/17.
//  Copyright (c) 2017 3diiphonedev. All rights reserved.
//

#import "ViewGenaratore.h"

@implementation ViewGenaratore

int ViewMargin = 5;

// Create UIview from ElementDetails

/**
 *  Create UIview from ElementDetails
 *  @see ViewGenaratore
 *  @param ElementDetails element.
 *  @param int X position .
 *  @return The test results
 */

- (UIView *)GetViewFromElement:(ElementDetails *)element Xposition:(int)Xpos;
{
  int ViewX = Xpos;

  UIView *ReturnView;  // Container View For View

  ElementDetails *ele = element;
  switch (ele.fieldType) {
    case FieldLabelField: {
      ViewX += 5;

      ReturnView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight)];

      UITextView *lab = [[UITextView alloc]
          initWithFrame:CGRectMake(ele.leftPadding, ele.TopPadding, ele.width,
                                   ele.hight)];
      lab.backgroundColor = [UIColor clearColor];
      lab.text = ele.TextValue;
      lab.userInteractionEnabled = NO;

      lab.textAlignment = NSTextAlignmentLeft;

      if ([ele.TextColor length] != 0) {
        lab.textColor = [self colorWithHexString:ele.TextColor];
      }
      if (ele.FontSize != 0) {
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light"
                                       size:ele.FontSize * 1.6];

        lab.font = font;
      }

      [ReturnView addSubview:lab];

    } break;
    case FieldTextField: {
      ViewX += 5;

      UITextField *textField = [[UITextField alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight)];
      textField.fieldType = ele.fieldType;

      textField.text = ele.TextValue;
      textField.backgroundColor = [UIColor clearColor];
      ReturnView = textField;
      textField.entryDataId = ele.ElementId;
      textField.delegate = self.Datadelegate;

      if ([ele.TextColor length] != 0) {
        textField.textColor = [self colorWithHexString:ele.TextColor];
      }

      if (ele.FontSize != 0) {
        float pixels = lroundf((1 + ele.FontSize) * (115 / 99));
        UIFont *font =
            [UIFont fontWithName:@"HelveticaNeue-Light" size:pixels + 2];

        textField.font = font;
      }

    }

    break;
    case FieldTextView: {
      ViewX += 5;

      UITextView *Text = [[UITextView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight)];
      Text.text = ele.TextValue;
      Text.fieldType = ele.fieldType;
      Text.backgroundColor = [UIColor clearColor];
      Text.entryDataId = ele.ElementId;
      Text.delegate = self.Datadelegate;

      if ([ele.TextColor length] != 0) {
        Text.textColor = [self colorWithHexString:ele.TextColor];
      }
      if (ele.FontSize != 0) {
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light"
                                       size:ele.FontSize * 1.6];

        Text.font = font;
      }

      ReturnView = Text;
    } break;

    case FieldDatePicker: {
      ViewX += 5;

      ReturnView = [[UITextView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight)];

      UILabel *lab = [[UILabel alloc]
          initWithFrame:CGRectMake(0, 0, ele.width, ele.hight)];

      lab.text = ele.LableText;
      //  [lab sizeToFit];
      UIButton *DateBtn =
          [[UIButton alloc] initWithFrame:CGRectMake(lab.frame.origin.x + 5, 0,
                                                     ele.width, ele.hight)];

      if (ele.FontSize != 0) {
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light"
                                       size:ele.FontSize * 1.6];
        DateBtn.font = font;
        lab.font = font;
      }

      if ([ele.TextColor length] != 0) {
        lab.textColor = [self colorWithHexString:ele.TextColor];
        DateBtn.titleLabel.textColor = [self colorWithHexString:ele.TextColor];
      }

      DateBtn.backgroundColor = [UIColor clearColor];
      CGSize widthIs =
          [lab.text boundingRectWithSize:lab.frame.size
                                 options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:@{NSFontAttributeName : lab.font}
                                 context:nil]
              .size;

      CGRect rect = lab.frame;
      rect.origin.x = ele.leftPadding;
      rect.origin.y = ele.TopPadding;
      rect.size.width = widthIs.width;
      rect.size.height = widthIs.height;

      lab.frame = rect;

      rect = DateBtn.frame;

      rect.origin.x =
          lab.frame.origin.x + lab.frame.size.width + ele.SpaceBetween;
      rect.origin.y = ele.TopPadding;
      rect.size.width = ele.width - widthIs.width;
      rect.size.height = ele.hight;
      DateBtn.frame = rect;

      if ([ele.TextColor length] != 0) {
        lab.textColor = [self colorWithHexString:ele.TextColor];
        DateBtn.titleLabel.textColor = [self colorWithHexString:ele.TextColor];
      }

      [DateBtn
          setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
      [DateBtn setContentHorizontalAlignment:
                   UIControlContentHorizontalAlignmentLeft];
      [DateBtn setBackgroundColor:[UIColor clearColor]];
      [DateBtn setTitle:ele.TextValue forState:UIControlStateNormal];
      [DateBtn setTitleColor:[UIColor blackColor]
                    forState:UIControlStateNormal];
      // DateBtn.titleLabel.text=ele.TextValue;
      DateBtn.fieldType = ele.fieldType;
      DateBtn.minDate = ele.MinDate;
      DateBtn.maxDate = ele.MaxDate;
      DateBtn.entryDataId = ele.ElementId;

      [DateBtn addTarget:self.Datadelegate
                    action:@selector(ButtonAction:)
          forControlEvents:UIControlEventTouchUpInside];
      [ReturnView addSubview:lab];
      [ReturnView addSubview:DateBtn];

    } break;

    case FieldDataPicker: {
      ViewX += 5;

      ReturnView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight)];

      UILabel *lab = [[UILabel alloc]
          initWithFrame:CGRectMake(ele.leftPadding, ele.TopPadding, ele.width,
                                   ele.hight)];

      lab.text = ele.LableText;
      //  [lab sizeToFit];

      UIButton *DateBtn = [[UIButton alloc]
          initWithFrame:CGRectMake(lab.frame.origin.x + 5, 0,
                                   ele.width - lab.frame.size.width,
                                   ele.hight)];

      if ([ele.TextColor length] != 0) {
        lab.textColor = [self colorWithHexString:ele.TextColor];
        DateBtn.titleLabel.textColor = [self colorWithHexString:ele.TextColor];
      }
      if (ele.FontSize != 0) {
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light"
                                       size:ele.FontSize * 1.6];
        DateBtn.font = font;
        lab.font = font;
      }

      CGSize widthIs =
          [lab.text boundingRectWithSize:lab.frame.size
                                 options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:@{NSFontAttributeName : lab.font}
                                 context:nil]
              .size;

      CGRect rect = lab.frame;
      rect.origin.x = ele.leftPadding;
      rect.origin.y = ele.TopPadding;
      rect.size.width = widthIs.width;
      rect.size.height = widthIs.height;

      lab.frame = rect;

      rect = DateBtn.frame;

      rect.origin.x =
          lab.frame.origin.x + lab.frame.size.width + ele.SpaceBetween;
      rect.origin.y = ele.TopPadding;
      rect.size.width = ele.width - widthIs.width;
      rect.size.height = ele.hight;
      DateBtn.frame = rect;

      [DateBtn setBackgroundColor:[UIColor clearColor]];
      [DateBtn setTitle:ele.TextValue forState:UIControlStateNormal];
      [DateBtn setTitleColor:[UIColor blackColor]
                    forState:UIControlStateNormal];

      DateBtn.fieldType = ele.fieldType;
      [DateBtn addTarget:self.Datadelegate
                    action:@selector(ButtonAction:)
          forControlEvents:UIControlEventTouchUpInside];
      DateBtn.entryDataId = ele.ElementId;
      DateBtn.multiSelection = ele.multiSelection;
      DateBtn.title = ele.TextValue;
      if ([ele.ArrayValue count] > 0) {
        DateBtn.valueArray = ele.ArrayValue;
      }

      [DateBtn setContentHorizontalAlignment:
                   UIControlContentHorizontalAlignmentLeft];
      [DateBtn
          setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];

      [ReturnView addSubview:lab];
      [ReturnView addSubview:DateBtn];

    } break;

    case FieldDataPickerMulti: {
      ViewX += 5;

      ReturnView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight)];

      UILabel *lab = [[UILabel alloc]
          initWithFrame:CGRectMake(ele.leftPadding, ele.TopPadding, ele.width,
                                   ele.hight)];

      lab.text = ele.LableText;

      UIButton *DateBtn = [[UIButton alloc]
          initWithFrame:CGRectMake(lab.frame.origin.x, 0,
                                   ele.width - lab.frame.size.width,
                                   ele.hight)];

      if ([ele.TextColor length] != 0) {
        lab.textColor = [self colorWithHexString:ele.TextColor];
        DateBtn.titleLabel.textColor = [self colorWithHexString:ele.TextColor];
      }

      if (ele.FontSize != 0) {
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light"
                                       size:ele.FontSize * 1.6];
        DateBtn.font = font;
        lab.font = font;
      }

      CGSize widthIs =
          [lab.text boundingRectWithSize:lab.frame.size
                                 options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:@{NSFontAttributeName : lab.font}
                                 context:nil]
              .size;

      CGRect rect = lab.frame;
      rect.origin.x = ele.leftPadding;
      rect.origin.y = ele.TopPadding;
      rect.size.width = widthIs.width;
      rect.size.height = widthIs.height;

      lab.frame = rect;

      rect = DateBtn.frame;

      rect.origin.x =
          lab.frame.origin.x + lab.frame.size.width + ele.SpaceBetween;
      rect.origin.y = ele.TopPadding;
      rect.size.width = ele.width - widthIs.width;
      rect.size.height = ele.hight;
      DateBtn.frame = rect;
      DateBtn.contentHorizontalAlignment = UIControlContentVerticalAlignmentTop;
      DateBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
      DateBtn.backgroundColor = [UIColor greenColor];

      //  [lab setBackgroundColor:[UIColor grayColor]];
      //[DateBtn setBackgroundColor:[UIColor grayColor]];
      [DateBtn setTitle:ele.TextValue forState:UIControlStateNormal];
      [DateBtn setTitleColor:[UIColor blackColor]
                    forState:UIControlStateNormal];

      DateBtn.fieldType = ele.fieldType;
      [DateBtn addTarget:self.Datadelegate
                    action:@selector(ButtonAction:)
          forControlEvents:UIControlEventTouchUpInside];
      DateBtn.entryDataId = ele.ElementId;
      DateBtn.multiSelection = YES;
      DateBtn.title = ele.TextValue;
      if ([ele.ArrayValue count] > 0) {
        DateBtn.valueArray = ele.ArrayValue;
      }

      [DateBtn setContentHorizontalAlignment:
                   UIControlContentHorizontalAlignmentLeft];
      [DateBtn
          setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];

      [ReturnView addSubview:lab];
      [ReturnView addSubview:DateBtn];
    } break;

    case FieldImagePicker: {
      ViewX += 5;

      UIButton *Input = [UIButton buttonWithType:UIButtonTypeCustom];

      Input.frame = CGRectMake(ViewX, 0, ele.width, ele.hight);
      Input.titleLabel.textColor = [UIColor blackColor];
      Input.fieldType = ele.fieldType;
      Input.entryDataId = ele.ElementId;
      [Input setBackgroundColor:[UIColor clearColor]];

      [Input setImage:[UIImage imageNamed:@"cam.png"]
             forState:UIControlStateNormal];
      [Input addTarget:self.Datadelegate
                    action:@selector(ButtonAction:)
          forControlEvents:UIControlEventTouchUpInside];

      ReturnView = Input;

    } break;
    case FieldCheBoxType1: {
      ViewX += 5;

      UIView *ContainerView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width + 60, ele.hight)];

      UISwitch *Switch =
          [[UISwitch alloc] initWithFrame:CGRectMake(0, 6, 0, 0)];

      UILabel *lab =
          [[UILabel alloc] initWithFrame:CGRectMake(Switch.frame.size.width + 2,
                                                    0, ele.width, ele.hight)];

      Switch.fieldType = ele.fieldType;

      lab.text = ele.TextValue;
      [Switch addTarget:self.Datadelegate
                    action:@selector(TickAction:)
          forControlEvents:UIControlEventValueChanged];

      [ContainerView addSubview:Switch];
      [ContainerView addSubview:lab];
      ContainerView.backgroundColor = [UIColor clearColor];
      ReturnView = ContainerView;

    } break;
    case FieldSegment: {
      ViewX += 5;

      UIView *ContainerView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width - 10, ele.hight)];

      UISegmentedControl *Segment =
          [[UISegmentedControl alloc] initWithItems:ele.ArrayValue];

      CGRect rec = Segment.frame;

      rec.origin.x = 3;
      // rec.size.height=ele.hight-5;
      int x = ele.width - 15;
      rec.size.width = x;
      [Segment addTarget:self.Datadelegate
                    action:@selector(SegmentAction:)
          forControlEvents:UIControlEventValueChanged];

      rec.origin.y = ele.TopPadding;
      Segment.frame = rec;

      Segment.fieldType = ele.fieldType;
      Segment.entryDataId = ele.ElementId;

      // ViewX+=5;

      [ContainerView addSubview:Segment];

      [Segment setSelectedSegmentIndex:ele.activetab - 1];

      [Segment setTintColor:[UIColor blueColor]];
      ReturnView = ContainerView;

    } break;

    case FieldInputePop: {
      ViewX += 5;
      UIButton *Input = [UIButton buttonWithType:UIButtonTypeCustom];

      Input.frame = CGRectMake(ViewX, 0, ele.width, ele.hight);
      Input.titleLabel.textColor = [UIColor blackColor];
      Input.fieldType = ele.fieldType;
      Input.entryDataId = ele.ElementId;
      [Input setBackgroundColor:[UIColor clearColor]];

      [Input setImage:[UIImage imageNamed:@"comment.png"]
             forState:UIControlStateNormal];
      [Input addTarget:self.Datadelegate
                    action:@selector(ButtonAction:)
          forControlEvents:UIControlEventTouchUpInside];
      ReturnView = Input;

    } break;

    case FieldAmPmCheck: {
      ViewX += 5;

      UIView *ContainerView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight * 2)];

      UISwitch *Switch =
          [[UISwitch alloc] initWithFrame:CGRectMake(5, 5, 0, 0)];
      UISwitch *Switch1 =
          [[UISwitch alloc] initWithFrame:CGRectMake(5, 5, 0, 0)];

      UILabel *lab = [[UILabel alloc]
          initWithFrame:CGRectMake(
                            Switch.frame.origin.x + Switch.frame.size.width,
                            Switch.frame.origin.y,
                            ele.width - (Switch.frame.size.width + 7), 50)];

      UILabel *lab1 = [[UILabel alloc]
          initWithFrame:CGRectMake(
                            Switch1.frame.origin.x + Switch1.frame.size.width,
                            Switch1.frame.origin.y,
                            ele.width - (Switch.frame.size.width + 7), 50)];
      lab.backgroundColor = [UIColor clearColor];
      lab1.backgroundColor = [UIColor clearColor];
      Switch.fieldType = ele.fieldType;
      Switch1.fieldType = ele.fieldType;
      Switch.lbView = lab;
      Switch1.lbView = lab1;
      NSArray *IDs = [ele.ElementId componentsSeparatedByString:@"#&#"];

      if (IDs.count == 2) {
        Switch.entryDataId = [IDs objectAtIndex:0];

        Switch1.entryDataId = [IDs objectAtIndex:1];
      }

      NSArray *Text = [ele.TextValue componentsSeparatedByString:@"#&#"];

      if (Text.count == 2) {
        lab.text = [Text objectAtIndex:0];

        lab1.text = [Text objectAtIndex:1];

      } else {
        lab.text = @"AM 00:00";

        lab1.text = @"PM 00:00";
      }

      UIView *Switch1View = [[UIView alloc]
          initWithFrame:CGRectMake(0, -2, ele.width, ele.hight / 2)];

      [Switch1View addSubview:Switch];
      [Switch1View addSubview:lab];

      UIView *Switch2View =
          [[UIView alloc] initWithFrame:CGRectMake(0, (ele.hight / 2),
                                                   ele.width, ele.hight / 2)];
      [Switch2View addSubview:Switch1];

      [Switch2View addSubview:lab1];
      CGRect rec = lab.frame;

      rec.origin.x += 5;

      rec.origin.y = Switch.frame.origin.y + ((Switch.frame.size.height / 2) -
                                              (lab.frame.size.height / 2));

      lab.frame = rec;

      rec = lab1.frame;

      rec.origin.x += 5;

      rec.origin.y = Switch1.frame.origin.y + ((Switch1.frame.size.height / 2) -
                                               (lab1.frame.size.height / 2));

      lab1.frame = rec;

      [Switch addTarget:self.Datadelegate
                    action:@selector(TickAction:)
          forControlEvents:UIControlEventValueChanged];
      [Switch1 addTarget:self.Datadelegate
                    action:@selector(TickAction:)
          forControlEvents:UIControlEventValueChanged];

      ContainerView.backgroundColor = [UIColor clearColor];
      [ContainerView addSubview:Switch1View];
      [ContainerView addSubview:Switch2View];

      ReturnView = ContainerView;

    } break;

    case FieldAmPmSegment: {
      ViewX += 5;

      UIView *ContainerView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight * 2)];
      UISegmentedControl *Segment =
          [[UISegmentedControl alloc] initWithItems:ele.ArrayValue];

      UISegmentedControl *Segment1 =
          [[UISegmentedControl alloc] initWithItems:ele.ArrayValue];

      CGRect rec = Segment.frame;

      [Segment addTarget:self.Datadelegate
                    action:@selector(SegmentAction:)
          forControlEvents:UIControlEventValueChanged];

      [Segment1 addTarget:self.Datadelegate
                    action:@selector(SegmentAction:)
          forControlEvents:UIControlEventValueChanged];

      // rec.origin.y= Segment.frame.size.height;

      rec.origin.y = (Segment.frame.size.height / 2);
      rec.origin.x = ele.width / 2 - (Segment.frame.size.width / 2);

      Segment.frame = rec;

      rec = Segment1.frame;

      rec.origin.y = ele.hight / 2 + (Segment1.frame.size.height / 2) - 5;

      rec.origin.x = ele.width / 2 - (Segment1.frame.size.width / 2);

      Segment1.frame = rec;

      NSArray *IDs = [ele.ElementId componentsSeparatedByString:@"#&#"];

      if (IDs.count == 2) {
        Segment.entryDataId = [IDs objectAtIndex:0];

        Segment1.entryDataId = [IDs objectAtIndex:1];
      }

      [Segment setSelectedSegmentIndex:0];
      [Segment1 setSelectedSegmentIndex:0];

      [Segment setSelectedSegmentIndex:ele.activetab];
      [Segment1 setSelectedSegmentIndex:ele.activetab];
      [ContainerView addSubview:Segment];
      [ContainerView addSubview:Segment1];

      ContainerView.backgroundColor = [UIColor clearColor];

      ReturnView = ContainerView;

    } break;

    case FieldAmPmImagePicker: {
      ViewX += 5;

      UIView *ContainerView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight * 2)];

      UIButton *Input = [UIButton buttonWithType:UIButtonTypeCustom];

      UIButton *Input1 = [UIButton buttonWithType:UIButtonTypeCustom];

      Input.frame = CGRectMake(ele.width / 2 - (ele.hight / 4) + 2, 5,
                               ele.hight / 2 - 2, ele.hight / 2 - 9);

      Input1.frame =
          CGRectMake(ele.width / 2 - (ele.hight / 4) + 2,
                     Input.frame.origin.y + Input.frame.size.height + 5,
                     ele.hight / 2 - 2, ele.hight / 2 - 9);

      [Input setBackgroundImage:[UIImage imageNamed:@"cam-2.png"]
                       forState:UIControlStateNormal];
      [Input1 setBackgroundImage:[UIImage imageNamed:@"cam-2.png"]
                        forState:UIControlStateNormal];

      Input.fieldType = ele.fieldType;

      [Input setBackgroundColor:[UIColor clearColor]];

      [Input1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

      Input1.fieldType = ele.fieldType;
      [Input1 setBackgroundColor:[UIColor clearColor]];

      NSArray *IDs = [ele.ElementId componentsSeparatedByString:@"#&#"];

      if (IDs.count == 2) {
        Input.entryDataId = [IDs objectAtIndex:0];

        Input1.entryDataId = [IDs objectAtIndex:1];
      }

      [Input addTarget:self.Datadelegate
                    action:@selector(ButtonAction:)
          forControlEvents:UIControlEventTouchUpInside];
      [Input1 addTarget:self.Datadelegate
                    action:@selector(ButtonAction:)
          forControlEvents:UIControlEventTouchUpInside];

      [ContainerView addSubview:Input];
      [ContainerView addSubview:Input1];

      ReturnView = ContainerView;

    } break;

    case FieldAmPmInputePop: {
      ViewX += 5;

      UIView *ContainerView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight * 2)];

      UIButton *Input = [UIButton buttonWithType:UIButtonTypeCustom];
      UIButton *Input1 = [UIButton buttonWithType:UIButtonTypeCustom];

      Input.frame = CGRectMake(ele.width / 2 - (ele.hight / 4), 0,
                               ele.hight / 2, ele.hight / 2);
      Input1.frame =
          CGRectMake(ele.width / 2 - (ele.hight / 4),
                     Input.frame.origin.y + Input.frame.size.height - 2,
                     ele.hight / 2, ele.hight / 2);

      Input.fieldType = ele.fieldType;
      [Input setBackgroundColor:[UIColor clearColor]];
      Input1.fieldType = ele.fieldType;
      [Input1 setBackgroundColor:[UIColor clearColor]];

      [Input setImage:[UIImage imageNamed:@"comment.png"]
             forState:UIControlStateNormal];
      [Input1 setImage:[UIImage imageNamed:@"comment.png"]
              forState:UIControlStateNormal];

      NSArray *IDs = [ele.ElementId componentsSeparatedByString:@"#&#"];

      if (IDs.count == 2) {
        Input.entryDataId = [IDs objectAtIndex:0];

        Input1.entryDataId = [IDs objectAtIndex:1];
      }

      [Input addTarget:self.Datadelegate
                    action:@selector(ButtonAction:)
          forControlEvents:UIControlEventTouchUpInside];
      [Input1 addTarget:self.Datadelegate
                    action:@selector(ButtonAction:)
          forControlEvents:UIControlEventTouchUpInside];

      [ContainerView addSubview:Input];
      [ContainerView addSubview:Input1];

      ReturnView = ContainerView;

    } break;

    case FieldLabText: {
      ViewX += 5;

      ReturnView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight)];

      UILabel *lab = [[UILabel alloc]
          initWithFrame:CGRectMake(0, 0, ele.width, ele.hight)];

      lab.text = ele.LableText;
      //  [lab sizeToFit];

      UITextField *DateBtn = [[UITextField alloc]
          initWithFrame:CGRectMake(lab.frame.origin.x + 5, 0,
                                   ele.width - lab.frame.size.width,
                                   ele.hight)];

      if ([ele.TextColor length] != 0) {
        lab.textColor = [self colorWithHexString:ele.TextColor];
        DateBtn.textColor = [self colorWithHexString:ele.TextColor];
      }

      DateBtn.entryDataId = ele.ElementId;
      DateBtn.FieldType = ele.fieldType;
      DateBtn.delegate = self.Datadelegate;

      if (ele.FontSize != 0) {
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light"
                                       size:ele.FontSize * 1.6];
        DateBtn.font = font;
        lab.font = font;
      }

      CGSize widthIs =
          [lab.text boundingRectWithSize:lab.frame.size
                                 options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:@{NSFontAttributeName : lab.font}
                                 context:nil]
              .size;

      CGRect rect = lab.frame;
      rect.origin.x = ele.leftPadding;
      rect.origin.y = ele.TopPadding;
      rect.size.width = widthIs.width;
      rect.size.height = widthIs.height;

      lab.frame = rect;

      rect = DateBtn.frame;

      rect.origin.x =
          lab.frame.origin.x + lab.frame.size.width + ele.SpaceBetween;
      rect.origin.y = ele.TopPadding;
      rect.size.width = ele.width - widthIs.width;
      rect.size.height = ele.hight;
      DateBtn.frame = rect;

      [DateBtn setContentHorizontalAlignment:
                   UIControlContentHorizontalAlignmentLeft];
      [DateBtn
          setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];

      [DateBtn setBackgroundColor:[UIColor clearColor]];
      DateBtn.text = ele.TextValue;

      DateBtn.fieldType = ele.fieldType;
      DateBtn.entryDataId = ele.ElementId;

      [ReturnView addSubview:lab];
      [ReturnView addSubview:DateBtn];

      CGRect rec = lab.frame;
      rec = DateBtn.frame;

    } break;
    case FieldLabTextBig: {
      ViewX += 5;

      UIView *ContainerView = [[UIView alloc]
          initWithFrame:CGRectMake(ViewX, 0, ele.width, ele.hight * 2)];

      UILabel *lab = [[UILabel alloc] init];

      UITextView *text = [[UITextView alloc]
          initWithFrame:CGRectMake(lab.frame.origin.x + 5 + ele.leftPadding,
                                   ele.TopPadding,
                                   ele.width - lab.frame.size.width,
                                   ele.hight)];

      text.FieldType = ele.fieldType;
      text.delegate = self.Datadelegate;

      lab.text = ele.LableText;
      text.text = ele.TextValue;

      if ([ele.TextColor length] != 0) {
        lab.textColor = [self colorWithHexString:ele.TextColor];
        text.textColor = [self colorWithHexString:ele.TextColor];
      }

      if (ele.FontSize != 0) {
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light"
                                       size:ele.FontSize * 1.6];

        lab.font = font;
        text.font = font;
      }

      ContainerView.contentMode = UIViewContentModeScaleAspectFit;
      [lab sizeToFit];
      CGRect rect = lab.frame;
      rect.origin.x = ele.leftPadding;
      rect.origin.y = ele.TopPadding;

      lab.frame = rect;

      rect = text.frame;

      rect.origin.x = ele.leftPadding;
      rect.origin.y = lab.bounds.size.height + 5 + ele.SpaceBetween;
      rect.size.width = ele.width;
      rect.size.height = ele.hight - lab.bounds.size.height;
      text.frame = rect;

      text.clipsToBounds = YES;

      text.backgroundColor = [UIColor clearColor];

      [ContainerView addSubview:lab];

      [ContainerView addSubview:text];

      ContainerView.clipsToBounds = YES;

      ContainerView.backgroundColor = [UIColor greenColor];

      ReturnView = ContainerView;

    } break;
  }

  ReturnView.clipsToBounds = YES;

  return ReturnView;
}

- (UIColor *)colorWithHexString:(NSString *)hex {
  NSString *cString = [[hex
      stringByTrimmingCharactersInSet:[NSCharacterSet
                                          whitespaceAndNewlineCharacterSet]]
      uppercaseString];

  // String should be 6 or 8 characters
  if ([cString length] < 6)
    return [UIColor grayColor];

  // strip 0X if it appears
  if ([cString hasPrefix:@"0X"])
    cString = [cString substringFromIndex:2];

  if ([cString length] != 6)
    return [UIColor grayColor];

  // Separate into r, g, b substrings
  NSRange range;
  range.location = 0;
  range.length = 2;
  NSString *rString = [cString substringWithRange:range];

  range.location = 2;
  NSString *gString = [cString substringWithRange:range];

  range.location = 4;
  NSString *bString = [cString substringWithRange:range];

  // Scan values
  unsigned int r, g, b;
  [[NSScanner scannerWithString:rString] scanHexInt:&r];
  [[NSScanner scannerWithString:gString] scanHexInt:&g];
  [[NSScanner scannerWithString:bString] scanHexInt:&b];

  return [UIColor colorWithRed:((float)r / 255.0f)
                         green:((float)g / 255.0f)
                          blue:((float)b / 255.0f)
                         alpha:1.0f];
}

@end
