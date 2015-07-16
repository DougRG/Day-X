//
//  ViewController.m
//  DayX
//
//  Created by Caleb Hicks on 4/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewDataSource.h"
#import "DetailViewController.h"
#import "EntryController.h"


@interface ListViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableViewCell *entryCell;

//@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet ListTableViewDataSource *dataSource;

@property (weak, nonatomic) IBOutlet UITableView *tableView;




@end

@implementation ListViewController


- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewEntry"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailViewController *viewController = segue.destinationViewController;
        
        Entry *entry =[EntryController sharedInstance].entries[indexPath.row];
        viewController.entry = entry;
    }
}









//  A Table View build I tried that was totally unnecessary since IB creates this information natively.


     //
//    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//
//    self.dataSource = [ListTableViewDataSource new];
//    self.tableView.dataSource = self.dataSource;
//    self.tableView.delegate = self;
//    
//    
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
