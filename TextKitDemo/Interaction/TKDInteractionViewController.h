//
//  TKDInteractionViewController.h
//  TextKitDemo
//
//  Created by Max Seelemann on 29.09.13.
//  Copyright (c) 2013 Max Seelemann. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TKDCircleView;

@interface TKDInteractionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *clippyView;
@property (weak, nonatomic) IBOutlet TKDCircleView *circleView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
