//
//  LoginController.m
//  Neuron
//
//  Created by 赵 佳 on 13-7-22.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import "LoginController.h"
#import <QuickDialog/QuickDialog.h>
#import "CBLoginInfo.h"

@interface LoginController ()
//- (void)onLogin:(QButtonElement *)buttonElement;
//- (void)onAbout;

@end

@implementation LoginController

-(id)init{
    NSLog(@"in the init!");
    self = [super init];
    if(self){
        QRootElement *root=[LoginController createLoginForm];
        self = (LoginController *) [self initWithRoot:root];
    }
    return self;
}
- (void)setQuickDialogTableView:(QuickDialogTableView *)aQuickDialogTableView {
    [super setQuickDialogTableView:aQuickDialogTableView];
    
    self.quickDialogTableView.backgroundColor = [UIColor colorWithRed:0.274 green:0.588 blue:0.275 alpha:1.0000];
    self.quickDialogTableView.bounces = NO;
    self.quickDialogTableView.styleProvider = self;
    
    ((QEntryElement *)[self.root elementWithKey:@"login"]).delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.52 green:0.717 blue:0.804 alpha:1.0000];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"About" style:UIBarButtonItemStylePlain target:self action:@selector(onAbout)];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.tintColor = nil;
}

//- (void)loginCompleted:(CBLoginInfo *)info {
//    [self loading:NO];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome" message:[NSString stringWithFormat: @"Hi %@, you're loving QuickForms!", info.login] delegate:self cancelButtonTitle:@"YES!" otherButtonTitles:nil];
//    [alert show];
//}
//
- (void)onLogin:(QButtonElement *)buttonElement {
    NSLog(@"%@",self.parentViewController.parentViewController.class);
    UIViewController *rootController=self.parentViewController.parentViewController;
    [rootController transitionFromViewController:rootController.childViewControllers[1] toViewController:rootController.childViewControllers[0] duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
    }completion:^(BOOL finished){
        
    }];
}

- (void)onAbout {
    QRootElement *details = [LoginController createDetailsForm];
    
    QuickDialogController *quickform = [QuickDialogController controllerForRoot:details];
    [self presentModalViewController:[[UINavigationController alloc] initWithRootViewController:quickform] animated:YES];
}

-(void) cell:(UITableViewCell *)cell willAppearForElement:(QElement *)element atIndexPath:(NSIndexPath *)indexPath{
    cell.backgroundColor = [UIColor colorWithRed:0.52 green:0.717 blue:0.804 alpha:1.0000];
    
    if ([element isKindOfClass:[QEntryElement class]]||[element isKindOfClass:[QBooleanElement class]]  || [element isKindOfClass:[QButtonElement class]]){
        cell.textLabel.textColor = [UIColor colorWithRed:0.2 green:0.4 blue:0.6 alpha:1.0000];
    }
}

+ (QRootElement *)createDetailsForm {
    QRootElement *details = [[QRootElement alloc] init];
    details.title = @"Details";
    details.controllerName = @"CBAboutController";
    details.grouped = YES;
    QSection *section = [[QSection alloc] initWithTitle:@"Information"];
    [section addElement:[[QTextElement alloc] initWithText:@"This is a demo app."]];
    [details addSection:section];
    return details;
}

+ (QRootElement *)createLoginForm {
    QRootElement *root = [[QRootElement alloc] init];
    root.controllerName = @"LoginController";
    root.grouped = YES;
    root.title = @"Login";
    
    QSection *main = [[QSection alloc] init];
    main.headerImage = @"logo";
    
    QEntryElement *login = [[QEntryElement alloc] init];
    login.title = @"Username";
    login.key = @"login";
    login.hiddenToolbar = YES;
    login.placeholder = @"johndoe@me.com";
    [main addElement:login];
    
    QEntryElement *password = [[QEntryElement alloc] init];
    password.title = @"Password";
    password.key = @"password";
    password.secureTextEntry = YES;
    password.hiddenToolbar = YES;
    password.placeholder = @"your password";
    [main addElement:password];
    QBooleanElement *boolElement = [[QBooleanElement alloc] initWithTitle:@"Save Account No." BoolValue:YES];
    boolElement.controllerAction = @"exampleAction:";
	boolElement.key = @"bool1";
    [main addElement:boolElement];
    
    [root addSection:main];
    
    QSection *btSection = [[QSection alloc] init];
    QButtonElement *btLogin = [[QButtonElement alloc] init];
    btLogin.title = @"Login";
    btLogin.controllerAction = @"onLogin:";
    [btSection addElement:btLogin];
    
    [root addSection:btSection];
//
//    btSection.footerImage = @"footer";
    
    return root;
}

- (BOOL)QEntryShouldChangeCharactersInRangeForElement:(QEntryElement *)element andCell:(QEntryTableViewCell *)cell {
    NSLog(@"Should change characters");
    return YES;
}

- (void)QEntryEditingChangedForElement:(QEntryElement *)element andCell:(QEntryTableViewCell *)cell {
    NSLog(@"Editing changed");
}


- (void)QEntryMustReturnForElement:(QEntryElement *)element andCell:(QEntryTableViewCell *)cell {
    NSLog(@"Must return");
    
}


@end
