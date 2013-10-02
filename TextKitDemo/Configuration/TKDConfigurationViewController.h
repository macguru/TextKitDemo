//
//  TKDConfigurationViewController.h
//  TextKitDemo
//
//  Created by Max Seelemann on 29.09.13.
//  Copyright (c) 2013 Max Seelemann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKDConfigurationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *originalTextView;

@property (weak, nonatomic) IBOutlet UIView *otherContainerView;
@property (weak, nonatomic) IBOutlet UIView *thirdContainerView;

- (IBAction)endEditing:(UIBarButtonItem *)sender;

@end
