//
//  CBMailContentViewController.m
//  Neuron
//
//  Created by 赵 佳 on 13-7-20.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import "CBMailContentViewController.h"


@implementation CBMailContentViewController

@synthesize mail,mailContent,cell;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [mailContent setText:mail.content];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    [self cell].textLabel.text=mail.title;
    [self mailContent].text=mail.content;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
