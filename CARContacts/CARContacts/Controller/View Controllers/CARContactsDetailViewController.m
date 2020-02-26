//
//  CARContactsDetailViewController.m
//  CARContacts
//
//  Created by Chad Rutherford on 2/26/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARContactsDetailViewController.h"
#import "CARContact.h"

@interface CARContactsDetailViewController ()

@property (retain, nonatomic) IBOutlet UITextField *nameTextField;
@property (retain, nonatomic) IBOutlet UITextField *emailTextField;
@property (retain, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation CARContactsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configureNavigationBar];
}

- (void)updateViews {
    if (self.contact) {
        self.nameTextField.text = self.contact.name;
        self.emailTextField.text = self.contact.email;
        self.phoneTextField.text = self.contact.phone;
    } else {
        return;
    }
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    NSString *name = self.nameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *phone = self.phoneTextField.text;
    
    if (self.contact) {
        if (!([name isEqualToString:@""] && [email isEqualToString:@""] && [phone isEqualToString:@""])) {
            [self.contactsController updateContact:self.contact withName:name email:email phone:phone];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else {
        if (!([name isEqualToString:@""] && [email isEqualToString:@""] && [phone isEqualToString:@""])) {
            CARContact *contact = [CARContact contactWithName:name email:email phone:phone];
            [self.contactsController addContact:contact];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

- (void)configureNavigationBar {
    if (self.contact) {
        self.title = @"Edit Contact";
    } else {
        self.title = @"Add Contact";
    }
    self.navigationController.navigationBar.prefersLargeTitles = NO;
}

- (void)dealloc {
    [_contact release];
    [_nameTextField release];
    [_emailTextField release];
    [_phoneTextField release];
    [_contactsController release];
    [super dealloc];
}

@end
