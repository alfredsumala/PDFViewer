//
//  UIWindow+Orientation.m
//  PDFViewer
//
//  Created by Alfred Sumala on 10/9/20.
//  Copyright © 2020 Alfred Sumala. All rights reserved.
//

#import "UIWindow+Orientation.h"

@implementation UIWindow (Orientation)
+ (BOOL)isLandscape
{
    if (@available(iOS 13.0, *)) {
        UIWindow *firstWindow = [[[UIApplication sharedApplication] windows] firstObject];
        if (firstWindow == nil) { return NO; }

        UIWindowScene *windowScene = firstWindow.windowScene;
        if (windowScene == nil){ return NO; }

        return UIInterfaceOrientationIsLandscape(windowScene.interfaceOrientation);
    } else {
        return (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation));
    }
}
@end
