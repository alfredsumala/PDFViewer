//
//  DetailViewController.h
//  PDFViewer
//
//  Created by Alfred Sumala on 10/8/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDFPresenter.h"
#import <PDFKit/PDFKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property PDFPresenter *pdfPresenter;
@property IBOutlet PDFView *pdfView;
@end

NS_ASSUME_NONNULL_END
