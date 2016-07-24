//
//  ContactListViewController.m
//  Interview
//
//  Created by Alan Bouzek on 8/3/15.
//  Copyright (c) 2015 hotschedules. All rights reserved.
//

#import "ContactListViewController.h"
#import "Contact.h"
#import "ContactDetailViewController.h"
#import "ContactsService.h"
#import "ContactTableViewCell.h"

@interface ContactListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray <Contact *> *contacts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation ContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Contacts";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self loadData];
}


#pragma mark - setup

- (void)loadData {
    [ContactsService getContactsWithCompletionBlock:^(NSArray<Contact *> *contacts, NSError *error) {
        if (error == nil) {
            self.contacts = contacts;
            [self.tableView reloadData];
        } else {
            NSString *errorTittle = [NSString stringWithFormat:@"Error %li", (long)error.code];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:errorTittle
                                                                                     message:error.localizedDescription
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAlertAction = [UIAlertAction actionWithTitle:@"OK"
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:NULL];
            [alertController addAction:okAlertAction];
            [self presentViewController:alertController animated:YES completion:NULL];
        }
    }];
}

#pragma mark - UITableView DataSource and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const kContactsTableViewCellReuseIdentifier = @"ContactTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kContactsTableViewCellReuseIdentifier];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [((ContactTableViewCell *)cell) updateWithContact:self.contacts[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ContactDetailViewController *contactDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([ContactDetailViewController class])];
    contactDetailViewController.contact = self.contacts[indexPath.row];
    [self.navigationController pushViewController:contactDetailViewController animated:YES];
}
@end
