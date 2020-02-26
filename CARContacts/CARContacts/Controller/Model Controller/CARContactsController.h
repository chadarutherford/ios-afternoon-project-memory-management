//
//  CARContactsController.h
//  CARContacts
//
//  Created by Chad Rutherford on 2/26/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CARContact.h"

@interface CARContactsController : NSObject

@property (nonatomic, readonly) NSArray *contacts;

- (void)addContact:(CARContact *)contact;

- (void)updateContact:(CARContact *)contact
             withName:(NSString *)name
                email:(NSString *)email
                phone:(NSString *)phone;

- (void)removeContact:(CARContact *)contact;

@end
