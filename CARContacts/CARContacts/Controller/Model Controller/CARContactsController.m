//
//  CARContactsController.m
//  CARContacts
//
//  Created by Chad Rutherford on 2/26/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARContactsController.h"
#import "CARContact.h"

@interface CARContactsController ()

@property (nonatomic, retain) NSMutableArray *internalContacts;

@end

@implementation CARContactsController

- (instancetype) init {
    self = [super init];
    if (self) {
        _contacts = [_internalContacts copy];
        
        [self.internalContacts addObject:[CARContact contactWithName:@"Chad Rutherford" email:@"chad_rutherford@outlook.com" phone:@"7404187664"]];
        [self.internalContacts addObject:[CARContact contactWithName:@"Tyler Christian" email:@"tyler_christian@outlook.com" phone:@"4127978009"]];
        [self.internalContacts addObject:[CARContact contactWithName:@"Joe Schmoe" email:@"joe_schmoe@outlook.com" phone:@"8903765489"]];
        
    }
    return self;
}

- (void) addContact:(CARContact *)contact {
    [self.internalContacts addObject:contact];
    [contact release];
}

- (void)updateContact:(CARContact *)contact {
    NSUInteger index = [self.internalContacts indexOfObject:contact];
    self.internalContacts[index] = contact;
    [contact release];
}

- (void)removeContact:(CARContact *)contact {
    NSUInteger index = [self.internalContacts indexOfObject:contact];
    [self.internalContacts removeObjectAtIndex:index];
    [contact release];
}

- (void)dealloc {
    [_contacts release];
    _contacts = nil;
    [_internalContacts release];
    _internalContacts = nil;
    [super dealloc];
}

@end
