#import "BarcodeReaderPlugin.h"
#import <DynamsoftBarcodeReader/DynamsoftBarcodeSDK.h>

@implementation BarcodeReaderPlugin
{
  DynamsoftBarcodeReader *barcodeReader;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"barcode_reader"
            binaryMessenger:[registrar messenger]];
  BarcodeReaderPlugin* instance = [[BarcodeReaderPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  NSString *value = call.arguments[0];
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }
  else if ([@"initLicense" isEqualToString:call.method]) {
    barcodeReader = [[DynamsoftBarcodeReader alloc] initWithLicense:value];
  } 
  else if ([@"decodeFile" isEqualToString:call.method]) {
    if (barcodeReader != nil) {
      NSArray* results = [barcodeReader decodeFileWithName:value templateName:@"" error:nil];
      if(results == nil) {
        result(@"No Barcode Detected.");
      }
      else {
        iTextResult* barcode = (iTextResult*)results.firstObject;
        if (barcode.barcodeText == nil) {
          result(@"No Barcode Detected.");
        }
        else {
          NSString* msgText = [NSString stringWithFormat:@"Format: %@, Text: %@.", barcode.barcodeFormatString, barcode.barcodeText];
          result(msgText);
        }
      }
    }
    else {
      result(@"Failed to create barcode reader!");
    }
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
