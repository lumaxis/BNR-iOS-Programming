//
//  BNRHypnosisView.m
//
//
//  Created by Lukas Spieß on 13.03.14.
//  Copyright (c) 2014 Lukas Spieß. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x +currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    path.lineWidth = 10;
    
    [[UIColor lightGrayColor] setStroke];   
    
    [path stroke];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4,7), 3);
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:CGRectMake(bounds.origin.x+44, bounds.origin.y+44, bounds.size.width-88, bounds.size.height-88)];

    CGContextRestoreGState(currentContext);
    
    CGContextSaveGState(currentContext);
    [path addClip];
    CGFloat locations[2] = { 0.0 , 1.0 };
    CGFloat components[8] = { 0.0, 1.0, 0.0, 1.0,
                              1.0, 1.0, 0.0, 1.0 };
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGContextDrawLinearGradient(currentContext, gradient, CGPointMake(bounds.size.width/2,100), CGPointMake(bounds.size.width/2,bounds.size.height-100), 0);
    CGContextRestoreGState(currentContext);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
}

@end
