//
//  YukeWxPayManager.m
//  NoteCourse
//
//  Created by Yuke on 2018/12/10.
//  Copyright © 2018 Yuke. All rights reserved.
//

#import "YukeWxAPIManager.h"

@interface YukeWxAPIManager ()

@property (nonatomic, strong) NSDictionary *weixinDict;

@property (nonatomic, copy)  void(^PayCallback)(int errCode);

@end

@implementation YukeWxAPIManager

+ (instancetype)sharedWXApiManager{
    static dispatch_once_t onceToken;
    static YukeWxAPIManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[YukeWxAPIManager alloc] init];
    });
    return instance;

}


- (void)onReq:(BaseReq *)req{
    
    
    
}

- (void)onResp:(BaseResp *)resp{
    
    if([resp isKindOfClass:[SendMessageToWXResp class]]) {
            /// 这里可以发送分享成功的通知
        if (resp.errCode == 0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"分享成功");
            });
        }
    } else if ([resp isKindOfClass:[SendAuthResp class]]) {
        //微信登录  oa 认证
        SendAuthResp *authResp = (SendAuthResp *)resp;
        if (authResp.errCode == 0) {

            NSString *wxCode = [NSString stringWithFormat:@"%@",authResp.code];
            NSLog(@"微信登录后得到的状态码:%@",wxCode);
            
        } else {
            NSLog(@"登录失败:%@",authResp.errStr);
        }
    }
    else if ([resp isKindOfClass:[PayResp class]]){
        PayResp *response = (PayResp *)resp;
        if (self.PayCallback) {
            self.PayCallback(response.errCode);
        }
    }
    
    
}

- (void)payWithPayReq:(PayReq *)req Completion:(void (^)(int))completion {

    [WXApi sendReq:req];

    if (completion) {
        self.PayCallback = [completion copy];
    }
}


- (void)YukeWXPayWithReq:(PayReq *)req Completion:(void (^)(int))completion{
    [WXApi sendReq:req];
    self.PayCallback = completion;
}


@end
