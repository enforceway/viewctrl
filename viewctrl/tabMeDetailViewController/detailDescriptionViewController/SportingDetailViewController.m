//
//  SportingDetailViewController.m
//  viewctrl
//
//  Created by 欧阳明择 on 2020/8/23.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import "SportingDetailViewController.h"
#import "DateUtil.h"

@interface SportingDetailViewController ()

@property(nonatomic, strong) UILabel* label1;
@property(nonatomic, strong) UILabel* label2;

@end

@implementation SportingDetailViewController

-(void) loadData {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGSize size = self.view.frame.size;
    self.label1 = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, size.width, size.height / 5)];
    self.label1.text = @"111你提供的线索比较少，无法准确的判断。我只能把几种可能性都给你所，你自己去检查了。1卸载驱动程序，再重新安装。2在写字板里打一些英文字，看看能不能打出来。如果能，那么重新安装OFFICE或相应的软件、操作系统3把打印机连接到其它计算机上查看一下。如果在别的计算机上能够打出来，那你就要考虑重装系统。4找厂家维修。";    // Do any additional setup after loading the view.
    self.label1.numberOfLines = 0;
    self.label1.backgroundColor = [UIColor whiteColor];

    self.label2 = [[UILabel alloc] initWithFrame: CGRectMake(0, size.height / 5, size.width, size.height / 5)];
    self.label2.text = @"222你提供的线索比较少，无法准确的判断。我只能把几种可能性都给你所，你自己去检查了。1卸载驱动程序，再重新安装。2在写字板里打一些英文字，看看能不能打出来。如果能，那么重新安装OFFICE或相应的软件、操作系统3把打印机连接到其它计算机上查看一下。如果在别的计算机上能够打出来，那你就要考虑重装系统。4找厂家维修。";    // Do any additional setup after loading the view.
    self.label2.numberOfLines = 0;
    self.label2.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview: self.label1];
    [self.view addSubview: self.label2];
}

- (void)setOnShownDate:(NSDate *)onShownDate {
    CGSize size = self.view.frame.size;
    UILabel* showDateLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, size.height * 2 / 5, size.width, size.height / 6)];
    showDateLabel.numberOfLines = 0;
    NSString* formattedDate = [DateUtil formatDateToString: onShownDate formatter: @"yyyy-MM-dd"];
    showDateLabel.text = formattedDate;
    [self.view addSubview: showDateLabel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
