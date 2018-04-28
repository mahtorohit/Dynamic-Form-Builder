//
//  GlobalConstants.h
//  SAM
//
//  Created by SAM on 02/09/13.
//  Copyright (c) 2013 KAHUNA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalConstants : NSObject
FOUNDATION_EXPORT NSString *const kPaintImageSavedMessage;

FOUNDATION_EXPORT NSString *const kAddAddressNotFoundTitle;
FOUNDATION_EXPORT NSString *const kAddAddressNotFoundMessage;

FOUNDATION_EXPORT NSString *const kNoInternetConnectionTitle;
FOUNDATION_EXPORT NSString *const kNoInternetConnectionMessage;

FOUNDATION_EXPORT NSString *const kConfigureBlankUrl;

FOUNDATION_EXPORT NSString *const kInvalidConfigureUrlTitle;
FOUNDATION_EXPORT NSString *const kInvalidConfigureUrlMessage;

FOUNDATION_EXPORT NSString *const kNoLocationServiceAvailableTitle;
FOUNDATION_EXPORT NSString *const kNoLocationServiceAvailableMessage;

FOUNDATION_EXPORT NSString *const kNoAddressForDirections;

FOUNDATION_EXPORT NSString *const kLocationManagerErrorTitle;
FOUNDATION_EXPORT NSString *const kLocationManagerErrorAirplaneModeMessage;
FOUNDATION_EXPORT NSString *const kLocationManagerErrorTryAfterSomeTime;

FOUNDATION_EXPORT NSString *const kDefaultAddress;
FOUNDATION_EXPORT NSString *const kDefaultState;
FOUNDATION_EXPORT NSString *const kDefaultCountry;
FOUNDATION_EXPORT NSString *const kDefaultCity;

FOUNDATION_EXPORT NSString *const kMapLoadingOnDefaultLocation;

extern double kDefaultLat;
extern double kDefaultLong;

FOUNDATION_EXPORT NSString *const kNoConnectionTitle;
FOUNDATION_EXPORT NSString *const kNoConnectionMessage;

FOUNDATION_EXPORT NSString *const KNoConnectionInAddressValidation;
FOUNDATION_EXPORT NSString *const KNoConnectionInCurrentAddressValidation;

//Using Current location
FOUNDATION_EXPORT NSString *const KGPSErrorTitle;
FOUNDATION_EXPORT NSString *const KGPSErrorMessage;
FOUNDATION_EXPORT NSString *const KGPSAiroplaneModeErrorMessage;

//Location service disabled
FOUNDATION_EXPORT NSString *const kGPSDisabledTitle;
FOUNDATION_EXPORT NSString *const kGPSDisabledMessage;

//address not validated through server
FOUNDATION_EXPORT NSString *const kServerAddressValidationErrorTitle;
FOUNDATION_EXPORT NSString *const kServerAddressValidationErrorMessage;

FOUNDATION_EXPORT NSString *const KValidatingLocation;
FOUNDATION_EXPORT NSString *const KValidatingCurrentLocation;

FOUNDATION_EXPORT NSString *const kConnectionMessage;

FOUNDATION_EXPORT NSString *const kNoRecordsFoundTitle;

FOUNDATION_EXPORT NSString *const kFailToGetCurrentLocation;

FOUNDATION_EXPORT NSString *const kInvalidEmailAddressTitle;

FOUNDATION_EXPORT NSString *const kInternalErrorTitle;
FOUNDATION_EXPORT NSString *const kInternalErrorMessage;

FOUNDATION_EXPORT NSString *const kUserIdEmailBlankTitle;

FOUNDATION_EXPORT NSString *const kResetPasswordSuccess;
FOUNDATION_EXPORT NSString *const kOtherTypeBlank;

FOUNDATION_EXPORT NSString *const kRecordInsertedSuccessTitle;
FOUNDATION_EXPORT NSString *const kRecordInsertedSuccessMessage;

FOUNDATION_EXPORT NSString *const kSyncFailTitle;

FOUNDATION_EXPORT NSString *const kSaveDataTitle;
FOUNDATION_EXPORT NSString *const kSaveDataMessage;

FOUNDATION_EXPORT NSString *const kRecordSavedTitle;

FOUNDATION_EXPORT NSString *const kBlankDisasterCodeTitle;
FOUNDATION_EXPORT NSString *const kBlankBuildingAddressTitle;
FOUNDATION_EXPORT NSString *const kBlankPostingValueTitle;

FOUNDATION_EXPORT NSString *const kBlankPostingExtIntariorValue;

FOUNDATION_EXPORT NSString *const kInavlidUsernamePasswordTitle;

FOUNDATION_EXPORT NSString *const kOnlineModeTitle;
FOUNDATION_EXPORT NSString *const kOnlineModeMessage;

FOUNDATION_EXPORT NSString *const kNoEvaluatorsFound;
FOUNDATION_EXPORT NSString *const kMaxEvaluatorsReached;

@end
