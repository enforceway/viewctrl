//
//  TabMeDetailViewController.h
//  viewctrl
//
//  Created by 欧阳明择 on 2020/8/2.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SportingDetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TabMeDetailViewController : UIViewController

@property IBOutlet UILabel* genderRequiredLabel;

+(TabMeDetailViewController*) makeInstance;
@end

NS_ASSUME_NONNULL_END
