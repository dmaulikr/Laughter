//
//  ViewController.m
//  Laughter
//
//  Created by lizhao on 16/1/10.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "LZTextJokeListViewController.h"
#import "LZTextJokeRequest.h"
#import "LZJokeListTableViewCell.h"
#import "Masonry.h"
#import "MJRefresh.h"
#import "LZCommonDefines.h"
@interface LZTextJokeListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) LZTextJokeRequest *textJokeReq;
@property (nonatomic, strong) NSMutableArray *jokes;

@end

@implementation LZTextJokeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jokes = [NSMutableArray array];
    [self setupUI];
    [self loadRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    [self.tableView registerClass:[LZJokeListTableViewCell class] forCellReuseIdentifier:@"JokeListCell"];
    self.tableView.estimatedRowHeight = 88;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    __unsafe_unretained UITableView *tableView = self.tableView;
    WEAK_SELF
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.textJokeReq.pageIndex = 1;
        [weakSelf loadRequest];
    }];
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        weakSelf.textJokeReq.pageIndex += 1;
        [weakSelf loadRequest];
    }];
}

- (void)loadRequest {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
    [self.textJokeReq startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"success == %@",request.responseJSONObject);
        if (self.textJokeReq.pageIndex == 1) {
            [self.jokes removeAllObjects];
        }
        NSArray *tmpAry = request.responseJSONObject[@"showapi_res_body"][@"contentlist"];
        [self.jokes addObjectsFromArray:tmpAry];
        [self.tableView reloadData];
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"failed == %@",request);
    }];
}

#pragma mark tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.jokes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LZJokeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JokeListCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)configureCell:(LZJokeListTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.jokes[indexPath.row];
    LZJokeTextItem *item = [LZJokeTextItem mj_objectWithKeyValues:dict];
    cell.item = item;
}

#pragma mark - getters 

- (LZTextJokeRequest *)textJokeReq {
    if (!_textJokeReq) {
        _textJokeReq = [[LZTextJokeRequest alloc] init];
    }
    return _textJokeReq;
}


@end
