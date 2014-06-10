//====================================================================================================
// Author: Peter Chen
// Created: 6/9/14
// Copyright 2014 pchensoftware
//====================================================================================================

#import <Foundation/Foundation.h>

#define UIViewAutoresizeHW          (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth)
#define UIViewAutoresizeHoriCenter  (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin)
#define UIViewAutoresizeVertCenter  (UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)
#define UIViewAutoresizeCenter      (UIViewAutoresizeHoriCenter | UIViewAutoresizeVertCenter)
#define UIViewAutoresizeBottomRight (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin)

@interface UIView (PCSUtils)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat maxY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint bottomRight;
@property (nonatomic, assign) CGPoint bottomLeft;

+ (float)thinLineWidth;

@end
