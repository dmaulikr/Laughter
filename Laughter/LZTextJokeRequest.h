//
//  LZTextJokeRequest.h
//  Laughter
//
//  Created by lizhao on 16/1/10.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "YTKBaseRequest.h"
#import "LZJokeTextItem.h"
@interface LZTextJokeRequest : YTKBaseRequest

@property(nonatomic, assign)NSInteger pageIndex;
@property(nonatomic, strong)LZJokeTextItem *item;

@end
