//
//  QFLineLabel.m
//  FavoriteFree
//
//  Created by leisure on 14-4-23.
//  Copyright (c) 2014年 leisure. All rights reserved.
//

#import "QFLineLabel.h"

@implementation QFLineLabel

- (void)dealloc{
    
    self.lineColor = nil;
   
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:rect];
    
    CGSize textSize;
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
    
    NSDictionary* attributes =@{NSFontAttributeName:self.font,NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(MAX_CANON, MAX_CANON) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    
    textSize.height=ceil(labelSize.height);
    textSize.width=ceil(labelSize.width);

    
//    CGSize textSize = [[self text] sizeWithFont:[self font]];
    CGFloat strikeWidth = textSize.width;
    CGRect lineRect;
    CGFloat origin_x;
    CGFloat origin_y = 0.0;
    
    
    if ([self textAlignment] == NSTextAlignmentRight) {
        
        origin_x = rect.size.width - strikeWidth;
        
    } else if ([self textAlignment] == NSTextAlignmentCenter) {
        
        origin_x = (rect.size.width - strikeWidth)/2 ;
        
    } else {
        
        origin_x = 0;
    }
    
    
    if (self.lineType == LineTypeUp) {
        
        origin_y =  2;
    }
    
    if (self.lineType == LineTypeMiddle) {
        
        origin_y =  rect.size.height/2;
    }
    
    if (self.lineType == LineTypeDown) {//下画线
        
        origin_y = rect.size.height - 2;
    }
    
    lineRect = CGRectMake(origin_x , origin_y, strikeWidth, 1);
    
    if (self.lineType != LineTypeNone) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGFloat R, G, B, A;
        UIColor *uiColor = self.lineColor;
        CGColorRef color = [uiColor CGColor];
        long numComponents = CGColorGetNumberOfComponents(color);
        
        if( numComponents == 4)
        {
            const CGFloat *components = CGColorGetComponents(color);
            R = components[0];
            G = components[1];
            B = components[2];
            A = components[3];
            CGContextSetRGBFillColor(context, R, G, B, 1.0);

        }
        
        CGContextFillRect(context, lineRect);
        
    }
}




@end
