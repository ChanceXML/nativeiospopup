#import <UIKit/UIKit.h>

extern "C" {
    void showNativeIOSPopup(const char* title, const char* message, const char* buttonLabel) {
        NSString* nsTitle = [NSString stringWithUTF8String:title];
        NSString* nsMessage = [NSString stringWithUTF8String:message];
        NSString* nsButtonLabel = [NSString stringWithUTF8String:buttonLabel];

        dispatch_async(dispatch_get_main_queue(), ^{
            // check if UIAlertController is available
            if ([UIAlertController class]) {
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:nsTitle
                                                                               message:nsMessage
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:nsButtonLabel
                                                                        style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {}];
                [alert addAction:defaultAction];

                UIWindow *keyWindow = nil;
                
                // handle modern iOS 13+ scene logic
                if (@available(iOS 13.0, *)) {
                    for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
                        if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                            for (UIWindow *window in windowScene.windows) {
                                if (window.isKeyWindow) {
                                    keyWindow = window;
                                    break;
                                }
                            }
                        }
                    }
                }
                
                // fallback for iOS 12 and below
                if (!keyWindow) {
                    keyWindow = [UIApplication sharedApplication].keyWindow;
                }
                
                UIViewController *rootViewController = keyWindow.rootViewController;
                if (rootViewController) {
                    [rootViewController presentViewController:alert animated:YES completion:nil];
                }
                
            } else {
                // legacy Fallback for iOS 7 and below
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nsTitle
                                                                message:nsMessage
                                                               delegate:nil
                                                      cancelButtonTitle:nsButtonLabel
                                                      otherButtonTitles:nil];
                [alert show];
            }
        });
    }
}
