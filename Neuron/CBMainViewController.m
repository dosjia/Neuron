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
    
    
    [self addChildViewController:tabBarController];
    NSLog(@"%d",self.childViewControllers.count);
    CBViewController *loginController=[[CBViewController alloc] initWithNibName:@"CBViewController" bundle:nil];
    //CBViewController *loginController=[[CBViewController alloc] init];
    [self addChildViewController:loginController];
    NSLog(@"%d",self.childViewControllers.count);
    
    //[[QuickDialogController alloc] controllerForRoot:<#(QRootElement *)#>];
    
    [self.view addSubview:loginController.view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
