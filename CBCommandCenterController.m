//
//  CBCommandCenterController.m
//  Neuron
//
//  Created by 赵 佳 on 13-7-18.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import "CBCommandCenterController.h"
#import "CBMailViewController.h"
#import "CBAccountController.h"

@interface CBCommandCenterController ()

@end

@implementation CBCommandCenterController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"init the 123 %@", nibNameOrNil);
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CBMailViewController *mailController=[[CBMailViewController alloc] initWithNibName:@"CBMailViewController" bundle:nil];
        UINavigationController *mailNavigationController=[[UINavigationController alloc] init];
        //[[mailNavigationController tabBarItem] setTitle:@"Mail"];
        mailNavigationController.title = @"First";
        mailNavigationController.tabBarItem.image = [UIImage imageNamed:@"first"];
        //[[mailNavigationController tabBarItem] setImage:[UIImage imageNamed:@"mail.PNG"]];
        [mailNavigationController pushViewController:mailController animated:NO];
        CBAccountController *accountController=[[CBAccountController alloc] initWithNibName:@"CBAccountController" bundle:nil];
        UINavigationController *accountNavigationController=[[UINavigationController alloc]init];
        [[accountNavigationController tabBarItem] setTitle:@"Account"];
        [accountNavigationController pushViewController:accountController animated:NO];
        NSArray *controllerArray=[NSArray arrayWithObjects:accountNavigationController,mailNavigationController,nil];
        [self setViewControllers:controllerArray];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"init the tab bar");
    //UITabBarItem *accountList=[[UITabBarItem alloc] initWithTitle:@"Account" image:nil tag:1];
    //UITabBarItem *mailBox=[[UITabBarItem alloc] initWithTitle:@"MailBox" image:nil tag:1];
    //[self setToolbarItems:[NSArray arrayWithObjects:accountList,mailBox,nil]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
