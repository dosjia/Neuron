//
//  CBAccountDetailControllerViewController.m
//  Neuron
//
//  Created by 赵 佳 on 13-7-23.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import "CBAccountDetailControllerViewController.h"
#import "CBAccount.h"

@implementation CBAccountDetailControllerViewController

@synthesize account;

- (id)initAccount:(CBAccount*) account{
    
    self = [super init];
    if (self) {
        // Custom initialization
        self.account=account;
        QRootElement *root=[self createForm];
        self =  [self initWithRoot:root];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (QRootElement *)createForm {
    QRootElement *subForm = [[QRootElement alloc] init];
    QSection *subsection = [[QSection alloc] init];
    subForm.grouped = YES;
    subForm.title = @"Account";
    [subsection addElement:[[QLabelElement alloc] initWithTitle:@"Account No" Value:account.accountNo]];
    [subsection addElement:[[QLabelElement alloc] initWithTitle:@"Currency Code" Value:account.currencyCode]];
    [subsection addElement:[[QLabelElement alloc] initWithTitle:@"Description" Value:account.description]];
    [subsection addElement:[[QLabelElement alloc] initWithTitle:@"Balence" Value:[account.amount stringValue]]];
    
    
//    QSection *subsection2 = [[QSection alloc] initWithTitle:@"Content"];
//    QTextElement *element2 = [[QTextElement alloc] initWithText:mail.content];
//    element2.font = [UIFont boldSystemFontOfSize:12];
    
//    [subsection2 addElement:element2];
    [subForm addSection:subsection];
//    [subForm addSection:subsection2];
    
    return subForm;
}
@end
