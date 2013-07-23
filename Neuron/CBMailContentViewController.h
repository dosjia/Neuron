//
//  CBMailContentViewController.h
//  Neuron
//
//  Created by 赵 佳 on 13-7-20.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBMail.h"
#import <QuickDialog/QuickDialog.h>

@interface CBMailContentViewController : QuickDialogController <QuickDialogStyleProvider, QuickDialogEntryElementDelegate> {
    CBMail *mail;
}

@property CBMail *mail;
- (QRootElement *)createForm ;
-(id)initMail:(CBMail *) mail;
@end
