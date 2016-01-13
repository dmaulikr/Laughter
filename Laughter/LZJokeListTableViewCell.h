//
//  LZJokeListTableViewCell.h
//  Laughter
//
//  Created by lizhao on 16/1/10.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZJokeTextItem.h"
@interface LZJokeListTableViewCell : UITableViewCell
@property (strong, nonatomic)  UILabel *jokeTitle;
@property (strong, nonatomic)  UILabel *detailLbl;

@property (strong, nonatomic)  LZJokeTextItem *item;

@end
