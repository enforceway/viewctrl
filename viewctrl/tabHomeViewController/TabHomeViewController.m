//
//  TabHomeViewController.m
//  viewctrl
//
//  Created by 欧阳明择 on 2020/7/31.
//  Copyright © 2020 欧阳明择. All rights reserved.
//

#import "TabHomeViewController.h"
// #import <JavaScriptCore/JavaScriptCore.h>
const NSString* callbackPrefix = @"$$";

@interface TabHomeViewController ()<WKUIDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation TabHomeViewController

-(void)loadLocalTmpl {
    self.webView.backgroundColor = [UIColor redColor];
    [self.webView loadFileURL:[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"] allowingReadAccessToURL:[[NSBundle mainBundle] bundleURL]];
}

-(void) loadWebTmpl {
    NSURL *url = [NSURL URLWithString: @"https://www.baidu.com"];
    // 根据URL创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    // WKWebView加载请求
    [self.webView loadRequest:request];
}

-(void)addScriptNames: (NSArray *)scriptArray {
    for(NSString* strp in scriptArray) {
        [self.webView.configuration.userContentController addScriptMessageHandler: self name: strp];
    }
}

-(void)initWebView {
    NSArray* scriptNameArray = [[NSArray alloc] initWithObjects: @"getLocale", @"getUserInfo", nil];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame: [UIScreen mainScreen].bounds configuration: config];
    WKUserContentController* userContent = [[WKUserContentController alloc] init];
    config.dataDetectorTypes = WKDataDetectorTypePhoneNumber;
    config.userContentController = userContent;
    self.webView.UIDelegate = self;
    [self addScriptNames: scriptNameArray];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initWebView];
//    [self loadWebTmpl: webView];
    [self loadLocalTmpl];
//  将WKWebView添加到视图
    [self.view addSubview: self.webView];
}

-(NSString*) makeEvaluateWithMethodName: (NSString*) methodName valueString: (id) dic {
    NSString* flattened = [self flatDictionary: dic];
    NSString *callJSString = [NSString stringWithFormat:@"%@%@_%@(%@)", callbackPrefix, methodName, @"callback", flattened];
    return callJSString;
}

-(NSString*) flatDictionary: (id) object {
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                               options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                 error:&error];
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
};

-(void)getLocale: (int) deviceId {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    [dic setObject: @"zh_CN" forKey: @"locale"];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString* callJSString = [self makeEvaluateWithMethodName: @"getLocale" valueString: dic];
        [self.webView evaluateJavaScript: callJSString completionHandler:^(id resultObject, NSError * _Nullable error) {
            if (!error)
            {
                NSLog(@"OC调 JS成功");
            }
            else
            {
                NSLog(@"OC调 JS 失败");
            }
        }];
    });
}

-(void)getUserInfo {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    [dic setObject: @"enforceway" forKey: @"username"];
    [dic setObject: @"8j881x-ppolodf]98x" forKey: @"userid"];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString* callJSString = [self makeEvaluateWithMethodName: @"getUserInfo" valueString: dic];
        [self.webView evaluateJavaScript: callJSString completionHandler:^(id resultObject, NSError * _Nullable error) {
            if (!error)
            {
                NSLog(@"OC调 JS成功");
            }
            else
            {
                NSLog(@"OC调 JS 失败");
            }
        }];
    });
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSDictionary* deviceInfo = message.body;
    if([message.name isEqualToString:@"getLocale"]) {
        NSString* deviceId = [deviceInfo objectForKey: @"deviceId"];
        [self getLocale: [deviceId intValue]];
    } else if([message.name isEqualToString:@"getUserInfo"]) {
        [self getUserInfo];
    }
}

- (void)webView:(WKWebView *)webView råßunJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    //    DLOG(@"msg = %@ frmae = %@",message,frame);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(alertController.textFields[0].text?:@"");
    }])];

    [self presentViewController:alertController animated:YES completion:nil];
}

@end

