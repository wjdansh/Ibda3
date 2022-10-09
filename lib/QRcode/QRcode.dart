import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;

import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'QrModel.dart';

class QRCode extends StatefulWidget {
  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Global.lan == 'Arabic'
                        ? 'assets/images/logoAr.png'
                        : 'assets/images/logoEn.png',
                    width: 180,
                    height: 120,
                  ),
                  //  SizedBox(width: 25),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 15),
                child: Text(
                  'Scan QR Code'.tr,
                  style: TextStyle(color: Colors.grey, fontSize: 22),
                ),
              ),
              Container(
                //color: Colors.white.withOpacity(0.2),
                height: 530,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(child: QRViewExample()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controllerqr;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controllerqr.pauseCamera();
    } else if (Platform.isIOS) {
      controllerqr.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: (result != null)
                    ? Text(
                        'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}',
                        style: TextStyle(color: Colors.grey),
                      )
                    : Text(
                        'Scan a code'.tr,
                        style: TextStyle(color: Colors.grey),
                      ),
              ),
            )
          ],
        ),
      );
    } catch (error) {
      print("error: $error");
      Get.snackbar('Error'.tr, error.toString(),
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }

    ;
  }

  void onQRViewCreated(QRViewController controller) {
    this.controllerqr = controller;

    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });

      Global.GQRResult = result.code;

      Get.toNamed('/qrInfo');
    });
  }

  @override
  void dispose() {
    controllerqr?.dispose();
    super.dispose();
  }
}
