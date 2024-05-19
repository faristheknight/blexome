import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHEHE extends StatefulWidget {
  const PermissionHEHE({super.key, required this.title});

  final String title;

  @override
  State<PermissionHEHE> createState() => _PermissionHEHEState();
}

class _PermissionHEHEState extends State<PermissionHEHE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                PermissionStatus cameraStatus =
                    await Permission.camera.request();
                print('Camera permission status: $cameraStatus');

                if (cameraStatus.isGranted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Camera permission granted")),
                  );
                } else if (cameraStatus.isDenied) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Camera permission denied")),
                  );
                } else if (cameraStatus.isPermanentlyDenied) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Camera permission permanently denied")),
                  );
                  openAppSettings(); // Open app settings
                }
                print('camera');
              },
              child: const Text('camera'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                PermissionStatus storageStatus =
                    await Permission.storage.request();
                print('Storage permission status: $storageStatus');

                if (storageStatus.isGranted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Storage permission granted")),
                  );
                } else if (storageStatus.isDenied) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Storage permission denied")),
                  );
                } else if (storageStatus.isPermanentlyDenied) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Storage permission permanently denied")),
                  );
                  openAppSettings(); // Open app settings
                }
                print('storage');
              },
              child: const Text('storage'),
            ),
            const SizedBox(height: 16), // Add some space between buttons
            ElevatedButton(
              onPressed: () async {
                PermissionStatus locationStatus =
                    await Permission.location.request();
                print('Location permission status: $locationStatus');

                if (locationStatus.isGranted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Location permission granted")),
                  );
                } else if (locationStatus.isDenied) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Location permission denied")),
                  );
                } else if (locationStatus.isPermanentlyDenied) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text("Location permission permanently denied")),
                  );
                  openAppSettings(); // Open app settings
                }
                print('location');
              },
              child: const Text('location'),
            ),
          ],
        ),
      ),
    );
  }
}
