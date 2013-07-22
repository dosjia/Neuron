//
//  CBMail.m
//  Neuron
//
//  Created by 赵 佳 on 13-7-20.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import "CBMail.h"

@implementation CBMail
@synthesize content,title,date,isRead;
-(id) init{
    self = [self initWithRead:NO mailTitle:@"" mailContent:@""];
    return self;
}
-(id) initWithRead:(BOOL) _isRead mailTitle:(NSString *)title mailContent:(NSString *)content{
    return [self initWithRead:_isRead mailTitle:title mailContent:content date:[[NSDate alloc] init]];
    
}
-(id) initWithRead:(BOOL) _isRead mailTitle:(NSString *)title mailContent:(NSString *)content date:(NSDate *) date{
    self = [super init];
    if(self){
        self.date =date;
        self.isRead= _isRead;
        self.content=content;
        self.title=title;
    }
    return self;
}
@end
