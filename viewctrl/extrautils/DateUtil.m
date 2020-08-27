//
//  DateUtil.m
//  viewctrl
//
//  Created by 欧阳明择 on 2020/8/23.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

+(NSDate*) initDateWithYear: (int)year month:(int) month day: (int) day {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone: [NSTimeZone systemTimeZone]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate* date = [formatter dateFromString: [NSString stringWithFormat: @"%d-%d-%d", year, month, day]];
    return date;
}

+(NSString*) formatDateToString: (NSDate*)date formatter: (NSString*) formatterString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterString];
    NSString *currentDateString = [formatter stringFromDate: date];
    return currentDateString;
}

+(NSInteger) gyear: (NSDate*) date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    return [[formatter stringFromDate:date] integerValue];
}

+(NSInteger) gmonth: (NSDate*) date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM"];
    return [[formatter stringFromDate:date] integerValue];
}

+(NSInteger) gday: (NSDate*) date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];
    return [[formatter stringFromDate:date] integerValue];
}


@end
