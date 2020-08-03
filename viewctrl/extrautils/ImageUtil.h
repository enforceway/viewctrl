//
//  ImageUtil.h
//  viewctrl
//
//  Created by 欧阳明择 on 2020/7/31.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageUtil : NSObject

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
