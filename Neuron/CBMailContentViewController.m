//
//  CBMailContentViewController.m
//  Neuron
//
//  Created by 赵 佳 on 13-7-20.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import "CBMailContentViewController.h"


@implementation CBMailContentViewController

@synthesize mail;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//        [mailContent setText:mail.content];
//    }
//    return self;
//}

-(id)initMail:(CBMail *) mail{
    self = [super init];
    if (self) {
            // Custom initialization
        self.title=@"Mail Content";
        self.mail=mail;
        //[mailContent setText:mail.content];
        QRootElement *root=[self createForm];
        self =  [self initWithRoot:root];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    
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
    subForm.title = @"Subform";
    [subsection addElement:[[QLabelElement alloc] initWithTitle:@"Title" Value:mail.title]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    [subsection addElement:[[QLabelElement alloc] initWithTitle:@"Date" Value:[dateFormatter stringFromDate:mail.date]]];
    
    
    QSection *subsection2 = [[QSection alloc] initWithTitle:@"Content"];
    QTextElement *element2 = [[QTextElement alloc] initWithText:mail.content];
    element2.font = [UIFont boldSystemFontOfSize:12];
    
    [subsection2 addElement:element2];
    [subForm addSection:subsection];
    [subForm addSection:subsection2];
//    QSection *subsection2 = [[QSection alloc] init];
//    QButtonElement *myButton = [[QButtonElement alloc] initWithTitle:@"Change Entry"];
//    myButton.controllerAction = @"handleChangeEntryExample:";
//    [subsection2 addElement:myButton];
//    [subForm addSection:subsection2];
//    
//    QSection *subsection3 = [[QSection alloc] init];
//    QBooleanElement *bool1 = [[QBooleanElement alloc] initWithTitle:@"First option" BoolValue:YES];
//    bool1.onImage = [UIImage imageNamed:@"imgOn"];
//    bool1.offImage = [UIImage imageNamed:@"imgOff"];
//    [subsection3 addElement:bool1];
//    QBooleanElement *bool2 = [[QBooleanElement alloc] initWithTitle:@"Second option" BoolValue:NO];
//    bool2.onImage = [UIImage imageNamed:@"imgOn"];
//    bool2.offImage = [UIImage imageNamed:@"imgOff"];
//    bool2.controllerAction = @"exampleAction:";
//    [subsection3 addElement:bool2];
//    
//    
//    QSection *subsection4 = [[QSection alloc] init];
//    [subsection4 addElement:element2];
//    
//    
//    [subForm addSection:subsection3];
//    [subForm addSection:subsection4];
    return subForm;
}

@end
