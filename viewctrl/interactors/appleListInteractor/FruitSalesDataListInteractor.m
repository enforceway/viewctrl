
//
//  FruitSalesDataListInteractor.m
//  viewctrl
//
//  Created by 欧阳明择 on 2020/8/5.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import "FruitSalesDataListInteractor.h"

// 从某一个版本开始，ios中请求必须是secure connection的。无论是
static NSString* const MOVIE_URL = @"https://www.enforceway.com/data/movies.json";

@implementation FruitSalesDataListInteractor

+(FruitSalesDataListInteractor*)shareInstance {
    static FruitSalesDataListInteractor * _sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //不能再使用alloc方法
        //因为已经重写了allocWithZone方法，所以这里要调用父类的分配空间的方法
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
};

-(void) requestSalesList {
//    NSString* SALSES_LIST = @"http://www.enforceway.com/data/movies.json";
//    NSString* GXURL = PURL;
//
//    GXURL = [GXURL stringByAppendingString:@"/index.php/Api/android_getRankByShow/eid/521"],GXURL;
//
//    NSURL* url = [NSURL URLWithString:GXURL];
//
//    NSString* gongxian = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//
//    NSData * data = [gongxian dataUsingEncoding:NSUTF8StringEncoding];//将string 转换成 NSdata
//
//    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];//将 NSdata转换成 字典
}

+(void) requestSalesList2 {
    NSMutableArray *arr;
    arr = [[NSMutableArray alloc]init];//全局
    
    NSURL *url = [NSURL URLWithString: MOVIE_URL];//获取网络资源
    
    NSURLRequest *request = [NSURLRequest requestWithURL: url];//建立一个请求
    
    NSURLResponse *response = nil;
    
    NSError *error = nil;
    
    //网络连接转换为数据类型
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    // [NSURLSession dataTaskWithRequest:completionHandler:]
    //用NSJSONSerialization把JSON数据解析成UI类型

    if(data != nil) {
        id jsonObject = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingAllowFragments error: &error];
        
        NSDictionary *dic = (NSDictionary *)jsonObject;
        
        //NSLog(@"%@",dic);
        NSString* title = [dic valueForKey:@"title"];
        NSString* description = [dic valueForKey:@"description"];
        NSDictionary* movieList = [dic valueForKey:@"movies"];
        NSLog(@"title: %@", title);
        NSLog(@"description: %@", description);
        arr = [[NSMutableArray alloc] init];
        for (NSDictionary *dic3 in movieList) {
            [arr addObject:[dic3 objectForKey:@"title"]];
        }
        NSLog(@"length:%ld", [arr count]);
    } else {
    
    }
}

// get请求
+(void)requestSalesList3 {
    NSURL *url = [NSURL URLWithString: MOVIE_URL];
    [[[NSURLSession sharedSession] dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id jsonObject = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingAllowFragments error: &error];
        [self responseHandler: jsonObject];
    }] resume];
}

+(void)responseHandler: (NSDictionary*) dic {
    NSMutableArray *arr;
    arr = [[NSMutableArray alloc]init];//全局
    //NSLog(@"%@",dic);
    NSString* title = [dic valueForKey:@"title"];
    NSString* description = [dic valueForKey:@"description"];
    NSDictionary* movieList = [dic valueForKey:@"movies"];
//    NSLog(@"title: %@", title);
//    NSLog(@"description: %@", description);
    arr = [[NSMutableArray alloc] init];
    for (NSDictionary *dic3 in movieList) {
        [arr addObject:[dic3 objectForKey:@"title"]];
    }
//    NSLog(@"length:%ld", [arr count]);
}


@end

