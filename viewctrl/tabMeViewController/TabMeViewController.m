//
//  TabMeViewController.m
//  viewctrl
//
//  Created by 欧阳明择 on 2020/7/31.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import "TabMeViewController.h"
#import "TabMeDetailViewController.h"
#import "ViewModel4Post.h"
#import "ColorUtil.h"

@interface TabMeViewController ()<UITableViewDataSource, UITableViewDelegate>

// 包含消息/我的数据,成绩单,周/年报,的表格
@property (strong, nonatomic) UITableView *postsTable;
@property(nonatomic, strong) NSArray* postsArray;
// 包含群组，设备，个人消息/我的数据,成绩单,周/年报,的表格


@end

@implementation TabMeViewController


-(void)setExtraCellLineHidden {
    UIView* view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self.postsTable setTableFooterView: view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize viewSize = [UIScreen mainScreen].bounds.size;

    self.postsTable = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, viewSize.width, viewSize.height - 340) style: UITableViewStylePlain];
    
//    [self.postsTable setSeparatorStyle: UITableViewCellSeparatorStyleNone];


    self.postsTable.delegate = self;
    self.postsTable.dataSource = self;
    [self setExtraCellLineHidden];

    // 初始化数据
    NSMutableArray* dataArray = [[NSMutableArray alloc] init];
    
    [dataArray addObject: [ViewModel4Post makeName: @"enforceway" AndAge: 10]];
    [dataArray addObject: [ViewModel4Post makeName: @"lizhaolongamd" AndAge: 10]];
    [dataArray addObject: [ViewModel4Post makeName: @"worldexpress" AndAge: 10]];

    self.postsArray = [dataArray copy];
    
    [self.view addSubview: self.postsTable];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    NSLog(@"count:%ld", [self.postsArray count]);
    return [self.postsArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"columns:%ld", [[self.postsArray objectAtIndex:section] count]);
    return 1; //[[self.postsArray objectAtIndex:section] count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TabMeDetailViewController* ntn = [TabMeDetailViewController makeInstance];

//    self.hidesBottomBarWhenPushed = YES;
    ntn.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController: ntn animated:YES];
//    self.hidesBottomBarWhenPushed = NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.设置复用[单元格]ID
    static NSString* cellIdentifier = @"cellIdentifier";

    // 2.设置复用
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];

    // 3.创建单元格
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: cellIdentifier];
    }

    NSLog(@"row:%ld, column: %ld", indexPath.section, indexPath.row);
    ViewModel4Post* viewPost = (ViewModel4Post *)[self.postsArray objectAtIndex: indexPath.section];
    cell.textLabel.text = viewPost.name; // [[self.postsArray objectAtIndex: indexPath.section] objectAtIndex: indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"mineprofile.jpg"];
    cell.detailTextLabel.text = [NSString stringWithFormat: @"%ld", viewPost.age];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

//    [cell layoutSubviews];
    return cell;
}

@end


