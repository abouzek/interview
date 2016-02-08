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

@property (strong, nonatomic) NSArray *contacts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation ContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning - TODO: Set the title for this ViewController's navigation bar to be "Contacts"
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self setupContacts];
}


#pragma mark - setup

- (void)setupContacts {
    ContactsService *contactsService = [ContactsService new];
#warning - TODO: Use this ContactsService instance to get the Contact data for the UITableView and display it
}


#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
#warning - TODO: Push an instance of ContactDetailViewController on to the navigation stack which displays information about the contact row selected in the UITableView
}


#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning - TODO: Return the correct number of rows
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell"];
#warning - TODO: Populate the UITableViewCell prototype (layout in Main.storyboard) with the data for the appropriate Contact object (be sure to utilize the method you filled out in ContactTableViewCell)
    return cell;
}

@end
