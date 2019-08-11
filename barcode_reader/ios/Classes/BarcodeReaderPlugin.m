#import "BarcodeReaderPlugin.h"
#import <DynamsoftBarcodeReader/DynamsoftBarcodeSDK.h>

@implementation BarcodeReaderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"barcode_reader"
            binaryMessenger:[registrar messenger]];
  BarcodeReaderPlugin* instance = [[BarcodeReaderPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];

  DynamsoftBarcodeReader *m_barcodeReader = [[DynamsoftBarcodeReader alloc] init];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }
  else if ([@"initLicense" isEqualToString:call.method]) {
    result(@"initLicense");
  } 
  else if ([@"decodeFile" isEqualToString:call.method]) {
    result(@"decodeFile");
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
