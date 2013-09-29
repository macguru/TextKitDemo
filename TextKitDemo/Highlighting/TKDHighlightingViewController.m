//
//  TKDFirstViewController.m
//  TextKitDemo
//
//  Created by Max Seelemann on 29.09.13.
//  Copyright (c) 2013 Max Seelemann. All rights reserved.
//

#import "TKDHighlightingViewController.h"

#import "TKDHighlightingTextStorage.h"


@implementation TKDHighlightingViewController
{
	// Text storage must be held strongly, only the default storage is retained by the text view.
	TKDHighlightingTextStorage *_textStorage;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Replace text storage
	_textStorage = [TKDHighlightingTextStorage new];
	[_textStorage addLayoutManager: self.textView.layoutManager];
	
	// Load iText
	[_textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:[NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"iText" withExtension:@"txt"] usedEncoding:NULL error:NULL]];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear: animated];
	
	[NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillShowOrHide:) name:UIKeyboardWillShowNotification object:nil];
	[NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillShowOrHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear: animated];
	
	[NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
	[NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark - Keyboard status

- (void)keyboardWillShowOrHide:(NSNotification *)notification
{
	CGFloat newInset;
	if ([notification.name isEqualToString: UIKeyboardWillShowNotification])
		newInset = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
	else
		newInset = 20;
	
	[self.bottomInset setConstant: newInset];
}

@end
