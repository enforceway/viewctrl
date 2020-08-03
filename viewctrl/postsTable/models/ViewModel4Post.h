//
//  ViewModel4Post.h
//  viewctrl
//
//  Created by 欧阳明择 on 2020/7/31.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel4Post : NSObject

@property NSString* name;
@property NSInteger age;

+(ViewModel4Post *)makeName: (NSString *)name AndAge: (NSInteger) a;

@end

NS_ASSUME_NONNULL_END
