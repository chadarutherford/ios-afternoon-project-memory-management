//
//  CARContactsDetailViewController.h
//  CARContacts
//
//  Created by Chad Rutherford on 2/26/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CARContactsController.h"
#import "CARContact.h"

@interface CARContactsDetailViewController : UIViewController

@property (nonatomic, retain) CARContact *contact;
@property (nonatomic, retain) CARContactsController *contactsController;

@end
