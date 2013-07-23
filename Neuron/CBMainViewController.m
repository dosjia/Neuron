//
//  CBMainViewController.m
//  
//
//  Created by 赵 佳 on 13-7-18.
//
//

#import "CBMainViewController.h"
#import "CBCommandCenterController.h"
#import "CBViewController.h"
#import "CBAccountController.h"
#import "CBMailViewController.h"
#import <QuickDialog/QuickDialog.h>
#import "LoginController.h"
@interface CBMainViewController ()

@end

@implementation CBMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"i'm here!");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.view=loginController.view;
    }
    return self;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"Before init");
    CBCommandCenterController *tabBarController=[[CBCommandCenterController alloc] initWithNibName:@"CBCommandCenterController" bundle:nil];
    //NSArray *controllerlist=[NSArray arrayWithObjects: newController,nil];
    //LoginController *tabBarController = (LoginController *) [[LoginController alloc] init];
    
    [self addChildViewController:tabBarController];
    NSLog(@"%d",self.childViewControllers.count);
    //CBViewController *loginController=[[CBViewController alloc] initWithNibName:@"CBViewController" bundle:nil];
    
    QRootElement *root=[LoginController createLoginForm];
    LoginController *loginController = (LoginController *) [[LoginController alloc] init];
    UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:loginController];
    navController;
    [self addChildViewController:navController];
    NSLog(@"%d",self.childViewControllers.count);
    NSLog(@"%f",[navController.view frame].size.height);
    NSLog(@"%f",[navController.view frame].size.width);
    NSLog(@"%f",[navController.view frame].origin.x);
    NSLog(@"%f",[navController.view frame].origin.y);
    NSLog(@"%f",[self.view frame].size.height);
    NSLog(@"%f",[self.view frame].size.width);
    NSLog(@"%f",[self.view frame].origin.x);
    NSLog(@"%f",[self.view frame].origin.y);
    [navController.view setFrame:CGRectMake(0, 0, 320, 548)];
//    [navController.view setBounds:CGRectMake(0, 0, 320, 540)];
//    [navController.toolbar setBounds:CGRectMake(-130, 0, 320, 44)];
//    NSLog(@"===%f",[navController.toolbar bounds].size.height);
//    NSLog(@"===%f",[navController.toolbar bounds].size.width);
//    NSLog(@"===%f",[navController.toolbar bounds].origin.x);
//    NSLog(@"===%f",[navController.toolbar bounds].origin.y);
    //navController.
    NSLog(@"%f",[navController.toolbar frame].size.height);
    NSLog(@"%f",[navController.toolbar frame].size.width);
    NSLog(@"%f",[navController.toolbar frame].origin.x);
    NSLog(@"%f",[navController.toolbar frame].origin.y);
    NSLog(@"%f",[self.view frame].size.height);
    NSLog(@"%f",[self.view frame].size.width);
    NSLog(@"%f",[self.view frame].origin.x);
    NSLog(@"%f",[self.view frame].origin.y);
    [self.view addSubview:navController.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
