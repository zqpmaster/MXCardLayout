
#import "AppDelegate.h"
#import "ViewController.h"
#import "MXCardViewLayout.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    MXCardViewLayout *layout = [[MXCardViewLayout alloc] init];
    
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*2/3, [UIScreen mainScreen].bounds.size.height);
    
    ViewController *vc = [[ViewController alloc] initWithCollectionViewLayout:layout];
    UINavigationController *nav  = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.hidden = YES;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = nav;
    
    [_window makeKeyAndVisible];
    
    return YES;
}

@end
