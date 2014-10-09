/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is the Alfresco Mobile App.
 *
 * The Initial Developer of the Original Code is Zia Consulting, Inc.
 * Portions created by the Initial Developer are Copyright (C) 2011-2012
 * the Initial Developer. All Rights Reserved.
 *
 *
 * ***** END LICENSE BLOCK ***** */

//
//  AccountInfo.h
//

# import <Foundation/Foundation.h>
#import "AccountStatus.h"
#import "FDCertificate.h"

extern NSString * const kServerAccountId;
extern NSString * const kServerVendor;
extern NSString * const kServerDescription;
extern NSString * const kServerProtocol;
extern NSString * const kServerHostName;
extern NSString * const kServerPort;
extern NSString * const kServerServiceDocumentRequestPath;
extern NSString * const kServerUsername;
extern NSString * const kServerPassword;
extern NSString * const kServerInformation;
extern NSString * const kServerMultitenant;
extern NSString * const kCloudId;
extern NSString * const kCloudKey;
extern NSString * const kIsDefaultAccount;
extern NSString * const kServerCMISProtocol;

@interface AccountInfo : NSObject <NSCoding>
@property (nonatomic, readonly) NSString *uuid;
@property (nonatomic, copy) NSString *vendor;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *protocol;
@property (nonatomic, copy) NSString *hostname;
@property (nonatomic, copy) NSString *port;
@property (nonatomic, copy) NSString *serviceDocumentRequestPath;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, strong) NSMutableDictionary *infoDictionary;
@property (nonatomic, strong) NSNumber *multitenant;
@property (nonatomic, copy) NSString *cloudId;
@property (nonatomic, copy) NSString *cloudKey;
@property (nonatomic, assign) FDAccountStatus accountStatus;
@property (nonatomic, assign) BOOL isDefaultAccount;
@property (nonatomic, assign) BOOL isQualifyingAccount;
@property (nonatomic, retain) AccountStatus *accountStatusInfo;
@property (nonatomic, readonly) FDCertificate *certificateWrapper;
@property (nonatomic, strong) NSNumber *cmisType;

- (BOOL)isMultitenant;
/**
 * Returns YES if the current Alfresco Cloud account is configured for the live (my.alfresco.com) service
 */
- (BOOL)isLiveCloudEnvironment;

@end
