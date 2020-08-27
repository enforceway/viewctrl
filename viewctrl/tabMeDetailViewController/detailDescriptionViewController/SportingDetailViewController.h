//
//  SportingDetailViewController.h
//  viewctrl
//
//  Created by 欧阳明择 on 2020/8/23.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SportingDetailViewController : UIViewController

@property(nonatomic, strong) NSDate* onShownDate;

-(void) loadData;

@end

NS_ASSUME_NONNULL_END
