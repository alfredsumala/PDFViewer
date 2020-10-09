//
//  PDFFile.h
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLObjectMapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDFItem : NSObject <XMLMappedObject>
@property (nonatomic) NSString *filename;
@property (nonatomic) NSString *desc;
//-(instancetype)initWithTitle:(NSString*)title description:(NSString*)description;
@end

NS_ASSUME_NONNULL_END
