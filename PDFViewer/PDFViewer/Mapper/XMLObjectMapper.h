//
//  XMLParser.h
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XMLObjectMapperDelegate


@end

@interface XMLObjectMapper : NSObject<NSXMLParserDelegate>
-(nullable instancetype)initWithUrl:(NSURL*)url;
@end

NS_ASSUME_NONNULL_END
