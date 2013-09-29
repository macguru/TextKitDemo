//
//  TKDSecondViewController.m
//  TextKitDemo
//
//  Created by Max Seelemann on 29.09.13.
//  Copyright (c) 2013 Max Seelemann. All rights reserved.
//

#import "TKDLayoutingViewController.h"

#import "TKDLinkDetectingTextStorage.h"


@interface TKDLayoutingViewController () <NSLayoutManagerDelegate>
{
	// Text storage must be held strongly, only the default storage is retained by the text view.
	TKDLinkDetectingTextStorage *_textStorage;
}
@end

@implementation TKDLayoutingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Set delegate
	self.textView.layoutManager.delegate = self;
	
	// Replace text storage
	_textStorage = [TKDLinkDetectingTextStorage new];
	[_textStorage addLayoutManager: self.textView.layoutManager];
	
	// Load iText
	[_textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:[NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"layout" withExtension:@"txt"] usedEncoding:NULL error:NULL]];
}


#pragma mark - Layout

- (BOOL)layoutManager:(NSLayoutManager *)layoutManager shouldBreakLineByWordBeforeCharacterAtIndex:(NSUInteger)charIndex
{
	NSRange range;
	NSURL *linkURL = [layoutManager.textStorage attribute:NSLinkAttributeName atIndex:charIndex effectiveRange:&range];
	
	// Do not break lines in links unless absolutely required
	if (linkURL && charIndex > range.location && charIndex <= NSMaxRange(range))
		return NO;
	else
		return YES;
}

- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
	return floorf(glyphIndex / 100);
}

- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager paragraphSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
	return 10;
}


#pragma mark - Keyboard status

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

- (void)keyboardWillShowOrHide:(NSNotification *)notification
{
	CGFloat newInset;
	if ([notification.name isEqualToString: UIKeyboardWillShowNotification])
		newInset = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
	else
		newInset = 0;
	
	[self.bottomInset setConstant: newInset];
}

@end
