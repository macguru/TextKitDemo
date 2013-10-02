//
//  TKDConfigurationViewController.m
//  TextKitDemo
//
//  Created by Max Seelemann on 29.09.13.
//  Copyright (c) 2013 Max Seelemann. All rights reserved.
//

#import "TKDConfigurationViewController.h"

@interface TKDConfigurationViewController ()

@property (weak, nonatomic) UITextView *firstTextView;
@property (weak, nonatomic) UITextView *secondTextView;

@end

@implementation TKDConfigurationViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Load text
	NSTextStorage *upperTextStorage = self.singleTextView.textStorage;
	[upperTextStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:[NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"lorem" withExtension:@"txt"] usedEncoding:NULL error:NULL]];
	
	
	// Create a new text view on the original text storage
	NSLayoutManager *lowerLayoutManager = [NSLayoutManager new];
	[upperTextStorage addLayoutManager: lowerLayoutManager];
	
	NSTextContainer *firstTextContainer = [NSTextContainer new];
	[lowerLayoutManager addTextContainer: firstTextContainer];
	
	UITextView *firstTextView = [[UITextView alloc] initWithFrame:self.firstContainerView.bounds textContainer:firstTextContainer];
	firstTextView.backgroundColor = self.firstContainerView.backgroundColor;
	firstTextView.translatesAutoresizingMaskIntoConstraints = YES;
	firstTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	firstTextView.scrollEnabled = NO;
	
	[self.firstContainerView addSubview: firstTextView];
	self.firstTextView = firstTextView;
	
	
	// Create a second text view on the new layout manager text storage
	NSTextContainer *secondTextContainer = [NSTextContainer new];
	[lowerLayoutManager addTextContainer: secondTextContainer];
	
	UITextView *secondTextView = [[UITextView alloc] initWithFrame:self.secondContainerView.bounds textContainer:secondTextContainer];
	secondTextView.backgroundColor = self.secondContainerView.backgroundColor;
	secondTextView.translatesAutoresizingMaskIntoConstraints = YES;
	secondTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	[self.secondContainerView addSubview: secondTextView];
	self.secondTextView = secondTextView;
}

- (IBAction)endEditing:(UIBarButtonItem *)sender
{
	[self.view endEditing: YES];
}

@end