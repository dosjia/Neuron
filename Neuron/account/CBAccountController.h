//
//  CBAccountController.h
//  Neuron
//
//  Created by 赵 佳 on 13-7-19.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBAccountController : UIViewController{
    NSMutableArray *accountList;
    IBOutlet UITableView *tableView;
}
@property(retain) NSMutableArray *accountList;
@property(retain) UITableView *tableView;;
@end
