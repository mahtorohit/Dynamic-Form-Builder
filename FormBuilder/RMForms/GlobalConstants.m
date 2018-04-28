//
//  GlobalConstants.m
//  SAM
//
//  Created by SAM on 02/09/13.
//  Copyright (c) 2013 KAHUNA. All rights reserved.
//

#import "GlobalConstants.h"

@implementation GlobalConstants

NSString *const kPaintImageSavedMessage = @"Image successfully saved";
NSString *const k = @"SecondConstant";
NSString *const kAddAddressNotFoundTitle = @"Property with address not found";
NSString *const kAddAddressNotFoundMessage = @"Do you want to continue?";

NSString *const kNoInternetConnectionTitle = @"Unable to connect with internet";
NSString *const kNoInternetConnectionMessage = @"Please check your internet connection and try again";

NSString *const kConfigureBlankUrl = @"Url should not be blank";
NSString *const kInvalidConfigureUrlTitle = @"Unable to connect with server";
NSString *const kInvalidConfigureUrlMessage = @"Please confirm url";
NSString *const kNoLocationServiceAvailableTitle = @"Location Service Disabled";
NSString *const kNoLocationServiceAvailableMessage = @"To re-enable, please go to Settings and turn on Location Service for this app.";
NSString *const kNoAddressForDirections = @"Address details not available";

NSString *const kLocationManagerErrorTitle = @"Unable to get current location information";
NSString *const kLocationManagerErrorTryAfterSomeTime = @"Please try after some time";
NSString *const kLocationManagerErrorAirplaneModeMessage = @"please check your network connection or that you are not in airplane mode";

NSString *const kDefaultAddress=@"104 Varsha Avenue, KVP Saptnekar Marg, Anand Park, Sindhi Colony, Pune";
NSString *const kDefaultState=@"MH";
NSString *const kDefaultCountry=@"IN";
NSString *const kDefaultCity=@"Pune";

NSString *const kMapLoadingOnDefaultLocation = @"Unable to locate your current address, default location is \n%@";

double kDefaultLat=18.556359;
double kDefaultLong=73.807072;

NSString *const kNoConnectionTitle = @"App requires network access via Wi-Fi or cellular data.";
NSString *const kNoConnectionMessage = @"Please check your network connection and try again later";

NSString *const KNoConnectionInAddressValidation = @"Unable to locate your address";
NSString *const KNoConnectionInCurrentAddressValidation = @"Unable to locate your current address";

//Using Current location
NSString *const KGPSErrorTitle = @"Unable to get current location information";
NSString *const KGPSErrorMessage = @"Please try after some time";
NSString *const KGPSAiroplaneModeErrorMessage = @"Please check your network connection or that you are not in airplane mode";

//Location service disabled
NSString *const kGPSDisabledTitle = @"Location Service Disabled";
NSString *const kGPSDisabledMessage = @"To re-enable, please go to Settings and turn on Location Service for this app.";

//address not validated through server
NSString *const kServerAddressValidationErrorTitle = @"Unable to locate the address:";
NSString *const kServerAddressValidationErrorMessage = @"Only addresses within the boundaries of the state will be located";

NSString *const KValidatingLocation = @"Gathering location information";
NSString *const KValidatingCurrentLocation = @"Gathering current location information";

NSString *const kConnectionMessage = @"App is now able to access the internet";

NSString *const kNoRecordsFoundTitle = @"No records found";
NSString *const kFailToGetCurrentLocation = @"Unable to get current location information";

NSString *const kInvalidEmailAddressTitle =@"Please enter a valid email address";

NSString *const kInternalErrorTitle = @"Internal error";
NSString *const kInternalErrorMessage = @"Please try after some time";

NSString *const kUserIdEmailBlankTitle = @"Please enter User ID OR Email Address";

NSString *const kResetPasswordSuccess = @"Your password has been sent to your email address.";
NSString *const kOtherTypeBlank = @"Please provide details for type other";

NSString *const kRecordInsertedSuccessTitle = @"Record Inserted Successfully";
NSString *const kRecordInsertedSuccessMessage = @"Reference Id = %@";

NSString *const kSyncFailTitle = @"Unable to sync wth server";

NSString *const kSaveDataTitle = @"Do you want to save data";
NSString *const kSaveDataMessage = @"Discard action will completely delete changes you have made";

NSString *const kRecordSavedTitle =  @"Record Saved Successfully";

NSString *const kBlankDisasterCodeTitle =  @"Please select a disaster code";
NSString *const kBlankBuildingAddressTitle =  @"Please select building address";
NSString *const kBlankPostingValueTitle =  @"Please select posting value";

NSString *const kBlankPostingExtIntariorValue =  @"Please select exterior only/exterior & interior";

NSString *const kInavlidUsernamePasswordTitle =  @"Please enter valid username and password";

NSString *const kOnlineModeTitle =  @"Online Mode";
NSString *const kOnlineModeMessage = @"It will sync assessment data once click on the Submit button at the end of completing the assessment.";

NSString *const kNoEvaluatorsFound =  @"No new evaluators found";

NSString *const kMaxEvaluatorsReached = @"Maximum 10 evaluators can be added for a inspection";

@end
