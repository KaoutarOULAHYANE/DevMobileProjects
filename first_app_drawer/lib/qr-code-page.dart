import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class QRCodePage extends StatefulWidget {
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  String result;

  Future scanQR() async {
    try {
      String scanResult = await BarcodeScanner.scan();
      setState(() {
        result = scanResult;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unkown error";
        });
      }
    } on FormatException catch (e) {
      print(e);
      result = "Yo pressed de back button befor scanning";
    } catch (e) {
      setState(() {
        result = "Other error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var deepOrangeAccent = Colors.deepOrangeAccent;
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scan'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Text(
          result != null ? result : 'Scan RQ',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.scanner),
        onPressed: scanQR,
        label: Text('QR Scan'),
        backgroundColor: deepOrangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
