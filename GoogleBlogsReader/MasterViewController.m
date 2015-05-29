//
//  MasterViewController.m
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "NetworkManager.h"

@interface MasterViewController ()
@property (nonatomic, strong) NSArray *entitieslist;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    
    [[NetworkManager sharedNetworkManager] getBlogPostSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        // TODO: Parse object and reload data
        self.entitieslist = [[NetworkManager sharedNetworkManager] getEntitiesListFromResponse:responseObject];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // TODO: Error handling
    }];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Entry *object = [self.entitieslist objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.entitieslist count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Entry *entry = [self.entitieslist objectAtIndex:[indexPath row]];
    cell.textLabel.text = entry.title;
}

@end
