//
//  CBAboutController.m
//  Neuron
//
//  Created by 赵 佳 on 13-7-22.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import "CBAboutController.h"

@implementation CBAboutController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
}

- (void)close {
    [self dismissModalViewControllerAnimated:YES];
}


@end
