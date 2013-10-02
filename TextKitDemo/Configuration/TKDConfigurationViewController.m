//
//  TKDConfigurationViewController.m
//  TextKitDemo
//
//  Created by Max Seelemann on 29.09.13.
//  Copyright (c) 2013 Max Seelemann. All rights reserved.
//

#import "TKDConfigurationViewController.h"

@interface TKDConfigurationViewController ()

@property (weak, nonatomic) UITextView *otherTextView;
@property (weak, nonatomic) UITextView *thirdTextView;

@end

@implementation TKDConfigurationViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Load text
	NSTextStorage *sharedTextStorage = self.originalTextView.textStorage;
	[sharedTextStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:[NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"lorem" withExtension:@"txt"] usedEncoding:NULL error:NULL]];
	
	
	// Create a new text view on the original text storage
	NSLayoutManager *otherLayoutManager = [NSLayoutManager new];
	[sharedTextStorage addLayoutManager: otherLayoutManager];
	
	NSTextContainer *otherTextContainer = [NSTextContainer new];
	[otherLayoutManager addTextContainer: otherTextContainer];
	
	UITextView *otherTextView = [[UITextView alloc] initWithFrame:self.otherContainerView.bounds textContainer:otherTextContainer];
	otherTextView.backgroundColor = self.otherContainerView.backgroundColor;
	otherTextView.translatesAutoresizingMaskIntoConstraints = YES;
	otherTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	otherTextView.scrollEnabled = NO;
	
	[self.otherContainerView addSubview: otherTextView];
	self.otherTextView = otherTextView;
	
	
	// Create a second text view on the new layout manager text storage
	NSTextContainer *thirdTextContainer = [NSTextContainer new];
	[otherLayoutManager addTextContainer: thirdTextContainer];
	
	UITextView *thirdTextView = [[UITextView alloc] initWithFrame:self.thirdContainerView.bounds textContainer:thirdTextContainer];
	thirdTextView.backgroundColor = self.thirdContainerView.backgroundColor;
	thirdTextView.translatesAutoresizingMaskIntoConstraints = YES;
	thirdTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	[self.thirdContainerView addSubview: thirdTextView];
	self.thirdTextView = thirdTextView;
}

- (IBAction)endEditing:(UIBarButtonItem *)sender
{
	[self.view endEditing: YES];
}

@end