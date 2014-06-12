//====================================================================================================
// Author: Peter Chen
// Created: 6/9/14
// Copyright 2014 pchensoftware
//====================================================================================================

#import "UIView+PCSUtils.h"


@implementation UIView (PCSUtils)

+ (float)thinLineWidth {
   if ([UIScreen mainScreen].scale == 2)
      return 0.5;
   else
      return 1;
}

+ (BOOL)isTallScreen {
   return [UIScreen mainScreen].bounds.size.height > 480;
}

- (CGFloat)x {
   return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
   CGRect frame = self.frame;
   frame.origin.x = x;
   self.frame = frame;
}

- (CGFloat)y {
   return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
   CGRect frame = self.frame;
   frame.origin.y = y;
   self.frame = frame;
}

- (CGFloat)maxX {
   return CGRectGetMaxX(self.frame);
}

- (void)setMaxX:(CGFloat)maxX {
   CGRect frame = self.frame;
   frame.origin.x = maxX - self.width;
   self.frame = frame;
}

- (CGFloat)maxY {
   return CGRectGetMaxY(self.frame);
}

- (void)setMaxY:(CGFloat)maxY {
   CGRect frame = self.frame;
   frame.origin.y = maxY - self.height;
   self.frame = frame;
}

- (CGFloat)height {
   return self.bounds.size.height;
}

- (void)setHeight:(CGFloat)height {
   CGRect frame = self.frame;
   frame.size.height = height;
   self.frame = frame;
}

- (CGFloat)width {
   return self.bounds.size.width;
}

- (void)setWidth:(CGFloat)width {
   CGRect frame = self.frame;
   frame.size.width = width;
   self.frame = frame;
}

- (CGFloat)centerX {
   return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
   self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
   return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
   self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
   return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
   CGRect frame = self.frame;
   frame.origin = origin;
   self.frame = frame;
}

- (CGSize)size {
   return self.bounds.size;
}

- (void)setSize:(CGSize)size {
   CGRect frame = self.frame;
   frame.size = size;
   self.frame = frame;
}

- (CGPoint)bottomRight {
   return CGPointMake(self.maxX, self.maxY);
}

- (void)setBottomRight:(CGPoint)bottomRight {
   self.origin = CGPointMake(bottomRight.x - self.width, bottomRight.y - self.height);
}

- (CGPoint)bottomLeft {
   return CGPointMake(self.x, self.maxY);
}

- (void)setBottomLeft:(CGPoint)bottomLeft {
   self.origin = CGPointMake(bottomLeft.x, bottomLeft.y - self.height);
}

- (void)animatePulseToScale:(float)scale duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
   [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
      [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
         self.transform = CGAffineTransformMakeScale(scale, scale);
      }];
      [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
         self.transform = CGAffineTransformIdentity;
      }];
   } completion:nil];
}

- (void)addVisualConstraints:(NSString *)format views:(NSDictionary *)views {
   [self addVisualConstraints:format views:views metrics:nil];
}

- (void)addVisualConstraints:(NSString *)format views:(NSDictionary *)views metrics:(NSDictionary *)metrics {
   [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:metrics views:views]];
}

- (void)addManyVisualConstraints:(NSArray *)formats views:(NSDictionary *)views {
   [self addManyVisualConstraints:formats views:views metrics:nil];
}

- (void)addManyVisualConstraints:(NSArray *)formats views:(NSDictionary *)views metrics:(NSDictionary *)metrics {
   for (NSString *format in formats)
      [self addVisualConstraints:format views:views metrics:metrics];
}

@end
