import 'package:connectify/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Stack(children: [
          Positioned(
            top: 50,
            left: 50,
            child: GestureDetector(
              onTap: () {
                AuthServices().singout();
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
              child: const ProfileInfo(),
            ),
          )
        ]),
      ),
    );
  }
}

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  String name = 'George Modi',
      role = 'CEO of India',
      phone = '+91 9823456780',
      requestType = 'Connect',
      message =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 225),
                child: Text('NAME'),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: name),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 225),
                child: Text('ROLE'),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: role,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 135),
                child: Text('PHONE NUMBER'),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: phone,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 150),
                child: Text('REQUEST TYPE'),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: requestType),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 200),
                child: Text('MESSAGE'),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: message),
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
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(105, 20, 105, 20),
              child: Text('Confirm'),
            ),
            onPressed: () {
              showAlertDialog(context);
              // Navigator.pushNamed(context, '/');
            },
          ),
        ),
      ],
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
      Navigator.pushNamed(context, '/');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Successful",
      style: TextStyle(color: Colors.green),
    ),
    content: const Text("Sent the request!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
