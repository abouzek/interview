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
    
    self.title = @"Contacts";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self loadData];
}


#pragma mark - setup

- (void)loadData {
}


#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
