//
//  LZJokeTextItem.h
//  Laughter
//
//  Created by lizhao on 16/1/12.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface LZJokeTextItem : NSObject

@property(nonatomic, strong) NSString *ct;
@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, assign) NSInteger type;

@property(nonatomic, assign) NSInteger itemHeight;
@end
