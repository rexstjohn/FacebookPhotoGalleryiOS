//
//  UIView+SimpleSizing.m

#import "UIView+SimpleSizing.h"

@implementation UIView (SimpleSizing)

-(void)setFrameX:(CGFloat)x{
    self.frame = CGRectMake(x,[self frameY],[self sizeWidth],[self sizeHeight]);
}

-(void)setFrameY:(CGFloat)y{
    self.frame = CGRectMake([self frameX],y,[self sizeWidth],[self sizeHeight]);
}

-(CGFloat)frameX{
    return self.frame.origin.x;
}

-(CGFloat)frameY{
    return self.frame.origin.y;
}

-(void)setSizeWidth:(CGFloat)width{
    self.frame = CGRectMake([self frameX],[self frameY],width, [self sizeHeight]);
}

-(void)setSizeHeight:(CGFloat)height{
    self.frame = CGRectMake([self frameX],[self frameY],[self sizeWidth], height);
}

-(CGFloat)sizeWidth{
    return self.frame.size.width;
}

-(CGFloat)sizeHeight{
    return self.frame.size.height;
}

-(void)setFramePosition:(CGPoint)position{
    self.frame = CGRectMake(position.x,position.y, [self sizeWidth], [self sizeHeight]);
}
@end
