import 'package:connectify/login/login.dart';
import 'package:connectify/services/auth.dart';
import 'package:connectify/shared/error.dart';
import 'package:connectify/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                            child: Container(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width *
                                    0.25 /
                                    2),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColorDark,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'Scan QR Code',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        fontWeight: FontWeight.bold)),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                ],
              ),
            );
          } else {
            return const LoginScreen();
          }
        });
  }
}
