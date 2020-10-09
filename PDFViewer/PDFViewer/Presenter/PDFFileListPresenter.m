//
//  PDFFileListPresenter.m
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import "PDFFileListPresenter.h"
#import "XMLObjectMapper.h"
#import "PDFItem.h"

@interface PDFFileListPresenter()<XMLObjectMapperDelegate>
@property NSBundle* bundle;
@property NSString* contentFilename;
@property XMLObjectMapper* mapper;
@property (nonatomic, copy) void (^completionBlock)(void);
@property BOOL retrieveImages;
@property int imageCount;
@end

@implementation PDFFileListPresenter

-(instancetype)initWithBundle:(NSBundle*)bundle filename:(NSString*)filename {
    self = [super init];
    if(self){
        _bundle = bundle;
        _contentFilename = filename;
        
        NSURL *url = [_bundle URLForResource:_contentFilename withExtension:@"xml"];
        NSData *xmlData = [NSData dataWithContentsOfURL:url];
        
        if (xmlData) {
            _mapper = [[XMLObjectMapper alloc] initWithData: xmlData];
            _mapper.delegate = self;
        }
    }
    
    return self;
}

-(void)startMappingWithCallBack:(void (^)(void))completion {
    _completionBlock = completion;
    [_mapper start];
}

-(NSArray*)filenames {
    
    NSMutableArray *fileNames = [NSMutableArray array];
    
    for (PDFItem *pdfItem in [_mapper mappedObjects]) {
        [fileNames addObject:pdfItem.filename];
    }
    
    return [fileNames copy];
}

-(NSArray*)descriptions {
    
    NSMutableArray *descriptions = [NSMutableArray array];
    
    for (PDFItem *pdfItem in [_mapper mappedObjects]) {
        [descriptions addObject:pdfItem.desc];
    }
    
    return [descriptions copy];
}

-(id<XMLMappedObject>)mapper:(XMLObjectMapper *)mapper startElementNamed:(NSString *)elementName withAttributes:(NSDictionary *)attributes currentObject:(id<XMLMappedObject>)currentObject {
    NSLog(@"%@", elementName);
    
    //initialize a PDFItem
    if ([elementName isEqualToString:@"pdf-item"]) {
        return [[PDFItem alloc] init];
    }
    
    if ([elementName isEqualToString:@"image-list"]) {
        self.retrieveImages = [attributes[@"retrieve_images"] isEqualToString:@"true"] ? YES : NO;
        self.imageCount = [attributes[@"image_count"] intValue];
    }
    
    return nil;
}
- (void)mapper:(nonnull XMLObjectMapper *)mapper endElementNamed:(nonnull NSString *)elementName currentObject:(nonnull id<XMLMappedObject>)currentObject completed:(BOOL)completed {
    NSLog(@"end %@", elementName);
    
    if (completed) {
        _completionBlock();
    }
}

@end
