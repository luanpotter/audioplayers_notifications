#import "AudioplayersNotificationsPlugin.h"
#if __has_include(<audioplayers_notifications/audioplayers_notifications-Swift.h>)
#import <audioplayers_notifications/audioplayers_notifications-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "audioplayers_notifications-Swift.h"
#endif

@implementation AudioplayersNotificationsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAudioplayersNotificationsPlugin registerWithRegistrar:registrar];
}
@end
