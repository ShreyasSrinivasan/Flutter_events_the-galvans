import 'package:connectify/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(children: [
            Positioned(
              top: -300,
              right: -65,
              child: SvgPicture.asset(
                'assets/design.svg',
                height: 800,
                fit: BoxFit.scaleDown,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    const SizedBox(height: 250),
                    SvgPicture.asset(
                      'assets/connectify-logo.svg',
                      height: 120,
                      fit: BoxFit.scaleDown,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    Text('CONNECTIFY',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Sign in to continue.',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
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
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              password = value.trim();
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColorDark),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                        child: Text('Log in'),
                      ),
                      onPressed: () {
                        AuthServices().loginEmailPassword(email, password);
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'New User? ',
                            style: TextStyle(
                                color: Theme.of(context).primaryColorDark)),
                        TextSpan(
                            text: 'Sign up!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorDark),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/register');
                              })
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
