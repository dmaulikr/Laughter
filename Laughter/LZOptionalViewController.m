//
//  LZOptionalViewController.m
//  Laughter
//
//  Created by lizhao on 16/1/13.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "LZOptionalViewController.h"
#import "Masonry.h"
#import "LZTextJokeListViewController.h"    

static NSString* CellIdentifier = @"OptionCell";

@interface LZOptionalViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *optionalList;
@property (nonatomic, strong) NSArray *options;
@end

@implementation LZOptionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.optionalList];
    [self setupConstraints];
    [self initOptions];
    [self.optionalList registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initOptions {
    self.options = @[@"笑话",@"图片笑话"];
}

#pragma mark - tableview delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = self.options[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self pushToSelectVCByIndexPath:indexPath];
}

- (void)pushToSelectVCByIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            LZTextJokeListViewController *textJokeVC = [[LZTextJokeListViewController alloc] init];
            [self.navigationController pushViewController:textJokeVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - getters

- (UITableView *)optionalList {
    if (!_optionalList) {
        _optionalList = [[UITableView alloc] init];
        _optionalList.delegate = self;
        _optionalList.dataSource = self;
    }
    return _optionalList;
}

- (void)setupConstraints {
    [self.optionalList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
}

@end
