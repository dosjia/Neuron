//
//  CBViewController.h
//  Neuron
//
//  Created by 赵 佳 on 13-7-16.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuickDialog/QuickDialog.h>

@interface CBViewController : UIViewController
{
    IBOutlet UITextField *username;
    IBOutlet UITextField *password;
    IBOutlet UILabel *warn;
}
@property(retain) UITextField *username;
@property(retain) UITextField *password;
@property(retain) UILabel *warn;
-(IBAction)login:(id)sender;
-(IBAction)resign:(id)sender;
@end
