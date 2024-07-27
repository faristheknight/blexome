import 'package:flutter/foundation.dart';

class BarcodeProvider extends ChangeNotifier {
  String? _barcode;
  bool _isScannerStarted = false; // New property

  String? get barcode => _barcode;
  bool get isScannerStarted => _isScannerStarted;

  void setBarcode(String? newBarcode) {
    _barcode = newBarcode;
    notifyListeners();
  }

  void setScannerStarted(bool isStarted) {
    _isScannerStarted = isStarted;
    notifyListeners();
  }
}
