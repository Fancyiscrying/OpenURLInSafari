//
//  SafariActivity.m
//  OpenURLInSafari
//
//  Created by Fancy on 16/2/29.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "SafariActivity.h"

@implementation SafariActivity


//获取动作的类型
- (NSString *)activityType
{
    return  NSStringFromClass([self class]);
    

}
//获取动作的图像
- (UIImage *)activetyImage
{

    return [UIImage imageNamed:@"1 37.png"];

}

//获取动作的标题

- (NSString *)activityTitle
{
    return NSLocalizedStringFromTable(@"open in Safari", NSStringFromClass([self class]), nil);
    

}

//返回一个布尔值，指示分享列表是否可以作用于指定的数据项

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{

    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[NSURL class]]&&[[UIApplication sharedApplication] canOpenURL:activityItem]) {
            return YES;
        }
    }
    return NO;
}
//为动作指定数据服务
- (void)prepareWithActivityItems:(NSArray *)activityItems
{

    
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[NSURL class]]&&[[UIApplication sharedApplication] canOpenURL:activityItem]) {
            self.url = activityItem;
        }



}

}

//执行服务

- (void)performActivity
{


    bool completed = NO;
    if (self.url) {
        completed = [[UIApplication sharedApplication] openURL:self.url];
    }
    [self activityDidFinish:completed];



}

@end
