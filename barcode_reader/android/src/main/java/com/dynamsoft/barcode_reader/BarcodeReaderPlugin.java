package com.dynamsoft.barcode_reader;

import java.util.ArrayList;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** BarcodeReaderPlugin */
public class BarcodeReaderPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "barcode_reader");
    channel.setMethodCallHandler(new BarcodeReaderPlugin());
  }

  private BarcodeManager mBarcodeManager;

  public BarcodeReaderPlugin() {
    mBarcodeManager = new BarcodeManager();
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    ArrayList<String> args = (ArrayList<String>)call.arguments;
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("initLicense")) {
      mBarcodeManager.initLicense(args.get(0));
    } else if (call.method.equals("decodeFile")) {
      String results = mBarcodeManager.decodeFile(args.get(0));
      result.success(results);
    } else {
      result.notImplemented();
    }
  }
}
