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
#import "PDFCell.h"

@interface MasterViewController () <UITableViewDataSource, UITableViewDelegate>
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
    self.tableView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PDFCell *cell;
    
    if ([_listPresenter filenames].count == indexPath.row) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"pdfCell"];
        cell.titleLabel.text = @"Dummy";
        cell.filenameLabel.text = @"File not found";
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier: @"pdfCell" forIndexPath:indexPath];
        cell.titleLabel.text = [_listPresenter descriptions][indexPath.row];
        cell.filenameLabel.text = [_listPresenter filenames][indexPath.row];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_listPresenter filenames].count + 1;
}

#pragma mark - UITableViewDataSource
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if ([_listPresenter filenames].count == indexPath.row) {
        [self showAlertWithMessage:@"File not found"];
        return;
    }
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        
        controller.pdfPresenter = [[PDFPresenter alloc] initWithFileName: [_listPresenter filenames][indexPath.row]];
    }
}

-(void)showAlertWithMessage:(NSString*)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
