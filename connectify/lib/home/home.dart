import 'package:connectify/login/login.dart';
import 'package:connectify/services/auth.dart';
import 'package:connectify/shared/error.dart';
import 'package:connectify/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  String? result = '';
  Future _scanQR() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      try {
        String? cameraScanResult = await scanner.scan();
        print(cameraScanResult);
        setState(() {
          result =
              cameraScanResult; // setting string result with cameraScanResult
        });
      } on PlatformException catch (e) {
        print(e);
      }
    } else {
      var isGrant = await Permission.camera.request();

      if (isGrant.isGranted) {
        String? cameraScanResult = await scanner.scan();
        print(cameraScanResult);
        setState(() {
          result =
              cameraScanResult; // setting string result with cameraScanResult
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _scanQR();
        Navigator.pushNamed(context, '/profile');
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColorDark),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.25 / 2,
            vertical: 20),
        child: Text(
          'Scan QR Code',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthServices().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return const Center(
              child: ErrorMessage(),
            );
          } else if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Theme.of(context).primaryColorDark,
              body: Stack(
                children: [
                  Positioned(
                    bottom: -450,
                    left: -10,
                    child: SvgPicture.asset(
                      'assets/design-2.svg',
                      height: 800,
                      fit: BoxFit.scaleDown,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: GestureDetector(
                      onTap: () {
                        AuthServices().singout();
                        // Navigator.pushNamed(context, r)
                      },
                      child: SvgPicture.asset(
                        'assets/exit.svg',
                        height: 50,
                        fit: BoxFit.scaleDown,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(75)),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Box for QR
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.width * 0.75,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 10,
                                    color: Theme.of(context).primaryColorDark),
                                borderRadius: BorderRadius.circular(75)),

                            //QR goes here
                            child: Padding(
                              padding: const EdgeInsets.all(18.5),
                              child: QrImage(
                                data: "data123",
                                size: MediaQuery.of(context).size.width * 0.35,
                                backgroundColor:
                                    Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ),
                          const QrScanner()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const LoginScreen();
          }
        });
  }
}
