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


- (void)viewDidLoad
{
    [super viewDidLoad];

	// Replace text storage
	_textStorage = [TKDHighlightingTextStorage new];
	[_textStorage addLayoutManager: self.textView.layoutManager];
	
	// Load iText
	[_textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:[NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"iText" withExtension:@"txt"] usedEncoding:NULL error:NULL]];
}

@end
