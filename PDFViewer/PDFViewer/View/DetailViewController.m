//
//  DetailViewController.m
//  PDFViewer
//
//  Created by Alfred Sumala on 10/8/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import "DetailViewController.h"
#import "UIWindow+Orientation.h"

@interface DetailViewController()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(rotated) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    [self loadPDF];
}

-(BOOL)shouldAutorotate {
    return YES;
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

#pragma mark - Selector
-(void)toggleMenu {
    self.splitViewController.preferredDisplayMode = self.splitViewController.displayMode == UISplitViewControllerDisplayModeAllVisible ? UISplitViewControllerDisplayModeAutomatic : UISplitViewControllerDisplayModeAllVisible;
}

#pragma mark - Selectors
-(void)configureView {
    if ([UIDevice.currentDevice userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.navigationItem.leftBarButtonItem = nil;
        
        UIBarButtonItem * customButton =
        [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"sidebar.left"]
                                         style:UIBarButtonItemStylePlain
                                        target:[self.splitViewController displayModeButtonItem].target
                                        action:[self.splitViewController displayModeButtonItem].action];
        
        self.navigationItem.leftBarButtonItem = customButton;
    }
}


-(void)rotated {
    if ([UIWindow isLandscape] && [UIDevice.currentDevice userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.navigationItem.leftBarButtonItem = nil;
    } else {
        [self configureView];
    }
}

-(void)loadPDF {
    PDFDocument *document = [self.pdfPresenter loadCurrentPDFDocument];
    
    if (document) {
        self.pdfView.document = document;
        self.pdfView.hidden = NO;
    } else {
        self.pdfView.hidden = YES;
    }
}
@end
