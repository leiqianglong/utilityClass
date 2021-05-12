//
//  AppDelegate.m
//  FlowLayoutDemo
//
//  Created by 公智能 on 2021/5/11.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    self.window.rootViewController = nvc;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
