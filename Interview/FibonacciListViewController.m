//
//  FibonacciListViewController.m
//  Interview
//
//  Created by Alan Bouzek on 3/23/16.
//  Copyright © 2016 hotschedules. All rights reserved.
//

#import "FibonacciListViewController.h"

#define FIBONACCI_ITEMS_AMOUNT 1000

static NSString * const kFibonacciTableViewCellReuseIdentifier = @"FibonacciTableViewCell";

@interface FibonacciListViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *fibonacciValues;

@end


@implementation FibonacciListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Fibonacci";
    self.fibonacciValues = [[NSMutableArray alloc] initWithCapacity:FIBONACCI_ITEMS_AMOUNT];
    
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kFibonacciTableViewCellReuseIdentifier];
}


#pragma mark - utility

- (double)fibonacciNumberForIndex:(NSUInteger)index {
//#warning - TODO: return the index'th Fibonacci number efficiently
// fib(n) = fib(n - 1) + fib(n - 2)
// fib(0) = 0, fib(1) = 1
    
    if (index < [self.fibonacciValues count]) {
        return [self.fibonacciValues[index] doubleValue];
    } else {
        double fibonacciValue = 0;
        if (index == 0 || index == 1) {
            fibonacciValue = (double)index;
        } else {
            double fibonacciPreValue = [self fibonacciNumberForIndex:index - 1];
            double fibonacciPrePreValue = [self fibonacciNumberForIndex:index - 2];
            fibonacciValue = round(fibonacciPreValue + fibonacciPrePreValue);
            
            if (fibonacciValue == INFINITY) {
                // If you would like get better accuracy, we should use some 3d party library that are working with stings instead of numeric values.
                // NOTE: For double type maximun fibonacci index == 1477.
                // NOTE: For float type maximun fibonacci index == 187.
                // NOTE: For long long type maximun fibonacci index == 93.
                NSLog(@"Calculation accuracy error.");
            }
        }
        
        [self.fibonacciValues insertObject:[NSNumber numberWithDouble:fibonacciValue] atIndex:index];
        return fibonacciValue;
    }
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return FIBONACCI_ITEMS_AMOUNT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFibonacciTableViewCellReuseIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"Idx %li val %.0f", (long)indexPath.row, [self fibonacciNumberForIndex:indexPath.row]];
    return cell;
}

@end
