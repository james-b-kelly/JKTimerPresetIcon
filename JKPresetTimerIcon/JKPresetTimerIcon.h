//
//  JKPresetTimerIcon.h
//  WorkoutApp
//
//  Created by Jamie on 23/4/15.
//  Copyright (c) 2015 James Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JKPresetTimerIcon : NSObject

+ (UIImage *)imageOfTimerPresetIconWithText:(NSString *)text
                                       font:(UIFont *)font
                                  tintColor:(UIColor *)tintColor
                            backgroundColor:(UIColor *)backgroundColor;

@end
