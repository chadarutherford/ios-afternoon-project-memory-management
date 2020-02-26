//
//  CARContactsTableViewController.m
//  CARContacts
//
//  Created by Chad Rutherford on 2/26/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARContactsTableViewController.h"
#import "CARContactsDetailViewController.h"
#import "CARContactsController.h"
#import "CARContact.h"

@interface CARContactsTableViewController ()

@property (nonatomic, retain) CARContactsController *contactsController;

@end

@implementation CARContactsTableViewController

static NSString *const showAddSegue = @"ShowAddContactSegue";
static NSString *const showDetailSegue = @"ShowContactDetailSegue";
static NSString *const contactCell = @"ContactCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _contactsController = [[CARContactsController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configureNavigationBar];
    [self.tableView reloadData];
}
- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:showAddSegue sender:self];
}

- (void)configureNavigationBar {
    self.title = @"Contacts";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactsController.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:contactCell forIndexPath:indexPath];
    CARContact *contact = self.contactsController.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CARContact *contact = self.contactsController.contacts[indexPath.row];
        [self.contactsController removeContact:contact];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:showDetailSegue sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:showAddSegue]) {
        CARContactsDetailViewController *detailVC = segue.destinationViewController;
        detailVC.contactsController = self.contactsController;
    } else if ([segue.identifier isEqualToString:showDetailSegue]) {
        CARContactsDetailViewController *detailVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CARContact *contact = self.contactsController.contacts[indexPath.row];
        detailVC.contactsController = self.contactsController;
        detailVC.contact = contact;
    } else {
        return;
    }
}

- (void)dealloc {
    [_contactsController release];
    [super dealloc];
}

@end
