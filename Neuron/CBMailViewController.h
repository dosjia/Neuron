//
//  CBMailViewController.h
//  Neuron
//
//  Created by 赵 佳 on 13-7-19.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBMailViewController : UIViewController{
    NSMutableArray *mailList;
    IBOutlet UITableView *tableView;
}
@property NSMutableArray *mailList;
@property UITableView *tableView;
@end
