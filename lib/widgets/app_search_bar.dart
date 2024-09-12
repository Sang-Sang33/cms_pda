import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewDialog extends StatefulWidget {
  const QRViewDialog({
    super.key,
    required this.onClosed,
    required this.onScaned,
  });

  final VoidCallback onClosed;
  final ValueChanged<Barcode> onScaned;

  @override
  State<QRViewDialog> createState() => _QRViewDialogState();
}

class _QRViewDialogState extends State<QRViewDialog> {
  QRViewController? _qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool open = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrViewController!.pauseCamera();
    }
    _qrViewController!.resumeCamera();
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _qrViewController = controller;
    });
    bool scanned = false;
    controller.scannedDataStream.listen(
      (scanData) {
        if (!scanned) {
          scanned = true;
          widget.onScaned(scanData);
          widget.onClosed();
        }
      },
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildQrView(context),
        Positioned(
          left: 30,
          top: 30,
          child: IconButton(
            onPressed: widget.onClosed,
            icon: const Icon(
              Icons.cancel_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: 30,
          child: IconButton(
            onPressed: () async {
              await _qrViewController?.toggleFlash();
              setState(() {
                open = !open;
              });
            },
            icon: Icon(open ? Icons.flashlight_on : Icons.flashlight_off),
          ),
        )
      ],
    );
  }
}

class AppSearchBar extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const AppSearchBar({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  _AppSearchBarState();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      margin: const EdgeInsets.only(bottom: 12),
      child: SearchBar(
        controller: controller,
        hintText: widget.hintText,
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: 12,
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
        leading: const Icon(Icons.search),
        onChanged: widget.onChanged,
        trailing: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (dialogContext) => Dialog.fullscreen(
                  child: QRViewDialog(
                    onClosed: () {
                      Navigator.pop(dialogContext);
                    },
                    onScaned: (value) {
                      setState(() {
                        controller.text = value.code ?? 'undefined';
                      });
                    },
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.qr_code_scanner,
              color: Color(0xff29a1ff),
            ),
          ),
        ],
      ),
    );
  }
}
