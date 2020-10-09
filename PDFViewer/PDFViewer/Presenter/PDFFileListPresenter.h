//
//  PDFFileListPresenter.h
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PDFFileListPresenter : NSObject
-(instancetype)initWithBundle:(NSBundle*)bundle filename:(NSString*)filename;
-(NSArray*)filenames;
-(NSArray*)descriptions;
-(void)startMappingWithCallBack:(void (^)(void))completion;
@end

NS_ASSUME_NONNULL_END
