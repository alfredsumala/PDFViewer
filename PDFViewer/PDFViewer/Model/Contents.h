//
//  Contents.h
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDFModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Contents : NSObject
@property NSArray<PDFModel*> *pdfList;

@end

NS_ASSUME_NONNULL_END
