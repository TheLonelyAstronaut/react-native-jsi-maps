#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"

@interface JsiMapsViewManager : RCTViewManager
@end

@implementation JsiMapsViewManager

RCT_EXPORT_MODULE(JsiMapsView)
RCT_EXPORT_VIEW_PROPERTY(color, NSString)
RCT_EXPORT_VIEW_PROPERTY(onMapLoadEnd, RCTDirectEventBlock);

@end
