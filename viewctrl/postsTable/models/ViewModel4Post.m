//
//  ViewModel4Post.m
//  viewctrl
//
//  Created by 欧阳明择 on 2020/7/31.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import "ViewModel4Post.h"
@interface ViewModel4Post()

@end


@implementation ViewModel4Post

+(ViewModel4Post *)makeName: (NSString *)name AndAge: (NSInteger) a {
    ViewModel4Post* nPost = [[ViewModel4Post alloc] init];
    nPost.age = a;
    nPost.name = name;
    return nPost;
}

@end

