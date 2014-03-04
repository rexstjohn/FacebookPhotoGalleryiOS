//
//  UIView+ImageCapture.m

#import "UIView+ImageCapture.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (ImageCapture)

-(UIImage*)captureViewImageAndSaveToDisk:(BOOL)saveToDisk{
    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(saveToDisk == YES){
        UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    }
    return viewImage;
}

@end
