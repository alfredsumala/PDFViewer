//
//  DetailViewController.m
//  PDFViewer
//
//  Created by Alfred Sumala on 10/8/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([UIDevice.currentDevice userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage systemImageNamed:@"sidebar.left"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(toggleMenu) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem * customButton = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = customButton;

    }
}

#pragma mark - Selector
-(void)toggleMenu {
    self.splitViewController.preferredDisplayMode = self.splitViewController.displayMode == UISplitViewControllerDisplayModeAllVisible ? UISplitViewControllerDisplayModeAutomatic : UISplitViewControllerDisplayModeAllVisible;
}
@end
