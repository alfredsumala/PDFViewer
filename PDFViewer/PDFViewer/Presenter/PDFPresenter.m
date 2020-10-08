//
//  PDFPresenter.m
//  PDFViewer
//
//  Created by Alfred Sumala on 10/8/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import "PDFPresenter.h"

@interface PDFPresenter()
@property NSString *fileName;
@end

@implementation PDFPresenter

-(instancetype)initWithFileName:(NSString *)fileName {
    self = [super init];
    if(self){
        self.fileName = fileName;
    }
    
    return self;
}

-(nullable PDFDocument *)loadPDFDocumentWithFileName:(NSString *)title {
    NSString *shortFileName = [title stringByReplacingOccurrencesOfString:@".pdf" withString:@""];

    NSURL *url = [NSBundle.mainBundle URLForResource:shortFileName withExtension:@"pdf"];
    
    PDFDocument *document = [[PDFDocument alloc] initWithURL:url];
    
    return document;
}

-(nullable PDFDocument*)loadCurrentPDFDocument {
    return [self loadPDFDocumentWithFileName:self.fileName];
}
@end
