//
//  TKDCircleView.m
//  TextKitDemo
//
//  Created by Max Seelemann on 29.09.13.
//  Copyright (c) 2013 Max Seelemann. All rights reserved.
//

#import "TKDCircleView.h"

@implementation TKDCircleView

- (void)drawRect:(CGRect)rect
{
	[self.tintColor setFill];
	[[UIBezierPath bezierPathWithOvalInRect: self.bounds] fill];
}

@end
