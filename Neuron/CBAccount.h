//
//  CBAccount.h
//  Neuron
//
//  Created by 赵 佳 on 13-7-21.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBAccount : NSObject{
    NSString *currencyCode;
    NSString *accountNo;
    NSNumber *amount;
    NSString *description;
    NSString *productCode;
}

@property(retain) NSString *currencyCode;
@property(retain) NSString *accountNo;
@property(retain) NSString *description;
@property(retain) NSString *productCode;
@property(retain) NSNumber *amount;

-(id) init;

@end
