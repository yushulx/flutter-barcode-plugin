# Flutter Barcode Plugin
The sample demonstrates how to create a simple ``Flutter barcode plugin`` with [Dynamsoft Barcode Reader SDK for Android](https://www.dynamsoft.com/Products/barcode-scanner-sdk-android.aspx).

## Usage
Download the source code:

```
git clone https://github.com/yushulx/flutter-barcode-plugin.git
```

Get a [free 30-day trial license](https://www.dynamsoft.com/CustomerPortal/Portal/Triallicense.aspx) and set it in ``demo\lib\main.dart``:

```dart
Future<void> initDynamsoftBarcodeReaderState() async {
    _barcodeReader = BarcodeReader();
    await _barcodeReader.initLicense('LICENSE-KEY');
  }
```

Change directory to ``demo`` folder and run the app:

```
cd demo
flutter run
```

![flutter barcode plugin](https://www.codepool.biz/wp-content/uploads/2019/08/flutter-barcode-plugin.png)

## Flutter Plugin for Android
To edit and improve the plugin, import ``barcode_reader\example\android`` to ``Android Studio``.
