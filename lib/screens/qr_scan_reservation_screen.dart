import 'dart:developer';
import 'dart:io';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/cubit/aproved_request_cubit/aproved_request_cubit.dart';
import 'package:environment_ucb/screens/finished_reservation_screen.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

String aux = "a";
bool flag = false;


class MyQrScanReservationScreen extends StatefulWidget {
  final int idReservation;

  MyQrScanReservationScreen({Key? key, required this.idReservation}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyQrScanReservationScreenState();
}

class _MyQrScanReservationScreenState extends State<MyQrScanReservationScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = MediaQuery.of(context).size.width * 0.6;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppTheme.primary,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result!.code as String != aux) {
          aux = result!.code as String;
          flag = true;
        }
      });
      if (flag) {
        flag = false;
        //TODO NEED TO IMPLEMENT THE LOGIC TO VALIDATE THE QR CODE
        var alert = AlertDialog(
          title: Text("Ambiente Detectado"),
          content: Container(
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.width * 0.05,
              child: Column(
                children: [
                  Text(result!.code as String),
                ],
              )),
          actions: [
            MyButton(
                fontSize: 10,
                width: 100,
                height: 40,
                color: AppTheme.alert,
                textColor: Colors.white,
                text: "Cancelar",
                onPressed: () {
                  aux = "";
                  Navigator.pop(context);
                }),
            MyButton(
              fontSize: 10,
              width: 100,
              height: 40,
              color: AppTheme.primary,
              textColor: Colors.white,
              text: "Confirmar",
              onPressed: () {
                BlocProvider.of<AprovedRequestCubit>(context)
                    .registerEntrance(result!.code as String, widget.idReservation);
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyFinishedReservationScreen()));

                //Navigator.pushNamed(context, '/finishedScreen');
              },
            ),
          ],
        );
        showDialog(context: context, builder: (context) => alert);
      }
    });
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
    controller?.dispose();
    super.dispose();
  }
}
