# Flutter Barcode Plugin
The sample demonstrates how to create a simple ``Flutter barcode plugin`` with [Dynamsoft Barcode Reader SDK](https://www.dynamsoft.com/Products/Dynamic-Barcode-Reader.aspx).

## What You Should Know
- [![](https://img.shields.io/badge/Download-Offline%20SDK-orange)](https://www.dynamsoft.com/barcode-reader/downloads)
- [![](https://img.shields.io/badge/Get-30--day%20FREE%20Trial%20License-blue)](https://www.dynamsoft.com/customer/license/trialLicense/?product=dbr)

## Usage
Download the source code:

```
git clone https://github.com/yushulx/flutter-barcode-plugin.git
```

Set the license key in ``demo\lib\main.dart``:

```dart
Future<void> initDynamsoftBarcodeReaderState() async {
    _barcodeReader = BarcodeReader();
    await _barcodeReader.initLicense('LICENSE-KEY');
  }
```

Read barcodes from an image file:

```dart
await _controller.takePicture(path);
String results = await _barcodeReader.decodeFile(path);
```

Build and run the app:

**Android**

```
cd demo
flutter run -d <Android Device ID>
```

**iOS**

```
cd demo/ios
pod install
cd ..
flutter run -d <iOS Device ID>
```

![flutter barcode plugin](https://www.codepool.biz/wp-content/uploads/2019/08/flutter-barcode-plugin.png)

## Flutter Barcode Plugin for Android & iOS
To edit and improve the plugin:

**Android**

Import ``barcode_reader/example/android`` to ``Android Studio``.

**iOS**

Import ``barcode_reader/example/ios/Runner.xcworkspace `` to ``Xcode``.

## Reference
- https://flutter.dev/docs/development/packages-and-plugins/developing-packages
- https://flutter.dev/docs/cookbook/plugins/picture-using-camera
- https://pub.dev/packages/camera

## Blog
[How to Create A Simple Flutter Barcode Plugin from Scratch](https://www.codepool.biz/flutter-barcode-plugin.html)
