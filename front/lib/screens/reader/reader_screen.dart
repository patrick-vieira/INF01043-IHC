import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ReaderScreen extends StatelessWidget {
  ReaderScreen({Key? key}) : super(key: key);

  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Scanner'),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
                if (true) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('EconomizaTchê'),
                      content:
                          const Text('Nota fiscal enviada com sucesso. \n\n Obrigado!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, code),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ).then(
                    (value) => Navigator.pop(context, code),
                  );
                } else {
                  Navigator.pop(context, code);
                }
              }
            }));
  }
}
