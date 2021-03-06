#import "MyBrowserPlugin.h"
#if __has_include(<my_browser/my_browser-Swift.h>)
#import <my_browser/my_browser-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "my_browser-Swift.h"
#endif

@implementation MyBrowserPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMyBrowserPlugin registerWithRegistrar:registrar];
}
@end
