#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <WFChatClient/WFCCNetworkService.h>

@interface AppDelegate()<ConnectionStatusDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    [WFCCNetworkService.sharedInstance setServerAddress:@"152.136.93.14:1883"];
    [WFCCNetworkService.sharedInstance connect:@"010E0EWW" token:@"ZEznXDmtV5Cx8gNiyymVfLrXanvBBMJhoI20I4PcPncAFHDxFAT/ykSmu04oKwJOoSSHS/fp7o8d8w42fMO980HZKz9ObV5cu7khD2KruX5EEToItltZKe+qfLlPTHy3W/ZlheKXbquaVtSmxAPLLtYgIhiKXvKlO+ncmjIaVoQ="];
    WFCCNetworkService.sharedInstance.connectionStatusDelegate = self;

  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}



- (void)onConnectionStatusChanged:(ConnectionStatus)status {
    
}


@end
