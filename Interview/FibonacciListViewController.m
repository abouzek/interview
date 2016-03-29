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
    
    self.title = @"Fibonacci";
    
    self.tableView.dataSource = self;
}


#pragma mark - utility

- (NSUInteger)fibonacciNumberForIndex:(NSUInteger)index {
#warning - TODO: return the index'th Fibonacci number efficiently
// fib(n) = fib(n - 1) + fib(n - 2)
// fib(0) = 0, fib(1) = 1
    return 0;
}

@end
