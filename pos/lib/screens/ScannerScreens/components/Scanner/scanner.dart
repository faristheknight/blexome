import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pos/screens/ScannerScreens/components/ScannerWidgets/scanned_barcode_label.dart';
import 'package:pos/screens/ScannerScreens/components/ScannerWidgets/scanner_button_widgets.dart';
import 'package:pos/screens/ScannerScreens/components/ScannerWidgets/scanner_error_widget.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  final MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
    returnImage: true,
  );
  double _zoomFactor = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeScanner();
  }

  Future<void> _initializeScanner() async {
    // Request camera permission
    final status = await Permission.camera.request();
    if (status.isGranted) {
      // If permission is granted, start the scanner
      controller.start();
    } else {
      // If permission is denied, handle accordingly (show a message, etc.)
      print('Camera permission denied');
    }
  }

  Widget _buildZoomScaleSlider() {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, child) {
        if (!state.isInitialized || !state.isRunning) {
          return const SizedBox.shrink();
        }

        final TextStyle labelStyle = Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.white);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                '0%',
                overflow: TextOverflow.fade,
                style: labelStyle,
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
              Text(
                '100%',
                overflow: TextOverflow.fade,
                style: labelStyle,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: MobileScanner(
              controller: controller,
              errorBuilder: (context, error, child) {
                return ScannerErrorWidget(error: error);
              },
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: ColoredBox(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (!kIsWeb) _buildZoomScaleSlider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ToggleFlashlightButton(controller: controller),
                      StartStopMobileScannerButton(controller: controller),
                      Expanded(
                        child: Center(
                          child: ScannedBarcodeLabel(
                            barcodes: controller.barcodes,
                          ),
                        ),
                      ),
                      AnalyzeImageFromGalleryButton(controller: controller),
                      SwitchCameraButton(controller: controller),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40, // Adjust as needed
            right: 120, // Adjust as needed
            child: StreamBuilder<BarcodeCapture>(
              stream: controller.barcodes,
              builder: (context, snapshot) {
                final barcode = snapshot.data;

                if (barcode == null) {
                  return const Text(
                    'Your scanned barcode will appear here!',
                  );
                }

                final barcodeImage = barcode.image;

                if (barcodeImage == null) {
                  return const Text('No image for this barcode.');
                }

                return Transform.scale(
                  scale: 0.2, // Adjust the scale as needed
                  child: Image.memory(
                    barcodeImage,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Text('Could not decode image bytes. $error');
                    },
                    frameBuilder: (
                      BuildContext context,
                      Widget child,
                      int? frame,
                      bool? wasSynchronouslyLoaded,
                    ) {
                      if (wasSynchronouslyLoaded == true || frame != null) {
                        return Transform.rotate(
                          angle: 90 * pi / 180,
                          child: child,
                        );
                      }

                      return const CircularProgressIndicator();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller.dispose();
  }
}
