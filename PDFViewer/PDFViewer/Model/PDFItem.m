//
//  PDFFile.m
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import "PDFItem.h"

@implementation PDFItem


#pragma mark - XMLMappedObject
- (void)mapper:(nonnull XMLObjectMapper *)mapper foundString:(nonnull NSString *)string forElementNamed:(nonnull NSString *)elementName {
    if ([elementName isEqualToString:@"filename"]) {
        self.filename = string;
    }
    
    if ([elementName isEqualToString:@"description"]) {
        self.desc = string;
    }
}

@end
