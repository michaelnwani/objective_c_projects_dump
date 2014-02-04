//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Michael Nwani on 1/1/13.
//  Copyright (c) 2013 Michael Nwani. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //All HypnosisView's start with a clear background color
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    
    return self;
}

-(void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    //Drawing a circle in the center of the bounds (HypnosisView's boundary) rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //The radius of the circle should be nearly as big as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    //The thickness of the line should be 10 points wide
    CGContextSetLineWidth(ctx, 10);
    
    //The color of the line should be gray (red/green/blue = 0.6, alpha = 1.0)
    //CGContextSetRGBStrokeColor(ctx, 1.0, 0.6, 0.6, 1.0);
    //CGContextSetRGBStrokeColor(ctx, 1.0, .01254, .1019, 1.0);
    [[self circleColor] setStroke];
    
    
    //Draw concentric circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        //Add a path to the context
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        
        //Perform drawing instruction; removes path
        CGContextStrokePath(ctx);
    }
    
    //Create a string
    NSString *text = @"You are getting sleepy.";
    
    //Get a font to draw it in
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    //How big is this string when drawn in this font?
    textRect.size = [text sizeWithFont:font];
    
    //Let's put that string in the center of the view
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    //Set the fill color of the current context to black
    [[UIColor blackColor] setFill];
    
    //The shadow will move 4 points to the right and 3 points down from the text
    CGSize offset = CGSizeMake(4, 3);
    
    //The shadow will be dark gray in color
    CGColorRef color = [[UIColor whiteColor] CGColor];
    
    //Set the shadow of the context with these parameters,
    //all subsequent drawing will be shadowed
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    
    //Draw the string
    [text drawInRect:textRect withFont:font];
}
-(void)setCircleColor:(UIColor *)clr
{
    circleColor = clr;
    [self setNeedsDisplay];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        int randomValue = rand() % 70;
        if (randomValue < 10)
        {
        NSLog(@"Device started shaking!");
        [self setCircleColor:[UIColor redColor]];
        }
        if (randomValue >= 10 && randomValue < 20)
        {
            NSLog(@"Device started shaking!");
            [self setCircleColor:[UIColor yellowColor]];
        }
        if (randomValue >= 20 && randomValue < 30)
        {
            NSLog(@"Device started shaking!");
            [self setCircleColor:[UIColor blueColor]];
        }
        if (randomValue >= 30 && randomValue < 40)
        {
            NSLog(@"Device started shaking!");
            [self setCircleColor:[UIColor blackColor]];
        }
        if (randomValue >= 40 && randomValue < 50)
        {
            NSLog(@"Device started shaking!");
            [self setCircleColor:[UIColor greenColor]];
        }
        if (randomValue >= 50 && randomValue < 60)
        {
            NSLog(@"Device started shaking!");
            [self setCircleColor:[UIColor orangeColor]];
        }
        if (randomValue >= 60 && randomValue < 70)
        {
            NSLog(@"Device started shaking!");
            [self setCircleColor:[UIColor purpleColor]];
        }
    }
}

@end
