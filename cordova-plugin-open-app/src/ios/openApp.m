#import "openApp.h"
#import <UIKit/UIKit.h>
#import <Cordova/CDVViewController.h>
#import <Cordova/CDVAvailability.h>

@implementation openApp

- (void)pluginInitialize {
}

- (void)close_plugin: (CDVInvokedUrlCommand*)command
{
    [[self topViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (void)open: (CDVInvokedUrlCommand*)command
{
    CDVViewController* viewController = [CDVViewController new];
    viewController.startPage = @"openApp/index.html";
    viewController.modalPresentationStyle = UIModalPresentationFullScreen;

    [[self topViewController] presentViewController:viewController animated:YES completion:nil];
}

- (UIViewController *)topViewController{
    return [self topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController *)topViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }

    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self topViewController:lastViewController];
    }

    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self topViewController:presentedViewController];
}

- (void)dealloc
{

}

@end
