//
//  CARContactsTableViewController.m
//  CARContacts
//
//  Created by Chad Rutherford on 2/26/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARContactsTableViewController.h"

@interface CARContactsTableViewController ()

@end

@implementation CARContactsTableViewController

static NSString *const showAddSegue = @"ShowAddContactSegue";
static NSString *const showDetailSegue = @"ShowContactDetailSegue";
static NSString *const contactCell = @"ContactCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemIndigoColor];
}


@end
