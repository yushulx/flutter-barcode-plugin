#import "BarcodeReaderPlugin.h"
#import <barcode_reader/barcode_reader-Swift.h>

@implementation BarcodeReaderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBarcodeReaderPlugin registerWithRegistrar:registrar];
}
@end
