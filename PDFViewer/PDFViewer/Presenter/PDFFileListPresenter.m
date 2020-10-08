//
//  PDFFileListPresenter.m
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import "PDFFileListPresenter.h"
#import "XMLObjectMapper.h"

@interface PDFFileListPresenter()
@property NSBundle* bundle;
@property NSString* contentFileName;
@property XMLObjectMapper* mapper;
@end

@implementation PDFFileListPresenter

-(instancetype)initWithBundle:(NSBundle*)bundle fileName:(NSString*)fileName {
    self = [super init];
    if(self){
        _bundle = bundle;
        _contentFileName = fileName;
        
        NSURL *url = [_bundle URLForResource:_contentFileName withExtension:@"xml"];
        
        _mapper = [[XMLObjectMapper alloc] initWithUrl:url];
    }
    
    return self;
}

-(NSArray*)fileNames {
    
    return [NSArray array];
}

@end
