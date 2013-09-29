//
//  TKDConfigurationViewController.m
//  TextKitDemo
//
//  Created by Max Seelemann on 29.09.13.
//  Copyright (c) 2013 Max Seelemann. All rights reserved.
//

#import "TKDConfigurationViewController.h"

@implementation TKDConfigurationViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Take text storage from single view
	NSTextStorage *singleTextStorage = self.singleTextView.textStorage;
	
	
	// Connect first layout manager to the same text storage
	NSLayoutManager *firstLayoutManager = self.firstTextView.layoutManager;
	[singleTextStorage addLayoutManager: firstLayoutManager];
	
	// Connect the second text container to first layout manager
	NSTextContainer *secondTextContainer = self.secondTextView.textContainer;
	[firstLayoutManager addTextContainer: secondTextContainer];
	
	
	// Make sure the text rewraps in the first view
	self.firstTextView.contentSize = self.firstTextView.bounds.size;
	
	NSTextContainer *firstTextContainer = self.firstTextView.textContainer;
//	firstTextContainer.size = self.firstTextView.bounds.size;
	firstTextContainer.widthTracksTextView = YES;
	firstTextContainer.heightTracksTextView = YES;
}

- (IBAction)endEditing:(UIBarButtonItem *)sender
{
	[self.view endEditing: YES];
}

@end