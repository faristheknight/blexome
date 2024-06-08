import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

import '../ScannerWidgets/scanner_button_widgets.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key}) ;

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
    formats: [BarcodeFormat.all], // Adjust formats as needed
  );
  StreamSubscription<BarcodeCapture>? _subscription;
  double _zoomFactor = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeScanner();
    WidgetsBinding.instance.addObserver(this);
    _subscription = controller.barcodes.listen(_handleBarcode);
  }

  Future<void> _initializeScanner() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      await controller.start();
      if (kDebugMode) {
        print('Camera started successfully');
      }
    } else {
      if (kDebugMode) {
        print('Camera permission denied');
      }
    }
  }

  void _handleBarcode(BarcodeCapture barcodeCapture) {
    if (barcodeCapture.barcodes.isNotEmpty) {
      final barcode = barcodeCapture.barcodes.first;
      final String? code = barcode.rawValue;
      if (code != null) {
        if (kDebugMode) {
          print('Barcode found! $code');
        }
        // Add your code handling logic here
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            errorBuilder: (context, error, child) {
              if (kDebugMode) {
                print('Error: $error');
              }
              return Center(
                child: Text(
                  'Camera error: $error',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            },
            fit: BoxFit.cover,
          ),
          if (!kIsWeb)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5 - 20,
              left: 0,
              right: 0,
              child: _buildZoomScaleSlider(),
            ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToggleFlashlightButton(controller: controller),
                StartStopMobileScannerButton(controller: controller),
                SwitchCameraButton(controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZoomScaleSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Text(
            '0%',
            overflow: TextOverflow.fade,
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Slider(
              value: _zoomFactor,
              onChanged: (value) {
                setState(() {
                  _zoomFactor = value;
                  controller.setZoomScale(value);
                });
              },
            ),
          ),
         const Text(
            '100%',
            overflow: TextOverflow.fade,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (!controller.value.isInitialized) {
      return;
    }
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        controller.stop();
        break;
      case AppLifecycleState.resumed:
        controller.start();
        break;
      case AppLifecycleState.inactive:
        controller.stop();
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription?.cancel();
    controller.dispose();
    super.dispose();
  }
}
