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
        NSLog(@"--CONTACTS CONTROLLER INIT--");
        _internalContacts = [[NSMutableArray alloc] init];
        
        [self.internalContacts addObject:[CARContact contactWithName:@"Chad Rutherford" email:@"chad_rutherford@outlook.com" phone:@"7404187664"]];
        [self.internalContacts addObject:[CARContact contactWithName:@"Tyler Christian" email:@"tyler_christian@outlook.com" phone:@"4127978009"]];
        [self.internalContacts addObject:[CARContact contactWithName:@"Joe Schmoe" email:@"joe_schmoe@outlook.com" phone:@"8903765489"]];
        
    }
    return self;
}

- (NSArray *)contacts {
    return [[_internalContacts copy] autorelease];
}

- (void)addContact:(CARContact *)contact {
    [self.internalContacts addObject:contact];
}

- (void)updateContact:(CARContact *)contact
             withName:(NSString *)name
                email:(NSString *)email
                phone:(NSString *)phone {
    contact.name = name;
    contact.email = email;
    contact.phone = phone;
}

- (void)removeContact:(CARContact *)contact {
    [self.internalContacts removeObject:contact];
}

- (void)dealloc {
    NSLog(@"--CONTACTS CONTROLLER DEALLOC--");
    [_internalContacts release];
    _internalContacts = nil;
    [super dealloc];
}

@end
