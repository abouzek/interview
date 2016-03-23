//
//  FibonacciListViewController.m
//  Interview
//
//  Created by Alan Bouzek on 3/23/16.
//  Copyright © 2016 hotschedules. All rights reserved.
//

#import "FibonacciListViewController.h"

@interface FibonacciListViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation FibonacciListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning - TODO: Set the title for this ViewController's navigation bar to be "Fibonacci"
    
    self.tableView.dataSource = self;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning - TODO: Return the max number of Fibonacci rows we can display
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#warning - TODO: Return a UITableViewCell with a label which displays the Fibonacci number for this row
    return [UITableViewCell new];
}


#pragma mark - utility

- (NSUInteger)fibonacciNumberForIndex:(NSUInteger)index {
#warning - TODO: return the index'th Fibonacci number efficiently
// fib(n) = fib(n - 1) + fib(n - 2)
// fib(0) = 0, fib(1) = 1
    return 0;
}

@end
