//
//  LZTextJokeRequest.m
//  Laughter
//
//  Created by lizhao on 16/1/10.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "LZTextJokeRequest.h"
#import "ApiCommonDefines.h"
@implementation LZTextJokeRequest

- (NSString *)requestUrl {
    return JOKE_TEXT_API;
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    return @{@"apikey":API_KEY};
}

- (id)requestArgument {
    return @{@"page":@(self.pageIndex)};
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

@end
