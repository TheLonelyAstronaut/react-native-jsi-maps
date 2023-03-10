#import "JsiMapsView.h"
#import "react_native_jsi_maps-Swift.h"

#import <react/renderer/components/RNJsiMapsViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNJsiMapsViewSpec/EventEmitters.h>
#import <react/renderer/components/RNJsiMapsViewSpec/Props.h>
#import <react/renderer/components/RNJsiMapsViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface JsiMapsView () <RCTJsiMapsViewViewProtocol>

@end

@implementation JsiMapsView {
    BaseJsiMapsView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<JsiMapsViewComponentDescriptor>();
}

- (void)emitEvent
{
    auto emitter = std::static_pointer_cast<JsiMapsViewEventEmitter const>(self->_eventEmitter);
    emitter->onMapLoadEnd(JsiMapsViewEventEmitter::OnMapLoadEnd());
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const JsiMapsViewProps>();
    _props = defaultProps;
    _view = [[BaseJsiMapsView alloc] init];
      
      _view.emitEvent = @selector(emitEvent);

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<JsiMapsViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<JsiMapsViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor:[self hexStringToColor:colorToConvert]];
    }
    //self->_eventEmitter.

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> JsiMapsViewCls(void)
{
    return JsiMapsView.class;
}

- hexStringToColor:(NSString *)stringToConvert
{
    NSString *noHashString = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *stringScanner = [NSScanner scannerWithString:noHashString];
    
    unsigned hex;
    if (![stringScanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

@end
