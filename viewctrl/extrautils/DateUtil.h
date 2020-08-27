//
//  DateUtil.h
//  viewctrl
//
//  Created by 欧阳明择 on 2020/8/23.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateUtil : NSObject

+(NSDate*) initDateWithYear: (int)year month:(int) month day: (int) day;

+(NSString*) formatDateToString: (NSDate*)date formatter: (NSString*) formatterString;

+(NSInteger) gyear: (NSDate*) date;

+(NSInteger) gmonth: (NSDate*) date;

+(NSInteger) gday: (NSDate*) date;

@end

NS_ASSUME_NONNULL_END
