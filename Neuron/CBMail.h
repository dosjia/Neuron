//
//  CBMail.h
//  Neuron
//
//  Created by 赵 佳 on 13-7-20.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBMail : NSObject{
    NSDate *date;
    BOOL isRead;
    NSString *content;
    NSString *title;
}
@property(retain) NSDate *date;
@property BOOL isRead;
@property(retain) NSString *content;
@property(retain) NSString *title;

-(id) initWithRead:(BOOL) isRead mailTitle:(NSString *)title mailContent:(NSString *)content;
-(id) initWithRead:(BOOL) isRead mailTitle:(NSString *)title mailContent:(NSString *)content date:(NSData *) date;
@end
