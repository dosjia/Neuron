//
//  CBLoginInfo.h
//  Neuron
//
//  Created by 赵 佳 on 13-7-22.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBLoginInfo : NSObject{
@private
    NSString *_password;
    NSString *_login;
}

@property(strong) NSString *login;
@property(strong) NSString *password;

@end