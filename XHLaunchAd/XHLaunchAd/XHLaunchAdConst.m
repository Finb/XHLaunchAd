//
//  XHLaunchAdConst.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2017/9/18.
//  Copyright © 2017年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAdConst.h"

NSString *const XHCacheImageUrlStringKey = @"XHCacheImageUrlStringKey";
NSString *const XHCacheVideoUrlStringKey = @"XHCacheVideoUrlStringKey";

NSString *const XHLaunchAdWaitDataDurationArriveNotification = @"XHLaunchAdWaitDataDurationArriveNotification";
NSString *const XHLaunchAdDetailPageWillShowNotification = @"XHLaunchAdDetailPageWillShowNotification";
NSString *const XHLaunchAdDetailPageShowFinishNotification = @"XHLaunchAdDetailPageShowFinishNotification";
NSString *const XHLaunchAdGIFImageCycleOnceFinishNotification = @"XHLaunchAdGIFImageCycleOnceFinishNotification";
NSString *const XHLaunchAdVideoCycleOnceFinishNotification = @"XHLaunchAdVideoCycleOnceFinishNotification";
NSString *const XHLaunchAdVideoPlayFailedNotification = @"XHLaunchAdVideoPlayFailedNotification";

BOOL XHLaunchAdPrefersHomeIndicatorAutoHidden = NO;

UIEdgeInsets XHLaunchAdSafeAreaInsets(void){
    UIWindow *window = nil;
    if(@available(iOS 13.0, *)){
        for(UIScene *scene in [UIApplication sharedApplication].connectedScenes){
            if(![scene isKindOfClass:[UIWindowScene class]]) continue;
            UIWindowScene *windowScene = (UIWindowScene *)scene;
            if(windowScene.activationState != UISceneActivationStateForegroundActive) continue;
            /** UIWindowScene.keyWindow 为 iOS 15+ API,此处遍历 windows 查找 */
            for(UIWindow *sceneWindow in windowScene.windows){
                if(sceneWindow.isKeyWindow){ window = sceneWindow; break; }
            }
            if(!window && windowScene.windows.count) window = windowScene.windows.firstObject;
            break;
        }
    }
    if(!window){
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
        window = [UIApplication sharedApplication].keyWindow;
#pragma clang diagnostic pop
    }
    if(@available(iOS 11.0, *)){
        if(window.safeAreaInsets.top >= 44) return window.safeAreaInsets;
    }
    return UIEdgeInsetsMake(20, 0, 0, 0);
}

