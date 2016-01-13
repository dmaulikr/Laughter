//
//  LZJokeListTableViewCell.m
//  Laughter
//
//  Created by lizhao on 16/1/10.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "LZJokeListTableViewCell.h"
#import "Masonry.h"
#import "LZCommonDefines.h"
@interface LZJokeListTableViewCell ()

@property (nonatomic, assign) NSInteger height;

@end

@implementation LZJokeListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubViews];
        [self setupConstraints];
    }
    return self;
}



- (void)loadSubViews {
    [self jokeTitle];
    [self detailLbl];
}

- (void)setupConstraints {
    WEAK_SELF
    [_jokeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(weakSelf.contentView).insets(UIEdgeInsetsMake(5, 5, 0, 0));
        make.width.equalTo(weakSelf).offset(-10);
        make.height.equalTo(@14).priorityLow();
        
    }];
    [_detailLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.jokeTitle.mas_bottom).offset(5);
        make.left.right.equalTo(weakSelf.contentView).insets(UIEdgeInsetsMake(0, 5, 0, 5));
        make.bottom.equalTo(weakSelf.contentView).offset(-4);
    }];


}
#pragma mark - getters
- (UILabel *)jokeTitle {
    if (!_jokeTitle) {
        _jokeTitle = [[UILabel alloc] init];
        _jokeTitle.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_jokeTitle];
        _jokeTitle.backgroundColor = [UIColor redColor];
    }
    return _jokeTitle;
}

- (UILabel *)detailLbl {
    if (!_detailLbl) {
        _detailLbl = [[UILabel alloc] init];
        _detailLbl.font = [UIFont systemFontOfSize:12];
        _detailLbl.numberOfLines = 0;
        [self.contentView addSubview:_detailLbl];
        _detailLbl.backgroundColor = [UIColor greenColor];
    }
    return _detailLbl;
}

#pragma mark - setter

- (void)setItem:(LZJokeTextItem *)item {
    _item = item;
    self.jokeTitle.text = item.title;
    self.detailLbl.text = item.text;
}

@end
