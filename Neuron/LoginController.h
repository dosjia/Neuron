//
//  LoginController.h
//  Neuron
//
//  Created by 赵 佳 on 13-7-22.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuickDialog/QuickDialog.h>
@interface LoginController : QuickDialogController <QuickDialogStyleProvider, QuickDialogEntryElementDelegate> {
    
}

+ (QRootElement *)createDetailsForm;
+ (QRootElement *)createLoginForm;
@end
