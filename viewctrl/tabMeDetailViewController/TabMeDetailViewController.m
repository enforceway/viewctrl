//
//  TabMeDetailViewController.m
//  viewctrl
//
//  Created by 欧阳明择 on 2020/8/2.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import "TabMeDetailViewController.h"
#import "DateUtil.h"

@interface TabMeDetailViewController()<UIScrollViewDelegate>

@property (strong,nonatomic) UIScrollView *scrollView;

@property(nonatomic, strong) SportingDetailViewController* detailViewLeft;
@property(nonatomic, strong) SportingDetailViewController* detailViewMiddle;
@property(nonatomic, strong) SportingDetailViewController* detailViewRight;
@property(nonatomic, strong) NSDate* detailOnShownDate;


@end

@implementation TabMeDetailViewController

+(TabMeDetailViewController*) makeInstance {
    TabMeDetailViewController* ntn = [[TabMeDetailViewController alloc] init];
    return ntn;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailOnShownDate = [NSDate date];
    self.edgesForExtendedLayout = UIRectEdgeNone;

//    self.navigationController.navigationBar.translucent = NO;
    
    // 初始化scrollview
    CGFloat scrollViewWidth = self.view.frame.size.width;
    CGFloat scrollViewHeight = self.view.frame.size.height;
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 0, scrollViewWidth, scrollViewHeight - CGRectGetHeight(self.navigationController.navigationBar.frame));
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    self.scrollView.contentOffset = CGPointMake(scrollViewWidth, 0);
    self.scrollView.contentSize = CGSizeMake(scrollViewWidth * 3, scrollViewHeight);
    self.scrollView.backgroundColor = [UIColor redColor];

    self.detailViewLeft = [[SportingDetailViewController alloc] init];
    self.detailViewLeft.view.frame = CGRectMake(0, 0, scrollViewWidth, scrollViewHeight);
    self.detailViewLeft.onShownDate = [DateUtil initDateWithYear: 2020 month: 8 day: 22];
    
    self.detailViewMiddle = [[SportingDetailViewController alloc] init];
    self.detailViewMiddle.view.frame = CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight);
    self.detailViewMiddle.onShownDate = [DateUtil initDateWithYear: 2020 month: 8 day: 23];
    
    self.detailViewRight = [[SportingDetailViewController alloc] init];
    self.detailViewRight.view.frame = CGRectMake(scrollViewWidth * 2, 0, scrollViewWidth, scrollViewHeight);
    self.detailViewRight.onShownDate = [DateUtil initDateWithYear: 2020 month: 8 day: 24];
    
    [self.scrollView addSubview: self.detailViewLeft.view];
    [self.scrollView addSubview: self.detailViewMiddle.view];
    [self.scrollView addSubview: self.detailViewRight.view];
    [self.view addSubview:self.scrollView];
}

//滚动时就会执行该方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"滑动中offset:(%f,%f)", scrollView.contentOffset.x, scrollView.contentOffset.y);
}

//即将开始滚动
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    NSLog(@"开始滚动");
}

//滚动已经完成
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"结束滑动offset:(%f,%f)", scrollView.contentOffset.x, scrollView.contentOffset.y);
    
    SportingDetailViewController* temp = self.detailViewLeft;
    CGFloat scrollViewWidth = self.view.frame.size.width;
    int currPage = scrollView.contentOffset.x / self.view.frame.size.width;
    if(currPage == 0) {
        NSLog(@"刚才向前滑动了");
        temp = self.detailViewLeft;
        self.detailViewLeft = self.detailViewRight;
        self.detailViewRight = self.detailViewMiddle;
        self.detailViewMiddle = temp;
        scrollView.contentOffset = CGPointMake(scrollViewWidth, 0);
    } else if(currPage == 1) {
        NSLog(@"刚才向后滑动了");
    } else {
        NSLog(@"刚才滑动了，但没有画面变动");
    }
    
}

//即将滚动完成
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
//    NSLog(@"滚动即将完成");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
