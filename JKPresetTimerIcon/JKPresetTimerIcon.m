//
//  JKPresetTimerIcon.m
//  WorkoutApp
//
//  Created by Jamie on 23/4/15.
//  Copyright (c) 2015 James Kelly. All rights reserved.
//

#import "JKPresetTimerIcon.h"

@implementation JKPresetTimerIcon

+ (void)drawTimerPresetIconWithText:(NSString *)text
                               font:(UIFont *)font
                          tintColor:(UIColor *)tintColor
                    backgroundColor:(UIColor *)backgroundColor{
    
    CGRect frame = [JKPresetTimerIcon boundingRectWithText:text font:font];
    
    CGFloat lineWidth = 0.5;
    CGRect frameWithPadding = CGRectMake(lineWidth,
                                         lineWidth,
                                         CGRectGetWidth(frame) - lineWidth * 2,
                                         CGRectGetHeight(frame) - lineWidth * 2);
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: frameWithPadding
                                                             cornerRadius: 3];
    [tintColor setStroke];
    [backgroundColor setFill];
    rectanglePath.lineWidth = lineWidth;
    [rectanglePath stroke];
    [rectanglePath fill];
    
    //Draw text
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentCenter;
    NSDictionary* textFontAttributes = @{NSFontAttributeName: font, NSForegroundColorAttributeName: tintColor, NSParagraphStyleAttributeName: textStyle};
    CGRect textRect = [JKPresetTimerIcon textRectWithText:text font:font];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);

    CGRect offsetTextRect = CGRectMake(CGRectGetWidth(frame) / 2 - CGRectGetWidth(textRect) / 2,
                                       CGRectGetHeight(frame) / 2 - CGRectGetHeight(textRect) / 2 - 0.5,
                                       CGRectGetWidth(textRect),
                                       CGRectGetHeight(textRect));
    CGContextClipToRect(context, offsetTextRect);
    
    [text drawInRect:offsetTextRect  withAttributes: textFontAttributes];
    CGContextRestoreGState(context);
}

+ (UIImage *)imageOfTimerPresetIconWithText:(NSString *)text
                                       font:(UIFont *)font
                                  tintColor:(UIColor *)tintColor
                            backgroundColor:(UIColor *)backgroundColor {
    font = font?font:[UIFont systemFontOfSize:13.0];
    text = text.length?text:@"";
    tintColor = tintColor ? tintColor : [UIColor whiteColor];
    backgroundColor = backgroundColor ? backgroundColor : [UIColor clearColor];
    UIImage *iconImage = nil;
    CGRect rect = [JKPresetTimerIcon boundingRectWithText:text font:font];
    if (rect.size.height > 0 && rect.size.width > 0) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
        [JKPresetTimerIcon drawTimerPresetIconWithText:text font:font tintColor:tintColor backgroundColor:backgroundColor];
        iconImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return iconImage;
}

+ (CGRect)boundingRectWithText:(NSString *)text font:(UIFont *)font {
    CGRect textRect = [JKPresetTimerIcon textRectWithText:text font:font];
    CGFloat paddingVertical = 2.0;
    CGFloat paddingHorizontal = 6.0;
    CGRect frame = CGRectMake(0,
                              0,
                              CGRectGetWidth(textRect) + paddingHorizontal * 2,
                              CGRectGetHeight(textRect) + paddingVertical * 2);
    return frame;
}

+ (CGRect)textRectWithText:(NSString *)text font:(UIFont *)font {
    CGSize maxSize = CGSizeMake(200.0, 40.0);
    CGRect textRect = [text boundingRectWithSize:maxSize
                                         options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                      attributes:@{NSFontAttributeName:font}
                                         context:nil];
    return textRect;
}

@end
