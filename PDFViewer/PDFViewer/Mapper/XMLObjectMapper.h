//
//  XMLParser.h
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class XMLObjectMapper;

@protocol XMLMappedObject <NSObject>
- (void)mapper:(XMLObjectMapper *)mapper foundString:(NSString *)string forElementNamed:(NSString *)elementName;
@end

@protocol XMLObjectMapperDelegate <NSObject>
- (id <XMLMappedObject>)mapper:(XMLObjectMapper *)mapper startElementNamed:(NSString *)elementName withAttributes:(NSDictionary *)attributes currentObject:(id <XMLMappedObject>)currentObject;

- (void)mapper:(XMLObjectMapper *)mapper endElementNamed:(NSString *)elementName currentObject:(id <XMLMappedObject>)currentObject completed:(BOOL)completed;
@end

@interface XMLObjectMapper : NSObject
@property (nonatomic, weak) id <XMLObjectMapperDelegate> delegate;

-(nullable instancetype)initWithData:(NSData*)data;
-(NSArray*)mappedObjects;
-(void)start;
@end





NS_ASSUME_NONNULL_END
