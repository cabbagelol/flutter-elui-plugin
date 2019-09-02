#import "FlutterPluginEluiPlugin.h"
#import <flutter_plugin_elui/flutter_plugin_elui-Swift.h>

@implementation FlutterPluginEluiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPluginEluiPlugin registerWithRegistrar:registrar];
}
@end
