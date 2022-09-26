import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Stack(children: [
        Positioned(
          top: -330,
          left: 10,
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.rotationZ(-math.pi / 2),
            child: SvgPicture.asset(
              'assets/design.svg',
              height: 800,
              fit: BoxFit.scaleDown,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
        // SizedBox(height: 900),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(100))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                  child: Text(
                    'Create new',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Text(
                    'account',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Text(
                    'Just one step away from network.',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: InputBorder.none,
                              hintText: 'John Smith',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: InputBorder.none,
                              hintText: 'jiaramartins@gmail.com',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'LinkedIn profile URL',
                              border: InputBorder.none,
                              hintText: 'jiaramartins@gmail.com',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Create a password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Sign up',
                      style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
