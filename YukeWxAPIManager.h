//
//  YukeWxPayManager.h
//  NoteCourse
//
//  Created by Yuke on 2018/12/10.
//  Copyright © 2018 Yuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WXApi.h>
#import <WXApiObject.h>
#import <WechatAuthSDK.h>


NS_ASSUME_NONNULL_BEGIN

@interface YukeWxAPIManager : NSObject<WXApiDelegate>

+ (instancetype )sharedWXApiManager;


/**
 支付回调
 
 @param req         PayReq
 @param completion     0:成功    -1:错误    -2:用户取消
 */
- (void)YukeWXPayWithReq:(PayReq *)req Completion:(void(^)(int errCode))completion;



@end

NS_ASSUME_NONNULL_END
