//
//  XMLParser.m
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import "XMLObjectMapper.h"

static inline NSString *strip(NSString *string) {
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@interface XMLObjectMapper() <NSXMLParserDelegate>
@property (nonatomic) NSXMLParser *parser;
@property (nonatomic) NSMutableArray *elements;
@property (nonatomic) NSMutableArray *objects;
@property (nonatomic) NSMutableString *characters;
@property (nonatomic) NSString *initialElementName;
@end

@implementation XMLObjectMapper

-(nullable instancetype)initWithData:(NSData*)data {
    self = [super init];
    if(self){
        _parser = [[NSXMLParser alloc] initWithData:data];
        if (_parser){
            _parser.delegate = self;
            
            
        } else {
            return nil;
        }
    }
    
    return self;
}

#pragma mark - Selectors
-(void)clearString {
    _characters = nil;
}

-(NSArray *)mappedObjects {
    return [_objects copy];
}

-(void)start {
    _elements = [NSMutableArray array];
    _objects = [NSMutableArray array];
    
    [_parser parse];
}

#pragma mark - NSXMLParserDelegate
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    //get the initial elementName
    if (!_initialElementName) {
        _initialElementName = elementName;
    }
    
    [_elements addObject:elementName];
    
    //assign an object to map the element to
    id <XMLMappedObject> object = [self.delegate mapper:self startElementNamed:elementName withAttributes:attributeDict currentObject:[_objects lastObject]];
    
    if (object) {
        [self.objects addObject:object];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSAssert([[self.elements lastObject] isEqualToString:elementName], @"Attempt to end tag other than the current head.");
    
    [self.elements removeLastObject];
    
    id <XMLMappedObject> currentObject = [_objects lastObject];
    NSString *string = strip(_characters);
    if (string && [string length]) {
        //map the found string of the elements to the object
        [currentObject mapper:self foundString:string forElementNamed:elementName];
//        [_objects removeLastObject];
    }
    
    [self clearString];
    
    BOOL completed = [elementName isEqualToString:_initialElementName];
    [self.delegate mapper:self endElementNamed:elementName currentObject:currentObject completed:completed];
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!_characters) {
        _characters = [[NSMutableString alloc] init];
    }

    [_characters appendString:string];
}
@end
