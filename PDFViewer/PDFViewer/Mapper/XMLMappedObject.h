//
//  XMLMappedObject.h
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLObjectMapper.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XMLMappedObject
- (void)mapper:(XMLObjectMapper *)mapper foundString:(NSString *)string forElementNamed:(NSString *)elementName;
@end

NS_ASSUME_NONNULL_END
