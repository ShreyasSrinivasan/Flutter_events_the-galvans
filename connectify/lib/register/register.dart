import 'package:connectify/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = '', password = '', name = '', profileURL = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Stack(children: [
          Positioned(
            top: -290,
            left: 10,
            child: SvgPicture.asset(
              'assets/design-2.svg',
              height: 800,
              fit: BoxFit.scaleDown,
              color: Theme.of(context).primaryColorLight,
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  name = value.trim();
                                });
                              },
                              decoration: const InputDecoration(
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                setState(() {
                                  email = value.trim();
                                });
                              },
                              decoration: const InputDecoration(
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  profileURL = value.trim();
                                });
                              },
                              decoration: const InputDecoration(
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              obscureText: true,
                              onChanged: (value) {
                                setState(() {
                                  password = value.trim();
                                });
                              },
                              decoration: const InputDecoration(
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
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColorDark),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(105, 20, 105, 20),
                        child: Text('Sign up'),
                      ),
                      onPressed: () {
                        AuthServices()
                            .createUserWithEmailPassword(email, password);
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
