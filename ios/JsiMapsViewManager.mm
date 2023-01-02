#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"

@interface JsiMapsViewManager : RCTViewManager
@end

@implementation JsiMapsViewManager

RCT_EXPORT_MODULE(JsiMapsView)

- (UIView *)view
{
  return [[UIView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(color, NSString)

@end
