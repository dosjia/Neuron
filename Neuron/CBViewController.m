//
//  CBViewController.m
//  Neuron
//
//  Created by 赵 佳 on 13-7-16.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import "CBViewController.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CBCommandCenterController.h"
#import <QuickDialog/QuickDialog.h>

@interface CBViewController ()

@end

@implementation CBViewController

@synthesize password;
@synthesize username;
@synthesize warn;

//-(id)init{
//    self=[super init];
//    if(self){
//        QRootElement *root = [[QRootElement alloc] init];
//        root.title = @"Hello World";
//        root.controllerName = @"CBViewController";
//        self= [CBViewController controllerForRoot:root];
//    }
//    return self;
//}
- (void)viewDidLoad
{
//    QEntryElement *input=[[QEntryElement alloc] initWithTitle:@"User Name" Value:@""];
//    [self.view addSubview:input];
    
    [super viewDidLoad];
    //CBCommandCenterController *newController=[[CBCommandCenterController alloc] init];
    //NSArray *controllerlist=[NSArray arrayWithObjects: newController,nil];
    //[self addChildViewController:newController];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)login:(id)sender{
    NSLog(@"Login button is pressed!");
    NSLog(password.text);
    NSLog(username.text);
    NSString *passwordInput=password.text;
    NSString *usernameInput=username.text;
    if(![passwordInput isEqualToString:usernameInput]){
        [UIView animateWithDuration:2.0
                delay: 0.0
                options: UIViewAnimationOptionRepeat
                animations:^{
                    warn.alpha = 1.0;
                }
                completion:^(BOOL finished){
                }];
    }else{
        [self.parentViewController transitionFromViewController:self.parentViewController.childViewControllers[1] toViewController:self.parentViewController.childViewControllers[0] duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            
        }completion:^(BOOL finished){
            
        }];
        
    }
//    [UIView beginAnimations:@"ToggleViews" context:nil];
//    [UIView setAnimationDuration:1.0];
//    warn.alpha = 0.0;
//    [UIView commitAnimations];
}

-(IBAction)resign:(id)sender{
    [(UITextField*)sender resignFirstResponder];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
