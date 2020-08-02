//
//  ColorUtil.h
//  viewctrl
//
//  Created by 欧阳明择 on 2020/7/31.
//  Copyright © 2020 欧阳明择. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorUtil : NSObject

+ (UIColor *) colorWithHexString: (NSString *)hexString alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END

