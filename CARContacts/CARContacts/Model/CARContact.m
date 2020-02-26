//
//  CARContact.m
//  CARContacts
//
//  Created by Chad Rutherford on 2/26/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARContact.h"

@implementation CARContact

- (instancetype) initWithName:(NSString *)name email:(NSString *)email phone:(NSString *)phone {
    self = [super init];
    if (self) {
        _name = [name copy];
        _email = [email copy];
        _phone = [phone copy];
    }
    return self;
}

+ (instancetype) contactWithName:(NSString *)name email:(NSString *)email phone:(NSString *)phone {
    return [[[CARContact alloc] initWithName:name email:email phone:phone] autorelease];
}

- (void)dealloc {
    [_name release];
    _name = nil;
    [_email release];
    _email = nil;
    [_phone release];
    _phone = nil;
    [super dealloc];
}

@end
