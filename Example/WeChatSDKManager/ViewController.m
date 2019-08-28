//
//  ViewController.m
//  WeChatSDKManager
//
//  Created by Yuke on 2018/12/11.
//  Copyright © 2018 Yuke. All rights reserved.
//

#import "ViewController.h"
#import <YukeWxAPIManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [WXApi isWXAppInstalled];
}


@end
