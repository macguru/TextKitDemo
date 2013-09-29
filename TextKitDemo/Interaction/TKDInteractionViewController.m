//
//  TKDInteractionViewController.m
//  TextKitDemo
//
//  Created by Max Seelemann on 29.09.13.
//  Copyright (c) 2013 Max Seelemann. All rights reserved.
//

#import "TKDInteractionViewController.h"

#import "TKDCircleView.h"


@implementation TKDInteractionViewController
{
	CGPoint _panOffset;
}


- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Load text
	[self.textView.textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:[NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"lorem" withExtension:@"txt"] usedEncoding:NULL error:NULL]];
	
	// Set up circle pan
	[self.circleView addGestureRecognizer: [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(circlePan:)]];
	[self updateExclusionPaths];
}

- (void)circlePan:(UIPanGestureRecognizer *)pan
{
	// Capute offset in view on begin
	if (pan.state == UIGestureRecognizerStateBegan)
		_panOffset = [pan locationInView: self.circleView];
	
	// Update view location
	CGPoint location = [pan locationInView: self.view];
	CGPoint circleCenter = self.circleView.center;
	
	circleCenter.x = location.x - _panOffset.x + self.circleView.frame.size.width / 2;
	circleCenter.y = location.y - _panOffset.y + self.circleView.frame.size.width / 2;
	self.circleView.center = circleCenter;
	
	// Update exclusion path
	[self updateExclusionPaths];
}

- (void)updateExclusionPaths
{
	CGRect ovalFrame = [self.textView convertRect:self.circleView.bounds fromView:self.circleView];
	
	// Since text container does not know about the inset, we must shift the frame to container coordinates
	ovalFrame.origin.x -= self.textView.textContainerInset.left;
	ovalFrame.origin.y -= self.textView.textContainerInset.top;
	
	// Simply set the exclusion path
	UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect: ovalFrame];
	self.textView.textContainer.exclusionPaths = @[ovalPath];
}

@end
