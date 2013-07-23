//
//  CBAccountDetailControllerViewController.h
//  Neuron
//
//  Created by 赵 佳 on 13-7-23.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import <QuickDialog/QuickDialog.h>
#import "CBAccount.h"
@interface CBAccountDetailControllerViewController : QuickDialogController <QuickDialogStyleProvider, QuickDialogEntryElementDelegate> {
    CBAccount *account;
}
@property (retain) CBAccount *account;

- (id)initAccount:(CBAccount*) account;
@end
