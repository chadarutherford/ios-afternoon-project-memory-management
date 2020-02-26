//
//  CARContact.h
//  CARContacts
//
//  Created by Chad Rutherford on 2/26/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CARContact : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *email;
@property (nonatomic, readonly, copy) NSString *phone;

+ (instancetype) contactWithName:(NSString *)name
                           email:(NSString *)email
                           phone:(NSString *)phone;

- (instancetype) initWithName:(NSString *)name
                        email:(NSString *)email
                        phone:(NSString *)phone;

@end
