//
//  XMLParser.m
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import "XMLObjectMapper.h"
@interface XMLObjectMapper()
@property NSXMLParser* parser;
@property NSMutableString *element;
@end

@implementation XMLObjectMapper

-(nullable instancetype)initWithUrl:(NSURL*)url {
    self = [super init];
    if(self){
        _parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        if (_parser){
            _parser.delegate = self;
            [_parser parse];
        } else {
            return nil;
        }
    }
    
    return self;
}


#pragma mark - NSXMLParserDelegate
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    NSLog(@"Started Element %@", elementName);
    _element = [NSMutableString string];
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"element: %@ = %@", elementName, _element);
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if(!_element) {
        _element = [[NSMutableString alloc] init];
    }
    
    [_element appendString:string];
}
@end
