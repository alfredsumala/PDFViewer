//
//  ViewController.m
//  PDFViewer
//
//  Created by Alfred Sumala on 10/8/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "PDFFileListPresenter.h"

@interface MasterViewController ()
@property IBOutlet UITableView *tableView;

@property (strong, nonatomic) PDFFileListPresenter *listPresenter;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _listPresenter = [[PDFFileListPresenter alloc] initWithBundle:NSBundle.mainBundle filename:@"contents"];
    [_listPresenter startMappingWithCallBack:^{
        [self.tableView reloadData];
    }];
    
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath:indexPath];
    cell.textLabel.text = [_listPresenter descriptions][indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_listPresenter filenames].count;
}

#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
        
        controller.pdfPresenter = [[PDFPresenter alloc] initWithFileName: [_listPresenter filenames][indexPath.row]];
    }
}


#pragma mark - Methods
-(void)configureView {

}

@end
