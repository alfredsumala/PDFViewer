//
//  PDFPresenter.h
//  PDFViewer
//
//  Created by Alfred Sumala on 10/8/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PDFKit/PDFKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface PDFPresenter : NSObject
-(instancetype)initWithFileName:(NSString*)fileName;
-(nullable PDFDocument*)loadCurrentPDFDocument;
-(nullable PDFDocument*)loadPDFDocumentWithFileName:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
