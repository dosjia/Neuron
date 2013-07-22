//
//  CBMailContentViewController.h
//  Neuron
//
//  Created by 赵 佳 on 13-7-20.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBMail.h"
@interface CBMailContentViewController : UIViewController{
    CBMail *mail;
    IBOutlet UITableViewCell *cell;
    IBOutlet UITextView *mailContent;
}
@property CBMail *mail;
@property UITableViewCell *cell;
@property UITextView *mailContent;
@end
